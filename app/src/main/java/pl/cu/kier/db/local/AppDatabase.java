package pl.cu.kier.db.local;

import androidx.room.Database;
import androidx.room.RoomDatabase;

import pl.cu.kier.db.local.dao.ProfileDao;
import pl.cu.kier.db.local.dao.RecipeDao;
import pl.cu.kier.db.local.entities.Profile;
import pl.cu.kier.db.local.entities.Recipe;

@Database(entities = {Profile.class, Recipe.class}, version = 1)
public abstract class AppDatabase extends RoomDatabase {
    public abstract ProfileDao profileDao();
    public abstract RecipeDao recipeDao();
}
