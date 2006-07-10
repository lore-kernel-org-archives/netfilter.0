From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: iptables rule doesn't work
Date: Mon, 10 Jul 2006 23:31:32 +0200 (CEST)
Message-ID: <1241.10.0.1.1.1152567092.squirrel@webmail.sterenborg.info>
References: <200607082247.06089.antonio.dibacco@aruba.it>
	<61640.193.173.147.3.1152533638.squirrel@webmail.sterenborg.info>
	<200607102128.03366.antonio.dibacco@aruba.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200607102128.03366.antonio.dibacco@aruba.it>
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

On Mon, July 10, 2006 21:28, Antonio Di Bacco wrote:
> Hi,
> my problem is a little bit different from usual:

I fixed up the ASCII drawing; is it correct?

> LAN-A   ---------    PtP    ---------   LAN-B
> --------| Box A |-----------| Box B |--------
>    eth0 --------- eth1 eth1 --------- eth0
>
> eth0: 192.168.1.15          eth0: 192.168.1.15
> eth1: 192.168.0.20          eth1: 192.168.0.21
>
> Both the boxes are identical,
> this means that both ETH1 must be configured the same way

I hope they do not have the same IP, so I put in different IP addresses.

> and the two eth0 too.
> ETH1 has the NOARP flag set and I chose for them IP 192.168.0.20.

And 192.168.0.21?

> Forwarding is enabled too.

Yes, but as asked before: do you have any FORWARD rules (filter table) se=
t
that allow/deny this?

> ETH0(s) have 192.168.1.15 .
> Both boxes run a web-server.
>
>
> I then I configured iptables as here on both boxes:
>
>
> ifconfig eth1 192.168.0.20 -arp
> iptables -t nat -F
> iptables -t nat -A POSTROUTING -o eth1  -p tcp -j SNAT --to-source \
> 192.168.0.21:6000-6050

If you are using connection tracking I don't hink you need this SNAT rule=
.

> iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 80 -j DNAT \
> --to-destination 192.168.0.20:80
> iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 8081 -j DNAT \
> --to 192.168.0.21:80
>
>
> I try to connect with my browser on a notebook on LAN-A
> to address 192.168.1.15:8080 and I expect to receive answer from BOX-B =
web

I see no rule for port 8080 which is going to be redirected to Box-B. Did=
 you
make a typo? Actually, I think I see what you want to do, but these rules=
 are
not going to do it.

> server but nothing happens. Box B receives a tcp packet 192.168.0.21:60=
00 ->
> 192.168.0.21:80 on eth1 (tcpdump saw it) but the web server doesn't rec=
eive
> this packet probably.

Yes, well, I'll give it a shot.

I don't think your setup will work this way. The problem is this:

- You send a packet from LAN-A with source IP 192.168.1.x to Box-A, dport=
 8080.
- The packet gets DNAT-ed to Box-B port 80.
- Box-B sees the packet was sent from IP 192.168.1.x (it's DNAT-ed, not
SNAT-ed, so you rewrite the destination IP:port, not the source IP).
- Box-B also has a LAN connected with IP range 192.168.1.0.
- Box-B sends the reply packet to LAN-B instead of back to LAN-A because
routing tells it to do so.
- Your reply packet is "lost".

I haven't tried such setup myself but that's what I think is happening.
Someone please correct me if I'm wrong.


Gr,
Rob



