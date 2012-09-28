From: "Steve \(Telsat Broadband\)" <steve@telsatbb.vu>
Subject: RE: ip6tables REDIRECT support
Date: Sat, 29 Sep 2012 07:22:58 +1100
Message-ID: <075301cd9db7$0f0e8c00$2d2ba400$@telsatbb.vu>
References: <CAAq25NTpN5bvPyHKfQ0e-rHU2OWg+Sjb00mq=rVKrt1c9POctg@mail.gmail.com> <06b901cd9cd4$98ebea50$cac3bef0$@telsatbb.vu> <5065E9CA.2020103@ngtech.co.il>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5065E9CA.2020103@ngtech.co.il>
Content-Language: en-au
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Eliezer Croitoru' <eliezer@ngtech.co.il>
Cc: 'Joao Pereira' <joaopapereira@gmail.com>, netfilter@vger.kernel.org

Hi Eliezer,

We use our own custom server.  The server listens for connections on all
ports for both TCP & UDP and forwards any unauthenticated connections to two
separate services running on the same machine.  The problem with TPROXY was
that despite it being configured exactly as we've configured it in the past
when we used a squid proxy, the data packets never hit the services on the
server which were supposed to handle them.

The redirect target worked perfectly for this situation, simply capturing
any packets on dport 1-65535 and redirecting it to port xxx on the same
machine.  Simply shifting port X to port Y without any other modifications.

Cheers.
Steve.


Steve Noorderbroek
C.T.O.
Telsat Broadband Limited
www.telsatbb.vu


-----Original Message-----
From: netfilter-owner@vger.kernel.org
[mailto:netfilter-owner@vger.kernel.org] On Behalf Of Eliezer Croitoru
Sent: Saturday, 29 September 2012 5:18 AM
To: Steve (Telsat Broadband)
Cc: 'Joao Pereira'; netfilter@vger.kernel.org
Subject: Re: ip6tables REDIRECT support

On 9/27/2012 7:21 PM, Steve (Telsat Broadband) wrote:
> The majority of the responses I did get suggested to use TPROXY 
> instead of redirect, but in my particular case, that didn't work 
> properly and seemed to have much more overhead than the redirect target.
>
What didnt worked?
If you need a captive portal there is a very simple way to do it.
What exactly do you use now?

Eliezer
> Hopefully someone out there in the dev team will understand our plight 
> and perhaps incorporate this important target.
>
> Cheers.
> Steve.


--
Eliezer Croitoru
https://www1.ngtech.co.il
IT consulting for Nonprofit organizations eliezer <at> ngtech.co.il
--
To unsubscribe from this list: send the line "unsubscribe netfilter" in the
body of a message to majordomo@vger.kernel.org More majordomo info at
http://vger.kernel.org/majordomo-info.html


