From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: -i interface filter not working for firewall
Date: Mon, 04 Dec 2006 15:20:22 +0100
Message-ID: <45742EA6.1040301@plouf.fr.eu.org>
References: <b020b8120611300905t7f440ef9mf940a128fd8d46e6@mail.gmail.com>	<b020b8120611300908r386fda2apf6dc55fe09aee2b@mail.gmail.com>	<4572F669.1000206@rtij.nl>
	<b020b8120612040541w4b969840qc1d6abdef3db099b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <b020b8120612040541w4b969840qc1d6abdef3db099b@mail.gmail.com>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

victor oliveira a =E9crit :
> eth2 and eth3 are both connected to the same switch, and are not
> virtual. Each with a different IP.

And I suppose they are not in separate VLANs. Don't search further.
By default, the Linux kernel will accept IP traffic and reply to ARP=20
requests for any local address on any interface. Since eth2 and eth3 are=20
on the same link, both interfaces receive ARP requests, and by default=20
both reply with their own MAC address to ARP requests for the IP address=20
of eth2, so IP traffic for that IP address may be sent to eth3 instead=20
of eth2. If you want to change the default behaviour so that an=20
interface replies to ARP requests only for its own IP address, check the=20
following kernel parameters in /proc/sys/net/ipv4/conf/<interface>/ :

arp_filter - BOOLEAN
     1 - Allows you to have multiple network interfaces on the same
     subnet, and have the ARPs for each interface be answered
     based on whether or not the kernel would route a packet from
     the ARP'd IP out that interface (therefore you must use source
     based routing for this to work). In other words it allows control
     of which cards (usually 1) will respond to an arp request.

     0 - (default) The kernel can respond to arp requests with addresses
     from other interfaces. This may seem wrong but it usually makes
     sense, because it increases the chance of successful communication.
     IP addresses are owned by the complete host on Linux, not by
     particular interfaces. Only for more complex setups like load-
     balancing, does this behaviour cause problems.

     arp_filter for the interface will be enabled if at least one of
     conf/{all,interface}/arp_filter is set to TRUE,
     it will be disabled otherwise

arp_ignore - INTEGER
     Define different modes for sending replies in response to
     received ARP requests that resolve local target IP addresses:
     0 - (default): reply for any local target IP address, configured
     on any interface
     1 - reply only if the target IP address is local address
     configured on the incoming interface
     2 - reply only if the target IP address is local address
     configured on the incoming interface and both with the
     sender's IP address are part from same subnet on this interface
     3 - do not reply for local addresses configured with scope host,
     only resolutions for global and link addresses are replied
     4-7 - reserved
     8 - do not reply for all local addresses

     The max value from conf/{all,interface}/arp_ignore is used
     when ARP request is received on the {interface}

Try this :
echo 1 > /proc/sys/net/ipv4/conf/eth2/arp_ignore
echo 1 > /proc/sys/net/ipv4/conf/eth3/arp_ignore


However, my opinion is that having two interfaces on the same logical=20
link (link-layer broadcast domain) is not a good idea, and having two=20
interfaces in the same IP subnet is not a good idea either. Besides,=20
what is the use of filtering traffic incoming on interfaces that are on=20
the same network differently ?

