package pl.cu.kier.db.local.entities.relations;

import androidx.room.Embedded;
import androidx.room.Entity;
import androidx.room.Junction;
import androidx.room.Relation;

import java.util.List;

import pl.cu.kier.db.local.entities.Product;
import pl.cu.kier.db.local.entities.Recipe;
import pl.cu.kier.db.local.entities.relations.crossrefs.RecipeProductCrossRef;

@Entity(primaryKeys = {"recipe_id", "product_id"})
public class RecipeWithProducts {
    @Embedded public Recipe recipe;
    @Relation(
            parentColumn = "recipe_id",
            entityColumn = "product_id",
            associateBy = @Junction(RecipeProductCrossRef.class)
    )
    public List<Product> products;
}
