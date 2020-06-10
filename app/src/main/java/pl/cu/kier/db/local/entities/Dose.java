package pl.cu.kier.db.local.entities;

import androidx.room.ColumnInfo;
import androidx.room.Entity;
import androidx.room.ForeignKey;
import androidx.room.PrimaryKey;

import java.sql.Date;
import java.sql.Time;

@Entity(tableName = "doses")
public class Dose {
    @PrimaryKey(autoGenerate = true)
    @ColumnInfo(name = "dose_id")
    public long id;

    @ForeignKey(entity = Recipe.class, parentColumns = "dose_id", childColumns = "recipe_id")
    public long recipe_id;

    @ForeignKey(entity = Profile.class, parentColumns = "dose_id", childColumns = "profile_id")
    public long profile_id;

    @ColumnInfo(name = "amount")
    public float amount;

    @ColumnInfo(name = "portion")
    public float portion;

    @ColumnInfo(name = "date")
    public Date date;

    @ColumnInfo(name = "time")
    public Time time;
}
