package pl.cu.kier.db.local.entities;

import androidx.annotation.NonNull;
import androidx.room.ColumnInfo;
import androidx.room.Entity;
import androidx.room.PrimaryKey;

@Entity(tableName = "products")
public class Product {
    @PrimaryKey
    @ColumnInfo(name = "product_id")
    @NonNull
    public long id;

    @ColumnInfo(name = "fat")
    @NonNull
    public float fat;

    @ColumnInfo(name = "carbohydrate")
    @NonNull
    public float carbohydrate;

    @ColumnInfo(name = "protein")
    @NonNull
    public float protein;

    @ColumnInfo(name = "fiber")
    @NonNull
    public float fiber;
}
