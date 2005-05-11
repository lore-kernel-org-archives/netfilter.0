From: Christoph Georgi <christoph.georgi@web.de>
Subject: Re: Two link adsl on the same server
Date: Wed, 11 May 2005 19:22:07 +1200
Message-ID: <4281B29F.4090302@web.de>
References: <00ee01c5557d$e1979d90$8b00000a@PIVT>
	<4280EA95.8020306@phreaker.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4280EA95.8020306@phreaker.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ro0ot <ro0ot@phreaker.net>
Cc: Netfilter list <netfilter@lists.netfilter.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

I don't quite get, why this has to be made so "complicated". I have two
uplinks and do the following:

Mark the traffic according to the uplink that I want to use
* no mark -> default/non-priority traffic
* -j MARK 1 for priority traffic (over the fast line, usually ISP 1)
* -j MARK 2 for traffic always over ISP 1
* -j MARK 3 for traffic always over ISP 2

Accordingly I have four routing tables:
* 201 for priority traffic just containing
~  'default via <gateway of isp 1> dev eth0
* 202 for traffic static over ISP 1
~  'default via <gateway of isp 1> dev eth0
* 203 for traffic static over ISP 2
~  'defualt via <gateway of isp 2> dev ppp0
* default routing table (254)
~  after all the "strange" entries
~  'default via <gateway of isp 2> dev ppp0

I have to SNAT the traffic that is routed via the priority table (201)
and the 202 table, as the kernel uses the IP of the ISP in the default
routing table (254) as source, and I have to disable rp_filters. No more
fancy routing stuff set up.. And everything works fine.

Am I missing an important point?

thanks
.christoph


ro0ot wrote:
| Below is only examples: -
|
[...]

- --


Christoph Georgi
- -----------------------------
email.  christoph.georgi@web.de
fon.	+64 (0)9 815 8259

registered linux user #380268
ubuntu 5.04 (ubuntu.com)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFCgbJ/gQyJJUB4UhwRAgZgAKCDhqb6b/uBlALc8JNdhfnEe69aQwCg7QS6
HQmCzmKJMLTvnQ7UanmYicA=
=t3Ur
-----END PGP SIGNATURE-----

