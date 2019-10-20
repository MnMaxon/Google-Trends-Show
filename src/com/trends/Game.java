package com.trends;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.*;

public class Game {
	private static HashMap<String, Game> gameMap = new HashMap<>();

	public final List<Team> teamList = new ArrayList<Team>();
	private List<String> wordList;
	public int timeLimit;
	int resultTime = 10;
	public final String id;
	private int round = 0;
	boolean showingResults = true;
	long roundEndTime = -1;
	Timer timer = new Timer();
	public Player leader = null;


	public Game(List<String> wordList, int timeLimit, String id) {
		this.wordList = wordList;
		this.timeLimit = timeLimit;
		this.id = id;
		gameMap.put(id, this);
		System.out.println("Game Created with id: " + id);
	}

	public Game(List<String> wordList, int timeLimit) {
		this(wordList, timeLimit, randomID());
	}

	public Player getPlayerFromName(String name) {
		for (Team t : teamList) {
			Player p = t.playerMap.get(name);
			if (p != null) return p;
		}
		return null;
	}
	public Team getTeamFromName(String name) {
		for (Team t : teamList) {
			if (t.name.equals(name)) return t;
		}
		return null;
	}

	public Team addTeam(String name) {
		Team t = new Team(name);
		teamList.add(t);
		return t;
	}

	public static String randomID() {
		String id = "";
		Random r = new Random(new Date().getTime());
		for (int i = 0; i < 5; i++) {
			char c = (char) (r.nextInt(24)+'a');
			id += c;
		}
		return id;
	}

	public String getWord() {
		if (getRound() <= 0 || getRound() >= wordList.size() + 1) return null;
		return wordList.get(getRound() - 1);
	}

	public void start() {
		if (getRound() != 0) return;
		round = 1;
		roundEndTime = new Date().getTime() + timeLimit * 1000;
		timer.schedule(new RemindTask(), timeLimit * 1000);
	}

	public long getRoundEndTime() {
		return roundEndTime;
	}

	public void delete() {
		gameMap.remove(id);
		for (Team team : teamList) team.delete();
		teamList.clear();
	}

	void nextRound() {
		if (getRound() > wordList.size()) {
			delete();
			return;
		}
		showingResults = false;
		round = getRound() + 1;
		roundEndTime = new Date().getTime() + timeLimit * 1000;
		timer.schedule(new RemindTask(), timeLimit * 1000);
	}

	void showResults() {
		showingResults = true;
		calcPoints();
		roundEndTime = new Date().getTime() + timeLimit * 1000;
		timer.schedule(new RemindTask(), timeLimit * 1000);
	}

	public int getRound() {
		return round;
	}

	class RemindTask extends TimerTask {
		public void run() {
			if (showingResults) nextRound();
			else showResults();
		}
	}

	public int[] calcPoints() {
		String s = null;
		int[] ret = new int[teamList.size()];
		try {

			String searchTerms = null;
			for (Team team : teamList) {
				if (team.word == null) continue;
				String word = team.word.split(" ")[0];
				team.word = "";
				for (char c : word.toCharArray()) if (Character.isAlphabetic(c)) team.word += c;
				if (team.word.equals("")) {
					team.word = null;
					continue;
				}
				if (searchTerms == null) searchTerms = word + "_" + team.word;
				else searchTerms += "," + word + "_" + team.word;
			}
			if (searchTerms == null) return ret;
			// run the Unix "ps -ef" command
			// using the Runtime exec method:

			Process proc = Runtime.getRuntime().exec("python C:/pytrends/pytrends.py " + searchTerms + " time=\"[[2018,10,18],[2018,10,18]]\" title=\"Interest over time\"");

			BufferedReader stdInput = new BufferedReader(new
					InputStreamReader(proc.getInputStream()));

			BufferedReader stdError = new BufferedReader(new
					InputStreamReader(proc.getErrorStream()));

			// read the output from the command
			System.out.println("Here is the standard output of the command:\n");
			while ((s = stdInput.readLine()) != null) System.out.println(s);//TODO PARSE THIS, and award points

			// read any errors from the attempted command
			// System.out.println("Here is the standard error of the command (if any):\n");
			//while ((s = stdError.readLine()) != null) {
			//   System.out.println(s);
			//}

		} catch (IOException e) {
			System.out.println("exception happened - here's what I know: ");
			e.printStackTrace();
		}
		return ret;
	}

	public static Game getFromId(String id){
		return gameMap.get(id);
	}

	public static Set<String> gameList(){
		return gameMap.keySet();
	}
}