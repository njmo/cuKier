package pl.cu.kier.db.local;

import androidx.room.Database;
import androidx.room.RoomDatabase;
import androidx.room.TypeConverters;

import pl.cu.kier.db.local.converters.DateConverter;
import pl.cu.kier.db.local.dao.ProfileDao;
import pl.cu.kier.db.local.dao.RecipeDao;
import pl.cu.kier.db.local.entities.Dose;
import pl.cu.kier.db.local.entities.Product;
import pl.cu.kier.db.local.entities.Profile;
import pl.cu.kier.db.local.entities.Recipe;
import pl.cu.kier.db.local.entities.relations.crossrefs.RecipeProductCrossRef;

@Database(entities = {Profile.class, Recipe.class, Product.class, RecipeProductCrossRef.class, Dose.class}, version = 1)
@TypeConverters({DateConverter.class})
public abstract class AppDatabase extends RoomDatabase {
    public abstract ProfileDao profileDao();
    public abstract RecipeDao recipeDao();
}
