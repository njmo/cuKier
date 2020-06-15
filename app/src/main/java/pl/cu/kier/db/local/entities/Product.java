package pl.cu.kier.db.local.entities;

import androidx.room.ColumnInfo;
import androidx.room.Entity;
import androidx.room.PrimaryKey;

@Entity(tableName = "products")
public class Product {
    @PrimaryKey(autoGenerate = true)
    @ColumnInfo(name = "product_id")
    public long id;

    @ColumnInfo( name = "name")
    public String name;

    @ColumnInfo(name = "fat")
    public float fat;

    @ColumnInfo(name = "carbohydrate")
    public float carbohydrate;

    @ColumnInfo(name = "protein")
    public float protein;

    @ColumnInfo(name = "fiber")
    public float fiber;
}
