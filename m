From: Wan Seman Bin Wan Ismail <wswi@scan-associates.net>
Subject: Re: Statefull??
Date: Mon, 05 Apr 2004 15:52:40 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40711048.8070706@scan-associates.net>
References: <4070CB3E.3000603@scan-associates.net> <200404041228.25943.Antony@Soft-Solutions.co.uk> <4070E0B8.2050706@scan-associates.net> <200404041345.16938.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200404041345.16938.Antony@Soft-Solutions.co.uk>
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


|>Antony Stone wrote:

|
| I suggest you add a rule allowing ESTABLISHED,RELATED (but not NEW)
packets
| from the DMZ to EXT.   That will allow replies but no new connections.
|
| However, I also suggest you think very carefully about not allowing NEW
| connections from your web server to the outside world - specifically in
| relation to DNS - are you sure the web server itself never needs to do
| external lookups (perhaps for visitor logs etc)?   So long as this is
true,
| you'll be okay, but I think you should keep an eye on your netfilter log
| entries to see if the web server is trying to make some external
connections
| which you actually decide you want to allow.
|
| Regards,
|
| Antony.
|
already did that and it's work.. thanks.. but somehow i would like to
allow my web for updating security patches from xxxx server, but the fw
have rejected the req.


here is my rules:-

$ipt -A SCAN -i $EXT -o $DMZ -p tcp -m tcp -s 0/0 -d $WEB --dport 80 -j
LOG --log-level info --log-prefix "[IN WEB] :"
$ipt -A SCAN -i $EXT -o $DMZ -p tcp -m tcp -s 0/0 -d $WEB --dport 80 -j
ACCEPT

$ipt -A SCAN -i $EXT -m state --state ESTABLISHED,RELATED -j LOG
- --log-prefix "Established conn: "
$ipt -A SCAN -i $EXT -m state --state ESTABLISHED,RELATED -j ACCEPT
$ipt -A SCAN -i $EXT -o $DMZ  -p tcp -m tcp ! --tcp-flags SYN,RST,ACK
SYN -m state --state NEW -j LOG --log-prefix "NEW NOT SYN: "
$ipt -A SCAN -i $EXT -o $DMZ  -p tcp -m tcp ! --tcp-flags SYN,RST,ACK
SYN -m state --state NEW -j DROP


$ipt -A FORWARD -i $DMZ -p tcp -m state --state NEW -s $WEB -d xxxx
- --dport 80 -j LOG --log-level info --log-prefix "OUT DNS :"
$ipt -A FORWARD -i $DMZ -p tcp -m state --state NEW -s $WEB -d xxxx
- --dport 80 -j ACCEPT
$ipt -A FORWARD -i $DMZ -o $EXT -p tcp -m tcp -m state --state NEW -j
LOG --log-level info --log-prefix "[Init DMZ] "
$ipt -A FORWARD -i $DMZ -o $EXT -p tcp -m tcp -m state --state NEW  -j
REJECT



-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAcRBInnQOtAme0WcRAmcmAJ984xfpZiOX0icdK3/vwWn9boVZRgCeKeiX
znZp8xcWxMoN+XDYh9LZ5u0=
=1Lj9
-----END PGP SIGNATURE-----

