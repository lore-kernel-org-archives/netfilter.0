From: Florian Boelstler <euphoria@web.de>
Subject: Re: traceroute
Date: Thu, 01 Jul 2004 00:36:18 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40E34062.90505@web.de>
References: <00df01c45ea2$f5dc1290$49caa8c0@caris.priv> <200406301429.14248.Antony@Soft-Solutions.co.uk> <40E334EC.1080606@web.de> <200406302252.10870.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406302252.10870.Antony@Soft-Solutions.co.uk>
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
To: netfilter <netfilter@lists.netfilter.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

Antony Stone wrote:
> Tell us how you handle NEW packets leaving the machine.

Well, I just realized by looking at your reply that I only have set:

$IPTABLES -A OUTPUT -p ICMP --icmp-type echo-request -j ACCEPT

Which of the icmp-type displayed "iptables -p icmp -h" do I need to make
traceroute work?

By looking at other posts in this thread I've learned that traceroutes
are done with echo-requests. Is this true for Linux 2.6.6 ?

Thanks,

  Florian



...............................

Someone on the net said:
G'Kar: 2 hours ago my government declared war on the Centari Republic


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Debian - http://enigmail.mozdev.org

iD8DBQFA40BiwT2gPfZm6tURAkaLAJ4zRVtBrVbhxVgcPuCs/ZiGVvX1TACdGJOU
eKewKcpjQbMlyTtm9omcJZ8=
=qjuX
-----END PGP SIGNATURE-----

