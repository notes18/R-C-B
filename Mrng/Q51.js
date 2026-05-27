// ==========================
// JAVASCRIPT SOLVED FILE
// ==========================

const movies = [
{
    title: "Inception",
    rating: 8.8,
    genres: ["Sci-Fi", "Action"],
    earnings: [120, 150, 200],
    details: {
        director: "Christopher Nolan",
        year: 2010
    }
},
{
    title: "Avengers",
    rating: 8.0,
    genres: ["Action", "Adventure"],
    earnings: [300, 250, 400],
    details: null
},
{
    title: "Interstellar",
    rating: 8.7,
    genres: ["Sci-Fi", "Drama"],
    earnings: [180, 220, 260],
    details: {
        director: "Christopher Nolan",
        year: 2014
    }
}
];

const platforms = ["Netflix", "Prime", "Hotstar", "JioCinema"];


// Q1
function totalMovies(arr){
    return arr.length;
}


// Q2
function firstPlatform(arr){
    return arr[0].toLowerCase();
}


// Q3
function firstMovie(arr){
    return arr[0].title;
}


// Q4
function movieStatus(arr){
    return arr[0].rating >= 8.5
        ? "Blockbuster"
        : "Hit";
}


// Q5
function sortByRating(arr){

    return arr
        .sort((a,b) => b.rating - a.rating)
        .map(movie => movie.title);

}


// Q6
function upperGenres(arr){

    return arr.flatMap(movie =>
        movie.genres.map(genre =>
            genre.toUpperCase()
        )
    );

}


// Q7
function profitableMovies(arr){

    return arr
        .filter(movie => {

            let avg =
                movie.earnings.reduce(
                    (sum,val)=>sum+val,0
                ) / movie.earnings.length;

            return avg > 200;

        })
        .map(movie => movie.title);

}


// Q8
function movieDirectors(arr){

    return arr.map(movie =>
        movie.details?.director
        || "Director Not Found"
    );

}


// Q9
function platformStatus(arr){

    return new Promise((resolve,reject)=>{

        setTimeout(()=>{

            let avg =
                arr.reduce(
                    (sum,movie)=>sum+movie.rating,0
                ) / arr.length;

            if(avg > 8){
                resolve("Platform Successful");
            }
            else{
                reject("Platform Average");
            }

        },2000);

    });

}


// Q10
function platformReport(arr){

    return platformStatus(arr)
        .then(res => res.toLowerCase())
        .catch(err => err.toLowerCase());

}


// DRIVER CODE
function driver(){

    console.log("Q1:", totalMovies(movies));

    console.log("Q2:",
        firstPlatform(platforms));

    console.log("Q3:",
        firstMovie(movies));

    console.log("Q4:",
        movieStatus(movies));

    console.log("Q5:",
        sortByRating(movies));

    console.log("Q6:",
        upperGenres(movies));

    console.log("Q7:",
        profitableMovies(movies));

    console.log("Q8:",
        movieDirectors(movies));

    platformStatus(movies)
    .then(res => console.log("Q9:", res))
    .catch(err => console.log("Q9:", err));

    platformReport(movies)
    .then(res => console.log("Q10:", res))
    .catch(err => console.log("Q10:", err));

}

driver();