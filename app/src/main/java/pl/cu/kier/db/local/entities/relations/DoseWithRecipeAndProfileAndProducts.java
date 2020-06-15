package pl.cu.kier.db.local.entities.relations;

import androidx.room.Embedded;
import androidx.room.Junction;
import androidx.room.Relation;

import java.util.List;

import pl.cu.kier.db.local.entities.Dose;
import pl.cu.kier.db.local.entities.Product;
import pl.cu.kier.db.local.entities.Profile;
import pl.cu.kier.db.local.entities.Recipe;
import pl.cu.kier.db.local.entities.relations.crossrefs.RecipeProductCrossRef;

public class DoseWithRecipeAndProfileAndProducts {
    @Embedded public Dose dose;

    @Relation(
            parentColumn = "recipe_id",
            entityColumn = "recipe_id"
    )
    public Recipe recipe;

    @Relation(
            parentColumn = "recipe_id",
            entityColumn = "product_id",
            associateBy = @Junction(RecipeProductCrossRef.class)
    )
    public List<Product> products;

    @Relation(
            parentColumn = "profile_id",
            entityColumn = "profile_id"
    )
    public Profile profile;
}