From: George Alexandru Dragoi <waruiinu@gmail.com>
Subject: Re: QoS traffic shaping behaves strangely with addressed based filtering
Date: Mon, 19 Jul 2004 16:58:56 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3063e504071907582d03bf3f@mail.gmail.com>
References: <20040719144759.GA11352@vismail.informatik.uni-stuttgart.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040719144759.GA11352@vismail.informatik.uni-stuttgart.de>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I had same problem with that kernel, I'm not sure if it is QoS or
realtek driver fault, i think i had this problem before applying QoS
on the realtek iface. On that machine there was an realtek and
pcnet32, and i could stay connected throught ssh via pcnet32, but not
realtek. Somebody found a quickfix (till I switched to 2.6.7) and made
the machine ping hisself all the time so his connections never freeze,
unless he stoped the ping.

I hope this help

On Mon, 19 Jul 2004 16:47:59 +0200, Matthias Hopf
<matthias.hopf@informatik.uni-stuttgart.de> wrote:
> Hi all!
> 
> I found a rather esotheric bug / misconfiguration, and now I'm lost.
> Maybe somebody else has a clue what is going on here.
> 
> I am connected to the internet via a typical DSL router with integrated
> 4-port switch. One of my computers should be able to serve local
> machines at full speed, but internet bandwith usage should be limited.
> Just for the record, it is running 2.4.27-pre3, but I have checked
> several kernel versions (not the 2.6 series, though).  Additionally, a
> set of firewall rules is active. The system is rather slow with C3
> @533MHz, but has 512MB RAM.
> 
> Now what happens is the following: With the QoS rules enabled, the
> system behaves as anticipated (fast local traffic, limited internet
> traffic), but suddenly for a couple of seconds it won't talk to local
> computers any longer. ssh connections freeze, no ping, nothing.
> Strangely enough, remote connections are still alive.  Other systems can
> talk with each other and are routed to the internet as well, so I
> conclude that this has nothing to do with the router.  This mostly
> happens when a lot of upstream traffic is going on, that is, the
> internet limit is hit. The time of traffic breakdown varies from event
> to event and can be as large as a minute. Needless to say that the
> system itself is almost idle during that time and that it won't happen
> with QoS disabled.
> 
> I narrowed down the strange behaviour and can sort of reproduce it with
> the following subset of my QoS rules - the exact bandwidth limits do not
> really matter, I got this with 50kbit uplink and 400kbit local traffic
> and different quantum values as well:
> 
> DEV=eth0
> LOCAL=192.168.2.0/24
> 
> tc qdisc add dev $DEV root handle 1: htb default 2
> # Class 1:1 local traffic
> tc class add dev $DEV parent 1: classid 1:1 htb prio 1 \
>    rate 80mbit quantum 32768
> # Class 1:2 remote traffic
> tc class add dev $DEV parent 1: classid 1:2 htb prio 2 \
>    rate 80kbit ceil 80kbit burst 2k quantum 1500
> 
> # Local traffic goes unconditionally to 1:1
> tc filter add dev $DEV parent 1: protocol ip prio 1 \
>    u32 match ip dst $LOCAL \
>    flowid 1:1
> 
> Any ideas?
> 
> Thanks
> 
> Matthias
> 
> --
> Matthias Hopf - Visualization and Interactive Systems Group    \  |  |  /--
>                   University of Stuttgart,                      \ |  |   \
>        Universitaetsstr. 38, 70569 Stuttgart, Germany            \|  |  --/
> Phone +49-711-7816-404    Fax -340          mat@mshopf.de     www.mshopf.de
> 
>

