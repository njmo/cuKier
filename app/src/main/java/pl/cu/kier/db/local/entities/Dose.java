package pl.cu.kier.db.local.entities;

import androidx.annotation.NonNull;
import androidx.room.ColumnInfo;
import androidx.room.Entity;
import androidx.room.PrimaryKey;

@Entity(tableName = "doses")
public class Dose {
    @PrimaryKey
    @NonNull
    @ColumnInfo(name = "dose_id")
    public long id;

    @PrimaryKey
    @NonNull
    public long recipe_id;

    @PrimaryKey
    @NonNull
    public long profile_id;

    @ColumnInfo(name = "amount")
    @NonNull
    public float amount;
}
