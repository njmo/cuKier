package pl.cu.kier.db.local.entities;

import androidx.annotation.NonNull;
import androidx.room.ColumnInfo;
import androidx.room.Entity;
import androidx.room.PrimaryKey;

@Entity(tableName = "profiles")
public class Profile {
    @PrimaryKey
    @ColumnInfo(name = "profile_id")
    public long id;

    @ColumnInfo(name = "name")
    @NonNull
    public String name;
}
