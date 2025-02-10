import java.io.*;
import java.websocket.*;
import java.util.concurrent.CopyOnWriteArraySet;

@ServerEndpoing("/chat")
public class Server{
	private static Set<Session> clients= new CopyOnWriteArraySet<>();

	@OnOpen
	public void onOpen(Session session){
		clients.add(session);
		System.out.println("New client connected: "+ session.getId());
	}

	@OnMessage
	public void onMessage(String message, Session session){
		System.out.println("Message received: "+message);
		broadcast(message);
	}

	@OnClose
	public void onClose(Session session){
		clients.remove(session);
		System.out.println("Client disconnected "+session.getId());
	}

	private static void broadcast(String message){
		for(Session client: clients){
			try{
				client.getBasicRemote().sendText(message);
			}
			catch(IOException e){
				e.printStackTrace();
			}
		}
	}
}
