# K-Means Clustering

# Importing the dataset
dataset = read.csv('mall.csv')
X = dataset[4:5]

# Using the elbow method to find the optimal number of clusters
set.seed(6)
wcss = vector()
for (i in 1:10) wcss[i] = sum(kmeans(X, i)$withinss)
plot(x = 1:10,
     y = wcss,
     type = 'b',
     main = paste('The Elbow Method'),
     xlab = 'Number of clusters',
     ylab = 'WCSS')
#Ten kod jest napisany w języku R i również służy do wykorzystania metody "elbow" w celu znalezienia optymalnej liczby klastrów.
#Kod wykorzystuje funkcję kmeans z pakietu stats, która przeprowadza klasteryzację metodą k-means. Pętla for iteruje od 1 do 10 i dla każdej liczby klastrów przeprowadza klasteryzację i oblicza wartość WCSS (Within-Cluster Sum of Squares) za pomocą funkcji sum(kmeans(X, i)$withinss). Wartości WCSS są przechowywane w wektorze wcss.
#Następnie, wykres WCSS w zależności od liczby klastrów jest rysowany za pomocą funkcji plot. Argument x zawiera numery klastrów, a argument y zawiera wartości WCSS. Argument type = 'b' oznacza, że punkty zostaną połączone linią. Tytuł i etykiety osi wykresu są ustawione za pomocą argumentów main, xlab i ylab.

# Fitting K-Means to the dataset
set.seed(29)
kmeans = kmeans(x = X,
                centers = 5,
                iter.max = 300,
                nstart = 10)
#Ten kod jest napisany w języku R i służy do przeprowadzenia klasteryzacji metodą k-means na zbiorze danych X.
#Funkcja kmeans z pakietu stats jest używana do przeprowadzenia klasteryzacji. Argument x zawiera dane, które mają być poddane klasteryzacji. Argument centers określa liczbę klastrów, jakie mają zostać utworzone. Argument iter.max określa maksymalną liczbę iteracji algorytmu, a argument nstart określa liczbę losowych startów algorytmu, co pozwala na znalezienie lepszego minimum lokalnego.
#Dodatkowo, funkcja set.seed(29) ustawia ziarno losowości na 29, co zapewnia, że wyniki będą powtarzalne przy każdym uruchomieniu kodu.
#Po wykonaniu klasteryzacji, wyniki są przechowywane w obiekcie kmeans.

# Visualising the clusters
library(cluster)
clusplot(x = X,
         clus = kmeans$cluster,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste('Clusters of customers'),
         xlab = 'Annual Income',
         ylab = 'Spending Score')
