import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/widgets/recipe_item_triats.dart';
import 'package:transparent_image/transparent_image.dart';

class RecipeItem extends StatelessWidget {
  const RecipeItem({
    super.key,
    required this.recipe,
    required this.onSelectedRecipe,
  });
  final Recipe recipe;
  final void Function(Recipe recipe) onSelectedRecipe;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        onTap: () {
          onSelectedRecipe(recipe);
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(recipe.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 44),
                color: Colors.black54,
                child: Column(children: [
                  Text(
                    recipe.title,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RecipeItemTraits(
                          icon: Icons.schedule,
                          label: '${recipe.duration} min'),
                      RecipeItemTraits(
                          icon: Icons.attach_money_outlined,
                          label: '${recipe.price}'),
                    ],
                  )
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
