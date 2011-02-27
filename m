From: Jan Rovner <jan.rovner@diadema.cz>
Subject: RATEEST explanation
Date: Sun, 27 Feb 2011 19:01:07 +0100
Message-ID: <6750301E8CE01943922138638F4F1D26016EF1FCB36C@diademasrv.diademasw.inkubator.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hello everybody,

I am trying to use RATEEST match to measure pps of certain packets via iptables.
I had a partial success, but I am not sure about the meaning of parameters --rateest-interval
and --rateest-ewmalog values. There is no information in the docs about the algorithm used.

Could you please explain the meaning of these parameters? 
And if possible, would you recommend me a proper setup to measure "RATETEST hits per second (pps)" ?

i.e. to use:
iptables -j RATEEST --rateest-name mymeter --rateest-interval xx --rateest-ewma yy

followed by:
iptables -m rateest --rateest1 mymeter --rateest-pps2 1000 --rateest-gt ?j LOG --log-prefix "mymeter is over 1000pps"

Thank you very much.

Sincerely,
Jan Rovner

-----------------------------------------------------------------------------

RATEEST
       The RATEEST target collects statistics, performs rate estimation calcu‐
       lation  and  saves  the  results for later evaluation using the rateest
       match.

       --rateest-name name
              Count matched packets into the pool referred to by  name,  which
              is freely choosable.

       --rateest-interval amount{s|ms|us}
              Rate measurement interval, in seconds, milliseconds or microsec‐
              onds.

       --rateest-ewmalog value
              Rate measurement averaging time constant.


