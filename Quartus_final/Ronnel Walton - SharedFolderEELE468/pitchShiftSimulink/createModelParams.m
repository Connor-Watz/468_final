% SPDX-License-Identifier: MIT
% Copyright (c) 2022 Trevor Vannoy, Ross K. Snider  All rights reserved.
%--------------------------------------------------------------------------
% Description:  Matlab Function to create/set model parameters for a
%               Simulink model. 
%--------------------------------------------------------------------------
% Authors:      Ross K. Snider, Trevor Vannoy
% Company:      Montana State University
% Create Date:  April 5, 2022
% Revision:     1.0
% License: MIT  (opensource.org/licenses/MIT)
%--------------------------------------------------------------------------
function modelParams = createModelParams()

%--------------------------------------------------------------------------
% audio signal path in model
%--------------------------------------------------------------------------
modelParams.audio.wordLength      = 24;     % word size of audio signal
modelParams.audio.fractionLength  = 23;     % fraction size of audio signal
modelParams.audio.signed          = true;   % audio is a signed signal type
modelParams.audio.sampleFrequency = 48000; % sample rate (Hz)
modelParams.audio.samplePeriod    = 1/modelParams.audio.sampleFrequency;

%--------------------------------------------------------------------------
% Control Parameters that will be set in registers (Data Types)
% Note: the actual values are set in createSimParams.m
%--------------------------------------------------------------------------
modelParams.buffer_bit_num = 10;
modelParams.frac_Nbits = 12;
modelParams.buffer_size = fi((2^modelParams.buffer_bit_num), 0);

modelParams.delta1 = fi(2^(-3/12),0, modelParams.frac_Nbits);
modelParams.delta2 =  fi(2^(-6/12),0, modelParams.frac_Nbits);

modelParams.dpramAddressSize = 16;