package pl.cu.kier.db.local.dao;

import androidx.room.Dao;
import androidx.room.Insert;
import androidx.room.OnConflictStrategy;
import androidx.room.Query;

import java.util.List;

import pl.cu.kier.db.local.entities.Profile;

@Dao
public interface ProfileDao {
    @Query("SELECT * FROM profiles")
    public List<Profile> getAll();

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    public void insertProfile(Profile recipe);
}
