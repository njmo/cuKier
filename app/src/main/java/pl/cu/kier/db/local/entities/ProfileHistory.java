package pl.cu.kier.db.local.entities;

import androidx.room.ColumnInfo;
import androidx.room.Entity;
import androidx.room.PrimaryKey;

import java.sql.Date;

@Entity(tableName = "profile_history")
public class ProfileHistory {
    @PrimaryKey(autoGenerate = true)
    @ColumnInfo(name = "profile_history_id")
    public long id;

    @ColumnInfo(name="profile_id")
    public long profile_id;

    @ColumnInfo(name = "start_date")
    public Date start_date;

    @ColumnInfo(name = "end_date")
    public Date end_date;
}
