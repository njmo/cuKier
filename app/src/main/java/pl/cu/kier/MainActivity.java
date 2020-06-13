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

import java.util.ArrayList;
import java.util.List;

import pl.cu.kier.db.local.AppDatabase;
import pl.cu.kier.db.local.entities.Product;
import pl.cu.kier.db.local.entities.Profile;
import pl.cu.kier.db.local.entities.Recipe;
import pl.cu.kier.db.local.entities.relations.RecipeWithProducts;

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
        profile.name = "Twoja stara";
        db.profileDao().insertProfile(profile);

        Recipe recipe = new Recipe();
        recipe.name = "katamusata";

        List<Product> pr = new ArrayList<Product>();

        Product product = new Product();
        product.carbohydrate = 12;
        product.fat = 1;
        product.fiber = 2;
        product.protein = 5;
        pr.add(product);

        Product product2 = new Product();
        product2.carbohydrate = 13;
        product2.fat = 1;
        product2.fiber = 2;
        product2.protein = 5;
        pr.add(product2);

        db.recipeDao().insertRecipe(recipe, pr);

        RecipeWithProducts recipeWithProducts2 = db.recipeDao().getAllRecipes().get(0);

        Log.v("njmopedalino", recipeWithProducts2.recipe.name);

        for(Product p : recipeWithProducts2.products)
        {
            Log.v("njmopedalino", Float.toString(p.carbohydrate));
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