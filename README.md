# ComposerKit

Make your `UICollectionViewCompositionalLayout` in DSL style!
> Work in Progress...

```swift
var composeLayout = UICollectionViewComposeLayout { env in
    Section {
        Group(style: .flow) {
            for _ in (1...4) {
                Item(
                    style: .grid(
                        width: .fractionalWidth(0.5),
                        height: .fractionalWidth(0.5)
                    )
                )
            }
        }
        .interItemSpacing(.fixed(8.0))
    }
    .interGroupSpacing(8.0)
    .orthogonalScrolling(.groupPaging)
    .boundaryItems {
        BoundaryItem(.header)
            .widthDimension(.fractionalWidth(1.0))
            .heightDimension(.absolute(100))
        BoundaryItem(.footer)
            .widthDimension(.fractionalWidth(1.0))
            .heightDimension(.absolute(150))
    }
    
    Section {
        Group(style: .grid) {
            for _ in (1...10) {
                Item()
                    .size(.fractionalWidth(1.0 / 10))
            }
        }
    }
}.interSectionSpacing(12.0)
```
