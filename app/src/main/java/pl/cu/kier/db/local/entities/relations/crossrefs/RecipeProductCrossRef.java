package pl.cu.kier.db.local.entities.relations.crossrefs;

import androidx.room.Entity;
import androidx.room.Ignore;

@Entity(primaryKeys = {"recipe_id", "product_id"})
public class RecipeProductCrossRef {
    public long recipe_id;
    public long product_id;

    public RecipeProductCrossRef(long recipe_id, long product_id)
    {
        this.recipe_id = recipe_id;
        this.product_id = product_id;
    }
}
