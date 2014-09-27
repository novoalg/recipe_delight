package org.no_ip.yavin_tostitos.uhack;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.text.Html;
import android.text.method.LinkMovementMethod;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.google.android.gms.plus.PlusShare;


public class Recipes extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_recipes);

        Intent intent = getIntent();
        String id = intent.getExtras().get("ID").toString();
        String name = intent.getExtras().get("RecipeName").toString();

        final TextView text = (TextView) findViewById(R.id.text_recipeName);
        final TextView description = (TextView) findViewById(R.id.text_description);

        text.setText(name);
        final ImageView image = (ImageView) findViewById(R.id.image_recipe);

        ImageButton shareButton = (ImageButton) findViewById(R.id.google_plus);

        shareButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // Launch the Google+ share dialog with attribution to your app.
                Intent shareIntent = new PlusShare.Builder(Recipes.this)
                        .setType("text/plain")
                        .setText("Check out this recipe brought to you by RecipeDelight!")
                        .setContentUrl(Uri.parse("https://developers.google.com/+/"))
                        .getIntent();

                startActivityForResult(shareIntent, 0);
            }
        });

        if(name.equals("Cheesecake")){
            String desc = "Prep Time: 18 minutes<br />" +
                    "Cook Time: 1 hour, 30 minutes<br />" +
                    "Total Time: 2 hours<br />" +
                    "Yield: 12-16 servings<br /><br /><a href='http://www.gimmesomeoven.com/lighter-blueberry-cheesecake/'>Website</a>";
            image.setImageResource(R.drawable.cheesecake);
            description.setClickable(true);
            description.setMovementMethod(LinkMovementMethod.getInstance());
            description.setText(Html.fromHtml(desc));

        } else if(name.equals("Mac n Cheese")) {
            String desc = "Prep Time: 10 minutes<br />" +
                    "Cook Time: 25 minutes<br />" +
                    "Total Time: 45 minutes<br />" +
                    "Yield: 6-8 servings<br /><br /><a href='http://www.foodnetwork.com/recipes/alton-brown/stove-top-mac-n-cheese-recipe.html'>Website</a>";
            image.setImageResource(R.drawable.macncheese);
            description.setClickable(true);
            description.setMovementMethod(LinkMovementMethod.getInstance());
            description.setText(Html.fromHtml(desc));
        }
    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.recipes, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();
        if (id == R.id.action_settings) {
            return true;
        }
        return super.onOptionsItemSelected(item);
    }


}
