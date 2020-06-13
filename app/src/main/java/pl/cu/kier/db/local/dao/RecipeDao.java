package pl.cu.kier.db.local.dao;

import android.util.Log;

import androidx.room.Dao;
import androidx.room.Insert;
import androidx.room.OnConflictStrategy;
import androidx.room.Query;
import androidx.room.Transaction;

import java.util.List;

import pl.cu.kier.db.local.entities.Product;
import pl.cu.kier.db.local.entities.Recipe;
import pl.cu.kier.db.local.entities.relations.RecipeWithProducts;
import pl.cu.kier.db.local.entities.relations.crossrefs.RecipeProductCrossRef;

@Dao
public abstract class RecipeDao {
    @Query("SELECT * FROM recipes")
    abstract public List<Recipe> getAll();

    @Query("SELECT * FROM products")
    abstract public List<Product> getAllProducts();

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    abstract public long insertRecipe(Recipe recipe);

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    abstract public long insertProduct(Product product);

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    abstract public void insertCrossRef(RecipeProductCrossRef crf);

    @Transaction
    @Query("SELECT * FROM recipes")
    abstract public List<RecipeWithProducts> getAllRecipes();

    public void insertRecipe(Recipe recipe, List<Product> products)
    {
        long r_id = insertRecipe(recipe);

        for(Product product : products)
        {
            long p_id = insertProduct(product);

            RecipeProductCrossRef ref = new RecipeProductCrossRef();
            ref.product_id = p_id;
            ref.recipe_id = r_id;
            insertCrossRef(ref);
        }
    }
}
