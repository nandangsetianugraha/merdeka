"use strict";
document.addEventListener('DOMContentLoaded', function() {
  var calendarEl = document.getElementById('calendar');

  var calendar = new FullCalendar.Calendar(calendarEl, {
    initialView: 'dayGridMonth',
    height: 650,
  });

  calendar.render();
});

document.addEventListener('DOMContentLoaded', function() {
  var calendarEl = document.getElementById('calendar');

  var calendar = new FullCalendar.Calendar(calendarEl, {
    initialView: 'dayGridMonth',
    height: 650,
    events: 'modul/kalendar/fetchEvents.php',
  });

  calendar.render();
});

document.addEventListener('DOMContentLoaded', function() {
  var calendarEl = document.getElementById('calendar');

  var calendar = new FullCalendar.Calendar(calendarEl, {
	initialView: 'dayGridMonth',
	height: 650,
	events: 'modul/kalendar/fetchEvents.php',

	selectable: true,
	select: async function (start, end, allDay) {
	  const { value: formValues } = await Swal.fire({
		title: 'Add Event',
		html:
		  '<input id="swalEvtTitle" class="swal2-input" placeholder="Enter title">' +
		  '<textarea id="swalEvtDesc" class="swal2-input" placeholder="Enter description"></textarea>' +
		  '<input id="swalEvtURL" class="swal2-input" placeholder="Enter URL">',
		focusConfirm: false,
		preConfirm: () => {
		  return [
			document.getElementById('swalEvtTitle').value,
			document.getElementById('swalEvtDesc').value,
			document.getElementById('swalEvtURL').value
		  ]
		}
	  });

	  if (formValues) {
		// Add event
		fetch("modul/kalendar/eventHandler.php", {
		  method: "POST",
		  headers: { "Content-Type": "application/json" },
		  body: JSON.stringify({ request_type:'addEvent', start:start.startStr, end:start.endStr, event_data: formValues}),
		})
		.then(response => response.json())
		.then(data => {
		  if (data.status == 1) {
			Swal.fire('Event added successfully!', '', 'success');
		  } else {
			Swal.fire(data.error, '', 'error');
		  }

		  // Refetch events from all sources and rerender
		  calendar.refetchEvents();
		})
		.catch(console.error);
	  }
	}
  });

  calendar.render();
});

document.addEventListener('DOMContentLoaded', function() {
  var calendarEl = document.getElementById('calendar');

  var calendar = new FullCalendar.Calendar(calendarEl, {
    initialView: 'dayGridMonth',
    height: 650,
    events: 'modul/kalendar/fetchEvents.php',

    eventClick: function(info) {
      info.jsEvent.preventDefault();
      
      // change the border color
      info.el.style.borderColor = 'red';
      
      Swal.fire({
        title: info.event.title,
        icon: 'info',
        html:'<p>'+info.event.extendedProps.description+'</p><a href="'+info.event.url+'">Visit event page</a>',
      });
    }
  });

  calendar.render();
});

//Delete Event
document.addEventListener('DOMContentLoaded', function() {
  var calendarEl = document.getElementById('calendar');

  var calendar = new FullCalendar.Calendar(calendarEl, {
	initialView: 'dayGridMonth',
	height: 650,
	events: 'modul/kalendar/fetchEvents.php',

	selectable: true,
	select: async function (start, end, allDay) {
	  const { value: formValues } = await Swal.fire({
		title: 'Add Event',
		html:
		  '<input id="swalEvtTitle" class="swal2-input" placeholder="Enter title">' +
		  '<textarea id="swalEvtDesc" class="swal2-input" placeholder="Enter description"></textarea>' +
		  '<input id="swalEvtURL" class="swal2-input" placeholder="Enter URL">',
		focusConfirm: false,
		preConfirm: () => {
		  return [
			document.getElementById('swalEvtTitle').value,
			document.getElementById('swalEvtDesc').value,
			document.getElementById('swalEvtURL').value
		  ]
		}
	  });

	  if (formValues) {
		// Add event
		fetch("modul/kalendar/eventHandler.php", {
		  method: "POST",
		  headers: { "Content-Type": "application/json" },
		  body: JSON.stringify({ request_type:'addEvent', start:start.startStr, end:start.endStr, event_data: formValues}),
		})
		.then(response => response.json())
		.then(data => {
		  if (data.status == 1) {
			Swal.fire('Event added successfully!', '', 'success');
		  } else {
			Swal.fire(data.error, '', 'error');
		  }

		  // Refetch events from all sources and rerender
		  calendar.refetchEvents();
		})
		.catch(console.error);
	  }
	},

	eventClick: function(info) {
	  info.jsEvent.preventDefault();
	  
	  // change the border color
	  info.el.style.borderColor = 'red';
	  
	  Swal.fire({
		title: info.event.title,
		icon: 'info',
		html:'<p>'+info.event.extendedProps.description+'</p><a href="'+info.event.url+'">Visit event page</a>',
		showCloseButton: true,
		showCancelButton: true,
		cancelButtonText: 'Close',
		confirmButtonText: 'Delete Event',
	  }).then((result) => {
		if (result.isConfirmed) {
		  // Delete event
		  fetch("modul/kalendar/eventHandler.php", {
			method: "POST",
			headers: { "Content-Type": "application/json" },
			body: JSON.stringify({ request_type:'deleteEvent', event_id: info.event.id}),
		  })
		  .then(response => response.json())
		  .then(data => {
			if (data.status == 1) {
			  Swal.fire('Event deleted successfully!', '', 'success');
			} else {
			  Swal.fire(data.error, '', 'error');
			}

			// Refetch events from all sources and rerender
			calendar.refetchEvents();
		  })
		  .catch(console.error);
		} else {
		  Swal.close();
		}
	  });
	}
  });

  calendar.render();
});

