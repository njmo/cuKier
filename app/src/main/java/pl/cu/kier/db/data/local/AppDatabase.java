package pl.cu.kier.db.data.local;

import androidx.room.Database;
import androidx.room.RoomDatabase;

import pl.cu.kier.db.data.local.dao.ProfileDao;
import pl.cu.kier.db.data.local.dao.RecipeDao;

@Database(entities = {Profile.class, Recipe.class}, version = 1)
public abstract class AppDatabase extends RoomDatabase {
    public abstract ProfileDao profileDao();
    public abstract RecipeDao recipeDao();
}
