From: "Baake, Matthias" <m.baake@porta.de>
Subject: RE: Multiple Source IP Addresses
Date: Fri, 11 Mar 2005 09:21:40 +0100
Message-ID: <201E6F5AC48C274996A5AD8304FAEF869A04@p001ex03.porta.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-class: urn:content-classes:message
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
To: "Dennis O. Aliev" <daliev@etecom.com>
Cc: netfilter@lists.netfilter.org

If i understood it the right way you want to map an internal machine =
(e.g. Webserver) to an external address.
Then you have to make a Rule into NAT Prerouting to redirect specific =
Traffic to the internal machine.

IPTABLES -t nat -A PREROUTING -i $EXT_IF -d $Your_ext_ip -j DNAT =
--to-destination $IP_OF_YOUR_INTERNAL_WEBSERVER

The filtering for this map you can still do in the filter table. Like =
your rule you already posted.
This way your Internal Webserver should be reachable from the Internet.

/matthias baake



-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org]On Behalf Of Dennis O.
Aliev
Sent: Friday, March 11, 2005 4:50 AM
To: netfilter@lists.netfilter.org
Cc: sergey@etecom.com; daliev@etecom.com
Subject: Multiple Source IP Addresses


Good evening,

Is there a way to send traffic from host behind IPTables firewall using =
different external source IP addresses that are assigned to firewall on =
the external interface?

Host behind firewall has single IP address (192.168.1.94)  and making  =
http based requests to internet.

Firewall has following rules to make it work:
iptables -t filter -A forward -o eth0 -p tcp -s 192.168.1.94 --dport 80 =
-j ACCEPT
iptables -t nat -A POSTROUTING -o eth0 -s 192.168.1.94 -j SNAT =
--to-source some_external_ip

I was thinking of making http request from host to a different port and =
then based on that change source address to another external address and =
change the destination port to 80, but can't figure out how to do that.

Does anyone have any ideas? Perhaps there is a different approach?
--=20

Dennis O. Aliev=20


