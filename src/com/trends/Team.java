package com.trends;

import java.util.HashMap;

public class Team {
	public final String name;
	HashMap<String, Player> playerMap = new HashMap<>();
	private final String id;
	public int points = 0;
	public int addedPoints = 0;
	public String word = "";

	public Team(String name) {
		this.name = name;
		id = Game.randomID();
	}

	public void addPlayer(Player player) {
		playerMap.put(player.id, player);
	}

	public void delete() {
		for (Player p : playerMap.values()) p.delete();
		playerMap.clear();
	}
}
