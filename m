From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Iptables and Zebra
Date: Tue, 16 Dec 2003 10:21:14 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312161021.14594.Antony@Soft-Solutions.co.uk>
References: <006301c3c3b7$e02ef0b0$220aa8c0@BERTRAND>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <006301c3c3b7$e02ef0b0$220aa8c0@BERTRAND>
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

On Tuesday 16 December 2003 9:34 am, Bertrand TACHAGO wrote:

> Hi to all!
> I'm trying to setup a zebra router on a RH9 machine but right I'm blocked
> because there's a firewall (iptables) problem. I had entered a POSTROUTING
> rule (iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE) but the packets
> are not routed to the external interface. Can somebody help me solve this
> problem (use zebra routing protocol to route packets from my network to the
> Internet)?

Netfilter does not route packets for you.   It can change the source or 
destination addresses, and it can block certain packets from being routed, 
but the decision about where / how / why to route packets is not made by 
netfilter.

The rule you have given above will make sure that all packets leaving 
interface eth0 will have the IP address of that interface as their source 
address.   It does not affect in any way which packets get routed via eth0 on 
their way anywhere else.

Sorry I can't be more help, but I wanted to make sure you understood that a 
routing problem is not a netfilter problem.

Antony.

-- 
The difference between theory and practice is that in theory there is no 
difference, whereas in practice there is.

                                                     Please reply to the list;
                                                           please don't CC me.


