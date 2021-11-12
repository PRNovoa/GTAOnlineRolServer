$(document).ready(function () {
	// LUA listener
	window.addEventListener('message', function (event) {
		if (event.data.action == 'open') {
			var type = event.data.type;
			var userData = event.data.array['user'][0];
			var licenseData = event.data.array['licenses'];
			var sex = userData.sex;

			if (type == 'driver' || type == 'weapon' || type == null) {
				$('img').show();
				$('#name').css('color', '#282828');

				if (sex.toLowerCase() == 'm') {
					$('img').attr('src', 'assets/images/male.png');
					$('#sex').text('H');
				} else {
					$('img').attr('src', 'assets/images/female.png');
					$('#sex').text('M');
				}

				$('#lastname').text(userData.lastname);
				$('#firstname').text(userData.firstname);
				$('#dob').text(userData.dateofbirth);
				$('#height').text('1.' + userData.height + 'm');
				$('#signature').text(userData.firstname + ' ' + userData.lastname);

				if (type == 'driver') {
					if (licenseData != null) {
						Object.keys(licenseData).forEach(function (key) {
							var type = licenseData[key].type;

							if (type == 'drive_bike') {
								type = 'bike';
							} else if (type == 'drive_truck') {
								type = 'truck';
							} else if (type == 'drive') {
								type = 'car';
							}

							if (type == 'bike' || type == 'truck' || type == 'car') {
								$('#licenses').append('<p>' + type + '</p>');
							}
						});
					}
					$('#id-card').css('background', 'url(assets/images/license.png)');
				} else if (type == 'weapon') {
					$('#id-card').css('background', 'url(assets/images/firearm.png)');
				} else {
					$('#id-card').css('background', 'url(assets/images/idcard.png)');
				}
			}
			// else if ( type == 'weapon' ) {
			//   $('img').hide();
			//   $('#name').css('color', '#282828');
			//   $('#name').text(userData.firstname + ' ' + userData.lastname);
			//   $('#dob').text(userData.dateofbirth);
			//   $('#height').text(userData.height);
			//   $('#signature').text(userData.firstname + ' ' + userData.lastname);

			//   $('#id-card').css('background', 'url(assets/images/firearm.png)');
			// }

			$('#id-card').show();
		} else if (event.data.action == 'close') {
			$('#lasstname').text('');
			$('#firstname').text('');
			$('#dob').text('');
			$('#height').text('');
			$('#signature').text('');
			$('#sex').text('');
			$('#id-card').hide();
			$('#licenses').html('');
		}
	});
});
