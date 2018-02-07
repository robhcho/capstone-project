/* global Vue, VueRouter, axios, */
// var moment = require('moment');


var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Welcome to Vue.js!"
    };
  },
  created: function() {
    router.push("/login");
  },
  methods: {
  },
  computed: {}
};

var SignupPage = {
  template: "#signup-page",
  data: function() {
    return {
      full_name: "",
      email: "",
      password: "",
      passwordConfirmation: "",
      errors: []
    };
  },
  methods: {
    signUp: function() {
      var params = {
        full_name: this.full_name,
        email: this.email,
        password: this.password,
        password_confirmation: this.passwordConfirmation
      };
      axios
        .post("/users", params)
        .then(function(response) {
          router.push("/login");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var LoginPage = {
  template: "#login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        auth: { email: this.email, password: this.password }
      };
      axios
        .post("/user_token", params)
        .then(function(response) {
          console.log(response);
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/user_calendar_events");
        })
        .catch(
          function(error) {
            console.log(error);
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};

var LogoutPage = {
  template: "#logout",
  created: function() {
    axios.defaults.headers.common["Authorization"] = undefined;
    localStorage.removeItem("jwt");
    router.push("/login");
  }
};

var ShowCalendarPage = {
  template: "#show-calendar-page",
  data: function() {
    return {
      calendar_events: {},
      errors: []
    };
  },
  created: function() {
    axios.get('/user_calendar_events').then(function(response) {});
  },
  methods: {},
  computed: {}
};

var AddCalendarEventPage = {
  template: "#add-event-page",
  data: function() {
    return {
      eventTitle: "",
      eventDate: "",
      eventStart: "",
      eventEndTime: "",
      errors: []
    };
  },
  methods: {
    addEvent: function() {
      var params = {
        title: this.eventTitle,
        date: this.eventDate,
        start: this.eventStart,
        end_time: this.eventEndTime,
      };
      axios
        .post("/user_calendar_events", params)
        .then(function(response) {
          router.push("/user_calendar_events");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var ShowEventPage = {
  template: "#show-event-page",
  data: function() {
    return {
      calendar_event: {},
      errors: []
    };
  },
  created: function() {
    axios.get('/user_calendar_events/' + this.$route.params.id).then(function(response) {
      this.calendar_event = response.data;
      console.log(this.calendar_event);
    }.bind(this));
  },
  methods: {},
  computed: {}
};

var EditEventPage = {
  template: "#edit-event-page",
  data: function() {
    return {
      calendarEvent: {},
      errors: []
    };
  },
  methods: {
    editCalendarEvent: function() {
      var params = {
        eventID: this.calendarEvent.id,
        eventTitle: this.calendarEvent.title,
        date: this.calendarEvent.date,
        startTime: this.calendarEvent.start,
        endTime: this.calendarEvent.end_time,
      };
      axios
        .patch('/user_calendar_events/' + this.$route.params.id, params).then(function(response) {
          router.push('/user_calendar_events');
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  },
  created: function() {
    axios.get('/user_calendar_events/' + this.$route.params.id).then(function(response) {
      this.calendar_event = response.data;
    }.bind(this));
  },
};

var CreateEvent = {
  template: "#create-event-page",
  data: function() {
    return {
      event_title: "",
      event_date: "",
      errors: []
    };
  },
  methods: {
    createEvent: function() {
      var params = {
        title: this.event_title,
        event_date: this.event_date,
      };
      axios
        .post("/events", params)
        .then(function(response) {
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    },
    // createGroupEvent: function() {
    //   var params = {

    //   };
    //   axios
    //     .post("/event_groups", params)
    //     .then(function(response) {
    //       router.push("/");
    //     })
    //     .catch(
    //       function(error) {
    //         this.errors = error.response.data.errors;
    //       }.bind(this)
    //     );
    // }
  }
};

var GroupsPage = {
  template: "#groups-page",
  data: function() {
    return {
      user_groups: {},
      errors: []
    };
  },
  created: function() {
    axios.get('/group_users').then(function(response) {
      this.user_groups = response.data;
    }.bind(this));
  },
  methods: {},
  computed: {}
};

var ShowGroupPage = {
  template: "#show-group-page",
  data: function() {
    return {
      user_group: [{members: ""}],
      errors: []
    };
  },
  created: function() {
    axios.get('/group_users/' + this.$route.params.id).then(function(response) {
      this.user_group = response.data;

    }.bind(this));
  },
  methods: {},
  computed: {}
};

var NewGroupPage = {
  template: "#add-group-page",
  data: function() {
    return {
      groupTitle: "",
      errors: []
    };
  },
  methods: {
    createGroup: function() {
      var params = {
        group_title: this.groupTitle,
      };
      axios
        .post("/groups", params)
        .then(function(response) {
          router.push("/groups");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};


var router = new VueRouter({
  routes: 
  [
    { path: "/", component: HomePage },
    { path: "/signup", component: SignupPage },
    { path: "/login", component: LoginPage },
    { path: "/logout", component: LogoutPage },
    { path: "/user_calendar_events", component: ShowCalendarPage },
    { path: "/user_calendar_events/new", component: AddCalendarEventPage },
    { path: "/user_calendar_events/:id/edit", component: EditEventPage },
    { path: "/user_calendar_events/:id", component: ShowEventPage },
    { path: "/events/new", component: CreateEvent },
    { path: "/groups/", component: GroupsPage },
    { path: "/groups/new", component: NewGroupPage },
    { path: "/group_users/:id", component: ShowGroupPage }
  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router,
  watch: {
    '$route': function() {
      window.location.reload();
    }
  },
  created: function() {
    var jwt = localStorage.getItem("jwt");
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  }
});