From: Benoit Panizzon <panizzon@woody.ch>
Subject: Preventing to bind an interface (or solving that problem with
	iptables)
Date: Thu, 10 Mar 2005 11:33:03 +0100
Message-ID: <200503101133.07755.panizzon@woody.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

Hi all

Kernel 2.6.11

I got a bit a problem here...

I have a own small (not private) subnet and changed ISP.
The previus ISP was ADSL, so I got a ADSL-Router which did the routing for me.

Now I'm connected to a cable ISP and got a Cable Modem (in fact a bridge), so 
I need to do the routing on my linux box. This works fine, that's not the 
problem :-)

So, now I've got my linux box, two interfaces, one connected to the cable 
network, the other on my own LAN with my IP-Range

My Linux Box of course runs DNS and everything I need on my small subnet.

And there comes the problem...

eth0 => $IP from Cable ISP.
eth1 => x.y.z.1 (my own IP with correct PTR Entries etc.) on LAN.

Now unfortunately bind, sendmail and everything binds on both IP-Addresses. As 
soon as a DNS request goes out, the source IP of course is $IP and not as 
intended x.y.z.1
So first I was not able to get other DNS to load my zones (they saw an 
unauthorized server sending them notifies, and SPF of course failed because 
email seamed to originate from an unknown ip.)

First quick hack: Get bind and sendmail to only bind on one interface.
Drawback: I'm still finding new daemons that bind to the wrong interface an 
therefore do not work as expected. Some of them cannot be configured to bind 
to a specific ip or interface.

Second dirty hack:
iptables -t nat -A POSTROUTING -o eth0 -s $IP -j SNAT --to-source x.y.z.1

That seamed to work really fine for quite a while until again I found some 
strange phenomenas... I got mrtg and smokeping doing snmp queries of foreign 
hosts.

The Kernel keeps complaining that it sends out SNMP request via eth0 (which 
get SNATed to the IP of eth1) and receives the answers back via eth1.
Same happens with some DNS replies which get dropped because received on the 
'wrong' interface.

Some connections don't even seam to get SNATed at all. (As example 
icmp-host-unreachable messages generated on the router about hosts behind the 
router)

So it there a nice way to solve that Problem with iptables?

Or, what problably would solve all those problems. Is there a way to tell the 
kernel to sort of hide one interface or ip to make sure _nothing_ tries to 
bind it?

Regards
-Benoit-
-- 
SPAM SPAM SPAM SPAM / Hormel's new miracle meat in a can
Tastes fine, saves time. / If you want something grand, / Ask for SPAM!
  - Hormel's 1937 jingle for SPAM

