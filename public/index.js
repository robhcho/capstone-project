/* global Vue, VueRouter, axios, */
// var moment = require('moment');


var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Welcome to Vue.js!"
    };
  },
  created: function() {},
  methods: {},
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
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/");
        })
        .catch(
          function(error) {
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
    axios.get('/user_calendar_events').then(function(response) {
      this.calendar_events = response.data;
      console.log(this.calendar_events);
    }.bind(this));
  },
  methods: {},
  computed: {}
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
    axios.get('/user_calendar_events' + this.$route.params.id).then(function(response) {
      this.calendar_event = response.data;
      console.log(this.calendar_event);
    }.bind(this));
  },
  methods: {},
  computed: {}
};

var EditCalendarEventPage = {
  template: "#edit-calendar-page",
  data: function() {
    return {
      calendarEvent: {},
      errors: []
    };
  },
  methods: {
    editCalendarEvent: function() {
      var params = {
        eventTitle: this.calendarEvent.event_title,
        date: this.calendarEvent.date,
        startTime: this.calendarEvent.start_time,
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

var createEvent = {
  template: "#create-event-page",
  data: function() {
    return {
      eventTitle: "",
      eventDescription: "",
      eventDuration: "",
      errors: []
    };
  },
  methods: {
    createEvent: function() {
      var params = {
        event_title: this.eventTitle,
        event_description: this.eventDescription,
        event_duration: this.eventDuration,
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
    }
  }
};

// var DatePicker = {
//   template: "#date-picker-page",
//   data: {
//     regularDate: '',
//     showRegularDate: false,
//     minDateLimit: '',
//     minDate: '',
//     showMinDate: false,
//     maxDateLimit: '',
//     maxDate: '',
//     showMaxDate: false,
//     rangeDate: '',
//     showRangeDate: false,
//     specifiedDate: '',
//     showSpecifiedDate: false,
//     formattedDate: '',
//     showFormattedDate: false
//   },
//   created: function() {},
//   methods: {
//     formatDate: function(date) {
//       return moment(date).format('LL');
//     }
//   },
//   computed: {}
// };


var GroupPage = {
  template: "#group-page",
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
    console.log(this.user_groups);
  },
  methods: {},
  computed: {}
};

var NewGroupPage = {
  template: "#create-group-page",
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
    { path: "/user_calendar_events/:id/edit", component: EditCalendarEventPage },
    { path: "/user_calendar_events/:id", component: ShowEventPage },
    { path: "/events/new", component: createEvent },
    { path: "/groups/", component: GroupPage },
    { path: "/groups/new", component: NewGroupPage },
  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router,
  created: function() {
    var jwt = localStorage.getItem("jwt");
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  }
});