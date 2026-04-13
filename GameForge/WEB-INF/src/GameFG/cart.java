package GameFG;

import java.util.ArrayList;
import java.util.List;

public class cart {

    private List <game> items;

    public cart() {
        items = new ArrayList<>();
    }

    public List<game> getItems() {
        return items;
    }

    public void addItem(game g) {
        items.add(g);
    }

    public void removeItem(String gameId) {
        items.removeIf(g -> g.getGameID().equals(gameId));
    }

    public double getTotal() {
        double total = 0;
        for (game g : items) {
            total += g.getGamePrice();
        }
        return total;
    }

    public boolean isEmpty() {
        return items.isEmpty();
    }

    public void clear() {
        items.clear();
    }
}