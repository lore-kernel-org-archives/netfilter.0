From: Julian Gomez <kluivert@tm.net.my>
Subject: Re: H/A
Date: Tue, 27 May 2003 18:09:05 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030527100905.GA1395@floyd>
References: <09B04A55822EFF4DA48D2E0BB2941D4A0D6CE7@wardrive.citadelcomputer.com.au>
Reply-To: kluivert@tm.net.my
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <09B04A55822EFF4DA48D2E0BB2941D4A0D6CE7@wardrive.citadelcomputer.com.au>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Tue, May 27, 2003 at 07:47:31AM +1000, George Vieira spoke thusly:
>LIVE IP=203.x.x.x
>FW1=10.1.1.1    FW2=10.1.1.1
>
>using iproute2 I add the live IP to FW1 which is the Master FW.
>
>ip add addr 203.x.x.x/28 dev eth0
>
>Then my firewall scripts find the dev IP using "ip addr show $EXTDEV" add
>then "tail -1" for so it grabs the last line of the list otherwise it
>finds 2 IP bounded to the 1 network card and the scripts go nuts.. See
>snippet of my iptables script below.

George,

You have not stated, exactly what failover scenarios does your setup work
for ? Ie,

[ internet link #1 ] +- [ firewall #1 ] -- +-------+
                     |                     | LAN1  |
	             |                     | LAN2  | 
[ internet link #2 ] +- [ firewall #2 ] -- +-------+

I was addressing something like the above. If firewall #1 goes down,
firewall #2 can take over, but it still requires that all state information
from firewall #1; be propogated to firewall #2. I am not taking into
account any load balancing requirements, pure failover. State info for both
iptables + their VPN setup. [*]

I don't understand how your unique IP addressing method will solve the
above, though your setup itself isn't very clear to me.

That said, the original poster didn't exactly state (IIRC) what sort of VPN
setup he is using (office <-> office), what exactly does he want
fail-over'ed, does he have dual Internet links and many many other bits of
information.

Take note, that even my ascii diagran above only caters for certain
failover scenarios.

