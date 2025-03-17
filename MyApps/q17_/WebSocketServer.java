package websocket.chat;

import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

@ServerEndpoint("/chat")
public class WebSocketServer {

    private static Set<Session> clients = new CopyOnWriteArraySet<>();

    // When a new client connects
    @OnOpen
    public void onOpen(Session session) {
        clients.add(session);
        System.out.println("New client connected: " + session.getId());
        sendMessageToAll("New user joined the chat!");
    }

    // When a message is received from a client
    @OnMessage
    public void onMessage(String message, Session session) throws Exception {

        // sendMessageToAll("User " + session.getId() + ": " + message); // Broadcast
        // message
        System.out.println("Message received");
        for (Session client : clients) {
            client.getBasicRemote().sendText("User " + session.getId() + ": " + message);
        }

    }

    // When a client disconnects
    @OnClose
    public void onClose(Session session) {
        clients.remove(session);
        System.out.println("Client disconnected: " + session.getId());
        sendMessageToAll("A user left the chat.");
    }

    // When an error occurs
    @OnError
    public void onError(Session session, Throwable throwable) {
        throwable.printStackTrace();
    }

    // Server method to send a message to all clients
    private void sendMessageToAll(String message) {
        for (Session client : clients) {
            try {
                client.getBasicRemote().sendText(message);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
