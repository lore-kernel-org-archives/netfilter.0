From: Wan Seman Bin Wan Ismail <wswi@scan-associates.net>
Subject: Re: Statefull??
Date: Mon, 05 Apr 2004 12:29:44 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4070E0B8.2050706@scan-associates.net>
References: <4070CB3E.3000603@scan-associates.net> <200404041228.25943.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200404041228.25943.Antony@Soft-Solutions.co.uk>
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

Antony Stone wrote:

|
| Because you are REJECTing the reply packets from the server :)
|
| Just take a look at the above rules, and think firstly about a SYN
packet from
| the client (EXT) to the server (on the DMZ).
|
| It will match the first and second rules, and therefore gets LOGged, and
| ACCEPTed.
|
| Now think about the SYN ACK replly packet from the server (on the DMZ)
to the
| client (EXT).
|
| It will match the tenth and eleventh rules, and therefore gets LOGged and
| REJECTed.
|
| Hope this explains the problem.
|
| Regards,
|
| Antony.
|

i still can't figure out, if i modified the rule then add this entry,
ppl on my web (got shell access) can go anywhere.

$ipt -A SCAN -i $DMZ -o $EXT -p tcp -m tcp --tcp-flags SYN,RST,ACK SYN
- -m state --state NEW  -j REJECT


That's not what i want, what i need is my web server can serve ppl from
outside but fw denied any new connections from the web server to
outside. for example using pf

block in on fxp0 from any to any
pass in on fxp0 inet proto tcp from any to web port=80 keep state
block out log on fxp0 from $web to any

thanks in advance... and please advice :-)


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAcOC3nnQOtAme0WcRAnInAJ9wj/sooPdpQlb1k3+Q1XSrLK6ATwCfbqR1
EfBjVnlHZN7Sn6GtWrKeu5s=
=HMdw
-----END PGP SIGNATURE-----

