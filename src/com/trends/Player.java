package com.trends;

import java.util.HashMap;

public class Player {
	private static HashMap<String, Player> playerMap = new HashMap<>();

	public final String name;
	private boolean display;
	public final String id;
	public Team team;

	public Player(String name, Team team, boolean display) {
		this.name = name;
		this.display = display;
		this.id = Game.randomID();
		this.team = team;
		team.addPlayer(this);
	}

	public Player(String name, Team team){
		this(name, team, false);
	}

	public Player getFromId(String id) {
		return playerMap.get(id);
	}

	public void delete() {
		playerMap.remove(id);
	}

	public boolean isDisplay() {
		return display;
	}
}
