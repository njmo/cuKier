package pl.cu.kier.db.local.entities;

import androidx.room.ColumnInfo;
import androidx.room.Entity;
import androidx.room.PrimaryKey;

import java.sql.Date;
import java.sql.Time;

@Entity(tableName = "profile_history")
public class ProfileHistory {
    @PrimaryKey(autoGenerate = true)
    @ColumnInfo(name = "profile_history_id")
    public long id;

    @ColumnInfo(name="profile_id")
    public long profile_id;

    @ColumnInfo(name = "start_date")
    public Date start_date;

    @ColumnInfo(name = "start_time")
    public Time start_time;

    @ColumnInfo(name = "end_date")
    public Date end_date;

    @ColumnInfo(name = "end_time")
    public Time end_time;
}
