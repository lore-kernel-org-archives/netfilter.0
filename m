From: Wan Seman Bin Wan Ismail <wswi@scan-associates.net>
Subject: Statefull??
Date: Mon, 05 Apr 2004 10:58:06 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4070CB3E.3000603@scan-associates.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Dear all,

I got a problem dealing with my current iptables rules

here is my iptables rules:-

$ipt -A FORWARD -i $EXT -o $DMZ -p tcp -m tcp -s 0/0 -d $WEB --dport 80
- -j LOG --log-level info --log-prefix "[IN WEB] :"
$ipt -A FORWARD -i $EXT -o $DMZ -p tcp -m tcp -s 0/0 -d $WEB --dport 80
- -j ACCEPT


$ipt -A FORWARD -i ! $EXT -m state --state NEW -j ACCEPT
$ipt -A FORWARD -i $EXT -m state --state ESTABLISHED,RELATED -j LOG
- --log-prefix "Established conn: "
$ipt -A FORWARD -i $EXT -m state --state ESTABLISHED,RELATED -j ACCEPT
$ipt -A FORWARD -i $EXT -o $DMZ  -p tcp -m tcp ! --tcp-flags SYN,RST,ACK
SYN -m state --state NEW -j LOG --log-prefix "NEW NOT SYN: "
$ipt -A FORWARD -i $EXT -o $DMZ  -p tcp -m tcp ! --tcp-flags SYN,RST,ACK
SYN -m state --state NEW -j DROP

$ipt -A FORWARD -i $EXT -o $DMZ -p tcp -j LOG --log-level info
- --log-prefix " EXT-DMZ TCP DROP "
$ipt -A FORWARD -i $EXT -o $DMZ -p tcp -j REJECT
$ipt -A FORWARD -i $DMZ -o $EXT -p tcp -j LOG --log-level info
- --log-prefix " DMZ-EXT TCP DROP "
$ipt -A FORWARD -i $DMZ -o $EXT -p tcp -j REJECT
$ipt -A FORWARD -i $EXT -o $DMZ -p udp -j LOG --log-level info
- --log-prefix " EXT-DMZ UDP DROP "
$ipt -A FORWARD -i $EXT -o $DMZ -p udp -j REJECT
$ipt -A FORWARD -i $DMZ -o $EXT -p udp -j LOG --log-level info
- --log-prefix " DMZ-EXT UDP DROP "
$ipt -A FORWARD -i $DMZ -o $EXT -p udp -j REJECT


so my problem is why ppl outside can't browse my webpages?

so here is the logApr  4 18:30:33 gatekeeper kernel: [IN WEB] :IN=eth0
OUT=eth2 SRC=yyyy DST=xxxx LEN=52 TOS=0x00 PREC=0x60 TTL=48 ID=43502
DF PROTO=TCP SPT=31633 DPT=80 WINDOW=17376 RES=0x00 ACK FIN URGP=0

Apr  4 18:30:33 gatekeeper kernel:  DMZ-EXT TCP DROP IN=eth2 OUT=eth0
SRC=xxxx DST=yyyy LEN=52 TOS=0x00 PREC=0x00 TTL=63 ID=47448 DF PROTO=TCP
SPT=80 DPT=31633 WINDOW=17376 RES=0x00 ACK URGP=0

why the next rule keep blocking the packets? did the iptables support
statefull connection?

i don't even see this problem if using pf (openbsd), so did anyone here
can solve out my problem??




-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAcMs+nnQOtAme0WcRAi7oAJ46DyS3NuilYjHQoWeAuUiCDm3N6gCfdl9C
plHh7522RwTppWOzUlAUOf8=
=w3V0
-----END PGP SIGNATURE-----

