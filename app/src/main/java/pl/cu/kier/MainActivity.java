package pl.cu.kier;

import android.os.Bundle;

import com.google.android.material.floatingactionbutton.FloatingActionButton;
import com.google.android.material.snackbar.Snackbar;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.room.Room;

import android.util.Log;
import android.view.View;

import android.view.Menu;
import android.view.MenuItem;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import pl.cu.kier.db.local.AppDatabase;
import pl.cu.kier.db.local.entities.Dose;
import pl.cu.kier.db.local.entities.Product;
import pl.cu.kier.db.local.entities.Profile;
import pl.cu.kier.db.local.entities.Recipe;
import pl.cu.kier.db.local.entities.relations.DoseWithRecipeAndProfileAndProducts;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Toolbar toolbar = findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        FloatingActionButton fab = findViewById(R.id.fab);
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Snackbar.make(view, "Replace with your own action", Snackbar.LENGTH_LONG)
                        .setAction("Action", null).show();
            }
        });
        AppDatabase db = Room.databaseBuilder(getApplicationContext(), AppDatabase.class, "cu-kier").allowMainThreadQueries().build();
        Profile profile = new Profile();
        profile.name = "Lewy posladek";
        long profile_id = db.profileDao().insertProfile(profile);

        Recipe recipe = new Recipe();
        recipe.name = "kaszotto";

        List<Product> pr = new ArrayList<Product>();

        Product product = new Product();
        product.name = "kasza";
        product.carbohydrate = 12;
        product.fat = 1;
        product.fiber = 2;
        product.protein = 5;
        pr.add(product);

        Product product2 = new Product();
        product2.name = "zjemniak";
        product2.carbohydrate = 13;
        product2.fat = 1;
        product2.fiber = 2;
        product2.protein = 5;
        pr.add(product2);

        long r_id = db.recipeDao().insertRecipe(recipe, pr);

        Dose dose = new Dose();
        dose.recipe_id = r_id;
        dose.profile_id = profile_id;
        dose.amount = 1.025;
        dose.portion = 1.50;
        dose.date = new Date(System.currentTimeMillis());

        db.profileDao().insertDose(dose);

        DoseWithRecipeAndProfileAndProducts df = db.recipeDao().getAllDoses().get(0);

        Log.v("njmopedalino", "profile_name = " + df.profile.name);
        Log.v("njmopedalino", "recipe_name = " +  df.recipe.name);
        DateFormat ddf = new SimpleDateFormat("dd:MM:yy:HH:mm:ss");
        Log.v("njmopedalino", "date = " +  ddf.format(df.dose.date));

        for(Product p : df.products)
        {
            Log.v("njmopedalino", "product_name = " +  p.name);
        }
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }
}