From: Eliezer Croitoru <eliezer@ngtech.co.il>
Subject: Re: ip6tables REDIRECT support
Date: Sat, 29 Sep 2012 04:31:59 +0200
Message-ID: <50665D9F.3080602@ngtech.co.il>
References: <CAAq25NTpN5bvPyHKfQ0e-rHU2OWg+Sjb00mq=rVKrt1c9POctg@mail.gmail.com> <06b901cd9cd4$98ebea50$cac3bef0$@telsatbb.vu> <5065E9CA.2020103@ngtech.co.il> <075301cd9db7$0f0e8c00$2d2ba400$@telsatbb.vu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <075301cd9db7$0f0e8c00$2d2ba400$@telsatbb.vu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Steve (Telsat Broadband)" <steve@telsatbb.vu>
Cc: 'Joao Pereira' <joaopapereira@gmail.com>, netfilter@vger.kernel.org

On 9/28/2012 10:22 PM, Steve (Telsat Broadband) wrote:
> Hi Eliezer,
>
> We use our own custom server.  The server listens for connections on all
> ports for both TCP & UDP and forwards any unauthenticated connections to two
> separate services running on the same machine.  The problem with TPROXY was
> that despite it being configured exactly as we've configured it in the past
> when we used a squid proxy, the data packets never hit the services on the
> server which were supposed to handle them.
>
So I ask, Why if it worked with squid it's not working with your server?
the only answer I can think of is that you didn't used the right 
configurations on the server to work with tproxy.
it requires special socket options that are not similar to any regular ones.

Works for me with tproxy and does what I need.

Eliezer
> The redirect target worked perfectly for this situation, simply capturing
> any packets on dport 1-65535 and redirecting it to port xxx on the same
> machine.  Simply shifting port X to port Y without any other modifications.
>
> Cheers.
> Steve.
>
>
> Steve Noorderbroek
> C.T.O.
> Telsat Broadband Limited
> www.telsatbb.vu
<SNIP>
