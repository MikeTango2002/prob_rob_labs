% this function computes the prediction step by applying the motion model to each particle
% inputs:
%   samples: the set of particles
%   transition: current transition

% outputs:
%   samples: the particle after the motion model

function samples = prediction(samples, transition)

	dim_particles = size(samples,2);
	
	u = transition.v;
        %it returns u = [ux, uy, utheta]. simply not consider uy
	u_x = u(1);
	u_theta = u(3);
	
	a1 = abs(u_x);
	a2 = abs(u_theta);
	%apply transition to every particle
	for i=1:dim_particles
		%sample noise here and apply
		noise_x = (rand() - 0.5)*a1;
		noise_theta = (rand() - 0.5)*a2;

		prev_state = samples(:,i);
		prev_x = prev_state(1);
		prev_y = prev_state(2);
		prev_theta = prev_state(3);

		c = cos(prev_theta);
		s = sin(prev_theta);

		control_noised = [u_x + noise_x; u_theta + noise_theta];

		
		samples(:,i) = [prev_x + control_noised(1) * c;
						prev_y + control_noised(1) * s;
						prev_theta + control_noised(2)]; %TODO;
	end
endfunction
