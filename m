From: George Alexandru Dragoi <waruiinu@gmail.com>
Subject: Re: ARP who-has woes
Date: Tue, 15 Mar 2005 11:13:13 +0200
Message-ID: <3063e5050315011330b4b5a4@mail.gmail.com>
References: <42B3C34A03A8FC4BB0A80082CE8993F32DA28E@onstopnt.onestop.com>
	<42B3C34A03A8FC4BB0A80082CE8993F31C1C23@onstopnt.onestop.com>
Reply-To: George Alexandru Dragoi <waruiinu@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <42B3C34A03A8FC4BB0A80082CE8993F31C1C23@onstopnt.onestop.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Travis Bell <travis@dptexas.net>
Cc: netfilter@lists.netfilter.org

Perhaps is better to put a router (linux or whatever) in the wireless
network. Or a router with a manageable switch after it where you can
set vlans, so the arp traffic is much low, and more important, won't
go throught the radio. This means you'll also need to subnet your
clients and change theyr ip'es.


On Mon, 14 Mar 2005 17:47:06 -0600, Travis Bell <travis@dptexas.net> wrote:
> This is a little off topic, but I know this list has people in it who
> can answer this easily.
> 
> We are a small ISP and I'm trying to figure out how to keep my customers
> from getting so much ARP traffic.
> 
> Here's a very dumbed-down diagram of how the network is set up:
> ,------------.
> | 4 T1 lines |
> `------------'
>        |
> ,--------------.
> | Cisco Router |
> `--------------'
>        |
> ,-----------------.   ,------------------.   ,-------------.
> | Ethernet Switch |---| Web/Email Server |---| DHCP Server |
> `-----------------'   `------------------'   `-------------'
>        |
> (( Wireless Network ))
>        |
> ,---------------.
> | Customer's PC |
> `---------------'
> 
> Right now, customers default gateway is set to the Cisco Router.  I'm
> guessing I need to insert another router in the mix and customers should
> be using it.  New diagram:
> ,------------.
> | 4 T1 lines |
> `------------'
>        |
> ,--------------.
> | Cisco Router |
> `--------------'
>        |
> ,-----------------.   ,------------------.
> | Ethernet Switch |---| Web/Email Server |
> `-----------------'   `------------------'
>        |
> ,--------------.
> | Linux Router |
> `--------------'
>        |
> ,-----------------.   ,-------------.
> | Ethernet Switch |---| DHCP Server |
> `-----------------'   `-------------'
>        |
> (( Wireless Network ))
>        |
> ,---------------.
> | Customer's PC |
> `---------------'
> 
> Am I right?  If so, what do I need to do to get this going right?
> 
> Thanks in advance,
> 
> Travis
> 
> 


-- 
Bla bla

