From: Florian Boelstler <euphoria@web.de>
Subject: Re: traceroute
Date: Thu, 01 Jul 2004 01:06:29 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40E34775.5010802@web.de>
References: <00df01c45ea2$f5dc1290$49caa8c0@caris.priv> <200406302252.10870.Antony@Soft-Solutions.co.uk> <40E34062.90505@web.de> <200406302339.02075.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406302339.02075.Antony@Soft-Solutions.co.uk>
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

Antony Stone wrote:
>>By looking at other posts in this thread I've learned that traceroutes
>>are done with echo-requests. Is this true for Linux 2.6.6 ?
>
>
> No, that's true for Windows systems.   Unix machines (Linux included)
uses
> high-port numbered UDP packets.
>
> Therefore you need to allow UDP packets to leave your machine for you
to be
> able to run traceroute from it.

Hmm, this could end up in an unfeasible task, when I do not allow
unrestricted output.

I just found out that traceroute offers a -I switch, that uses ICMP echo
requests instead.
On the other hand one could use -p for a specific base port to get a
certain determinism.

   Florian



...............................

Someone on the net said:
I am Clinton of Borg. Prepare to see me make a fool of myself.


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Debian - http://enigmail.mozdev.org

iD8DBQFA40d1wT2gPfZm6tURAn4AAJ9OfnD/kMw7Ua1ss/7lRfQzIbo5SgCfezgN
Ch0ifus6ReGzusVIarwR+z8=
=bIgk
-----END PGP SIGNATURE-----

