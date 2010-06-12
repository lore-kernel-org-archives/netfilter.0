From: Michele Petrazzo - Unipex <michele.petrazzo@unipex.it>
Subject: Re: traffic shaping between two LANs and one ppp0 default gw
Date: Sat, 12 Jun 2010 16:36:58 +0200
Message-ID: <4C139B8A.9030608@unipex.it>
References: <4C104BDB.7060706@asyr.hopto.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C104BDB.7060706@asyr.hopto.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thanasis <thanasis@asyr.hopto.org>
Cc: netfilter@vger.kernel.org

Thanasis wrote:
> We would like to divide the incoming and outgoing bandwidth equally 
> between those two LANs, ie: On the other hand, routing packets
> between the 2 LANs (from eth2 to eth0 and vice versa) should not be
> restricted, ie should be at 100Mbps. How would this be best and
> simplest implemented by using iproute2 (tc) ?
> 


tc + htb | cbq | another handful of queues are what you are looking for
and google for that (also for larc)

P.s. As said in all the howtos that you can find, you can limit *only*
upload speed (unless you use some trick and imq), so in you environment
will be near impossible to split the download speed between the
different lans since every queue are strictly linked with a interface,
which cannot know each other

Michele
