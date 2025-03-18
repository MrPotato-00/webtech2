import java.io.*;
import javax.websocket.OnOpen;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
import java.util.*;
import java.util.concurrent.CopyOnWriteArraySet;

@ServerEndpoint("/chat")
public class Server{
	private static Set<Session> clients= new CopyOnWriteArraySet<>();

	@OnOpen
	public void onOpen(Session session){	
		clients.add(session);
		System.out.println("New client connected: "+ session.getId());
	}

	@OnMessage
	public void onMessage(String message, Session session){
		System.out.println("Message received: "+ message);
		//broadcast(message);
		try{	
			for(Session client: clients){
				if(client==session){
					client.getBasicRemote().sendText("Good day to you sir!");
				}
			}
		}
		catch(Exception e){
			System.out.println("This will not work!");
		}
		
	}

	@OnClose
	public void onClose(Session session){
		clients.remove(session);
		System.out.println("Client disconnected "+session.getId());
	}


}
