package pl.cu.kier.db.local.entities;

import androidx.room.ColumnInfo;
import androidx.room.Entity;
import androidx.room.PrimaryKey;

import java.sql.Date;
import java.sql.Time;

@Entity(tableName = "finger_check")
public class FingerCheck {
    @PrimaryKey(autoGenerate = true)
    @ColumnInfo(name = "finger_check_id")
    public long id;

    @ColumnInfo(name = "bg")
    public float bg;

    @ColumnInfo(name = "date")
    public Date date;
}
