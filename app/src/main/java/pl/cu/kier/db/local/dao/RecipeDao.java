package pl.cu.kier.db.local.dao;

import androidx.room.Dao;
import androidx.room.Insert;
import androidx.room.OnConflictStrategy;
import androidx.room.Query;

import java.util.List;

import pl.cu.kier.db.local.entities.Recipe;

@Dao
public interface RecipeDao {
    @Query("SELECT * FROM recipes")
    public List<Recipe> getAll();

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    public void insertRecipe(Recipe recipe);
}
