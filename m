From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: How to configure NAT with dynamic ip
Date: Wed, 17 Dec 2003 18:13:50 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312171813.50788.Antony@Soft-Solutions.co.uk>
References: <000001c3c312$06330360$05000a0a@bharatplanet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000001c3c312$06330360$05000a0a@bharatplanet.com>
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

On Monday 15 December 2003 1:47 pm, prasanna wrote:

> Dear friends,
>     please guide how to configure NAT with dynamic ip.
>
> My plan is give intrenet address to my clients thro iptables. I had
> dynamic ip connection

For outgoing connections, do the NAT using the MASQUERADE target instead of 
SNAT:

iptables -A POSTROUTING -t nat -o $EXTIF -j MASQUERADE


For any incoming connections you want to forward, use the interface name 
instead of trying to use an IP address:

iptables -A PREROUTING -t nat -i $EXTIF -p tcp --dport 22 -j DNAT --to 
192.168.192.168

as an example to forward SSH connections to an internal machine.

Antony.

-- 
In Heaven, the police are British, the chefs are Italian, the beer is Belgian, 
the mechanics are German, the lovers are French, the entertainment is 
American, and everything is organised by the Swiss.

In Hell, the police are German, the chefs are British, the beer is American, 
the mechanics are French, the lovers are Swiss, the entertainment is Belgian, 
and everything is organised by the Italians.

                                                     Please reply to the list;
                                                           please don't CC me.


