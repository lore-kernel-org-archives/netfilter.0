From: Jason Price <jprice@cyberbuzz.gatech.edu>
Subject: Netfilter and Vonage.
Date: Wed, 19 May 2004 23:37:40 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040519233740.A27043@redfish.gatech.edu>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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

Running Gentoo, kernel version 2.4.24 on a Sparc Ultra 10

I have recently purchased Vonage Voice over IP.  In their 'how to make this
work with a linksys device', they say (basically):

Forward udp ports 53, 69, 5060, 5061, and 10000-20000 to the device.

I interpret this to mean:

iptables -t nat -A PREROUTING -i eth0 -p udp -d $EXTERNAL_IP \
		--dport 53 -j DNAT --to 192.168.0.5:53

etc for each port.

Unfortunatly, I don't seem to be able to specify a range of ports in the
iptables syntax.  So, when I get to that large, 10,000 wide range of ports,
it dies.  After much tinkering, I find that I can do:

for port in {10000..10597}; do
   iptables -t nat -A PREROUTING -i eth0 -p udp -d $EXTERNAL_IP \
		--dport $port -j DNAT --to 192.168.0.5:${port}
done

and it will work.  If I do just 1 port more, iptables fails, and all the
tables get magically flushed (which isn't a good idea by the by, but we'll
get there later).

Idealy, I'd like to:

iptables -t nat -A PREROUTING -i eth0 -p udp -d $EXTERNAL_IP \
		--dport 10000-20000 -j DNAT --to 192.168.0.5:10000-20000

and call it a day.

Their table that describes this (text version of the linksys web
configuration tool.  '_' are unchecked boxes, 'X' are checked boxes):

Ext.Port		Protocol	Protocol	IP		Enable
			TCP		UDP
53 to 53		_		X		192.168.0.5	X
69 to 69		_		X		192.168.0.5	X
5060 to 5061		_		X		192.168.0.5	X
10000 to 20000		_		X		192.168.0.5	X

Any help would be greatly appreciated.

Thanks;
--Jason

