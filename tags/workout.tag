<workout>
  <img src="img/{ workOut }.gif">


  <div>
    <div class="fitness level">
      <div style="width:{ fitness }%;">&nbsp;</div>
    </div>
    <p>Body Fat percentage: { fitness }</p>
  </div>


  <button onclick={ exercise }>Exercise</button>
  <button onclick={ eat }>Eat</button>

  <p>The fit hears: { data }</p>
	<button onclick={ talkToFat }>Attach the fatty dancing guy</button>

  <script>
    //make a copy of my pet object and call it that
    var that  = this;

    //initial state
    this.fitness = 10;
    this.workOut = "strong";

    //tell DOM window to increase hunger every three second
    //console.log(that);


    decFitness() {

      this.fitness = this.fitness - 2 < 10 ? 10 : this.fitness - 2;
    }

    incFitness() {
      console.log(this.fitness);
      this.fitness = this.fitness + 2 > 30 ? 30 : this.fitness + 2;
    }

    checkStatus() {
      if (this.fitness >= 25){
        this.workOut = "fat";
      } else if (this.fitness <= 15){
        this.workOut = "strong";
      }else{
        this.workOut = "normal";
      }
    }

// functions that respond to events
    exercise(e) {
      this.decFitness();
      this.checkStatus();
    }

    eat(e) {
      this.incFitness();
      this.checkStatus();
    }



    this.data = "Nothing";
    talkToFat(event) {
      var fitMsg = "You need to start the exerice and stop eating unhealty food ~From the Fit";
      observable.trigger('exerice', fitMsg);
    }

    observable.on('fatDance', function(passedData){
		  that.data = passedData;
			that.update();
		});

    observable.on('reset', function(){
      that.data = "Nothing";
    });
  </script>

  <style>
  :scope{
    margin:auto;
  }

  img{
    weight:auto;
    height:200px;
  }

  </style>
</workout>
