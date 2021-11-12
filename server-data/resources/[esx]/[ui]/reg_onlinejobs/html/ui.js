var visable = false;

$(function () {
	window.addEventListener('message', function (event) {

		switch (event.data.action) {
			case 'ui':
				$('#ui').fadeIn();
				break;

			case 'toggle':
				if (visable) {
					$('#ui').fadeOut();
				} else {
					$('#ui').fadeIn();
				}

				visable = !visable;
				break;

			case 'close':
				$('#ui').fadeOut();
				visable = false;
				break;

			case 'startID':
				var playerid = event.data.id;
				$('#playerID span').html(playerid);
				break;

			case 'updatePlayerJobs':
				var jobs = event.data.jobs;
				$('#player_count').html(jobs.player_count);
				$('#police span').html(jobs.police);
				$('#guardiacivil span').html(jobs.guardiacivil);
				$('#ems span').html(jobs.ems);
				$('#mechanic span').html(jobs.mechanic);
				$('#taxi span').html(jobs.taxi);
				$('#cardealer').html(jobs.cardealer);
				$('#estate').html(jobs.estate);
				break;

			case 'updatePlayerList':
				$('#playerlist tr:gt(0)').remove();
				$('#playerlist').append(event.data.players);
				// applyPingColor();
				// sortPlayerList();
				break;

			case 'updateServerInfo':
				if (event.data.maxPlayers) {
					$('#max_players').html(event.data.maxPlayers);
				}
				break;
		}
	}, false);
});




