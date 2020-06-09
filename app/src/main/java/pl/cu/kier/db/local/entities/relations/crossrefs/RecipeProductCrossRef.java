package pl.cu.kier.db.local.entities.relations.crossrefs;

import androidx.room.Entity;

@Entity(primaryKeys = {"recipe_id", "product_id"})
public class RecipeProductCrossRef {
    public long recipe_id;
    public long product_id;
}
