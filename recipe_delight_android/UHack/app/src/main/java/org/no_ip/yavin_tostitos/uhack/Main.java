package org.no_ip.yavin_tostitos.uhack;

import android.app.Activity;
import android.app.ListActivity;
import android.graphics.Bitmap;
import android.os.Bundle;
import android.provider.MediaStore;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.content.Intent;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.PopupWindow;
import android.widget.TextView;

import com.google.zxing.integration.android.IntentIntegrator;
import com.google.zxing.integration.android.IntentResult;

import java.text.BreakIterator;
import java.util.ArrayList;


public class Main extends Activity {
    private static final int CAMERA_REQUEST = 1888;
    public static final int BARCODE_REQUEST = 0x0000c0de;

    private BreakIterator elemQuery;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        final Button button_scan = (Button) findViewById(R.id.button_scan);
        button_scan.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                IntentIntegrator integrator = new IntentIntegrator(Main.this);
                integrator.initiateScan();
            }
        });
        final Button button_recipe = (Button) findViewById(R.id.button_recipes);
        button_recipe.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                Intent recipesIntent = new Intent(Main.this, RecipeList.class);
                startActivity(recipesIntent);
            }
        });

        ListView listView = (ListView) findViewById(R.id.list_items);

        ArrayList<String> products = new ArrayList<String>();
        products.add("5 Eggs");
        products.add("9 1/3 Tbs butter");
        ArrayAdapter<String> adapter = new ArrayAdapter<String>(this,
                android.R.layout.simple_list_item_1, products);

        listView.setAdapter(adapter);
    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
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

    public void onActivityResult(int requestCode, int resultCode, Intent intent) {
//        ImageView imageView = (ImageView)this.findViewById(R.id.imageView2);
//        if (requestCode == BARCODE_REQUEST && resultCode == RESULT_OK) {
//            Bitmap photo = (Bitmap) intent.getExtras().get("data");
//            imageView.setImageBitmap(photo);
//        }

        switch (requestCode) {
            case IntentIntegrator.REQUEST_CODE:
                if (resultCode == Activity.RESULT_OK) {

                    IntentResult intentResult =
                            IntentIntegrator.parseActivityResult(requestCode, resultCode, intent);

                    if (intentResult != null) {

                        String contents = intentResult.getContents();
                        String format = intentResult.getFormatName();

                        final TextView text = (TextView) findViewById(R.id.text_barcode);

                        text.setText(contents);

                        System.out.printf("CONTENTS"+contents);

//                        this.elemQuery.setText(contents);
//                        this.resume = false;
                        Log.d("SEARCH_EAN", "OK, EAN: " + contents + ", FORMAT: " + format);
                    } else {
                        Log.e("SEARCH_EAN", "IntentResult je NULL!");
                    }
                } else if (resultCode == Activity.RESULT_CANCELED) {
                    Log.e("SEARCH_EAN", "CANCEL");
                }
        }
    }
}
