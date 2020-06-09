package pl.cu.kier.db.local.entities;

import androidx.annotation.NonNull;
import androidx.room.ColumnInfo;
import androidx.room.Entity;
import androidx.room.PrimaryKey;

@Entity(tableName = "recipes")
public class Recipe {
    @PrimaryKey
    @ColumnInfo(name = "recipe_id")
    public long id;

    @ColumnInfo(name = "name")
    @NonNull
    public String name;
}
