From: "hard__ware" <hard__ware@hotmail.com>
Subject: (no subject)
Date: Thu, 3 Oct 2002 15:07:39 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OE40IYvVjIUlEsl62h600008814@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
Cc: wmitchell@glug.org.au

sorry i could not help,

maybee what your going to need to do is have some very basic rules in your
iptables firewall that

just count packets ,  with the iptables option for doing just that ,, e.g.

although we might already be allowing the flow of this Traffic, it does hurt
to add a rule

that like counted all TCP packets or in this case all packets From squid to
the LAN

$IPTABLES -A OUTPUT -o $INTIF -s $INTIP -d $INTNET -p tcp --sport 3128 -c 0
0 -j ACCEPT

this works great for me, because i have a script that every 2 hours it logs
& rests all my traffic.

and also one in my ip-down.local for when my modem gets disconnected ...
hope thus helps :D

