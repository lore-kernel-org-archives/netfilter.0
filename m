From: dhottinger@harrisonburg.k12.va.us
Subject: RFC 1323
Date: Wed, 31 Jan 2007 10:35:31 -0500
Message-ID: <20070131103531.s0uynpyq88wsokwk@www.harrisonburg.k12.va.us>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="flowed"
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

I have a mixed enviroment of apple, windows and linux.  In the apple =20
world I have everything from os 9 up to 10.4.x.  My 10.4 clients =20
software update utility stopped working last week.  10.3 and under =20
still work.  I captured traffic from one 10.4 and 10.3 client at the =20
firewall.  Both machines make the initial connection to =20
swscan.apple.com.  The 10.3 client shows a SYN packet, the 10.4 shows =20
nothing.
Heres 10.4:
Wed Jan 31 09:32:59 2007; TCP; eth2; 238 bytes; from =20
swscan.apple.com:http to 10.40.13.17:49206 (source MAC addr =20
0080c8ca9fba); first packet
Wed Jan 31 09:32:59 2007; TCP; eth2; 52 bytes; from 10.40.13.17:49206 =20
to swscan.apple.com:http (source MAC addr 0009b7135180); first packet

Heres a 10.3 computer doing same:
Wed Jan 31 09:38:08 2007; TCP; eth2; 60 bytes; from 10.40.19.107:49442 =20
to 17.250.248.95:http (source MAC addr 0009b7135180); first packet (SYN)
Wed Jan 31 09:38:08 2007; TCP; eth2; 60 bytes; from 17.250.248.95:http =20
to 10.40.19.107:49442 (source MAC addr 0080c8ca9fba); first packet (SYN)

After much googling and head scratching and deleting of cache files =20
and .plists on the apples, I found a reference to RFC 1323 and how =20
apple's update servers arent RFC 1323 compliant.  My question is how =20
to I get my firewall running iptables v 1.2.9 to work with apples =20
software update servers.  And maybe Im missing the entire boat and =20
this isnt the issue.  I have made no Firewall changes and everything =20
worked fine until last week.

thanks,

ddh


--=20
Dwayne Hottinger
Network Administrator
Harrisonburg City Public Schools


