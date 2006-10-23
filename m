From: Bo Yang <struggle@mail.nankai.edu.cn>
Subject: Re: mac match and FORWARD chain
Date: Mon, 23 Oct 2006 09:46:51 +0800
Message-ID: <361568247.28633@mail.nankai.edu.cn>
References: <361567501.01771@mail.nankai.edu.cn>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Message-ID: <453C1F0B.4010707@mail.nankai.edu.cn>
In-Reply-To: <361567501.01771@mail.nankai.edu.cn>
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
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1
 
Wakko Warner :
> Keep me in CC.
>
> I'd like to request that the mac match not be allowed in the FORWARD chain
> as it does not function the way that some may think.
>
> The tests I've performed indicate that the match will match the MAC address
> of the transmitting interface (not what one would expect if attempting to
> allow based on the mac address of the sender and blocking all other
packets)
>
> I'd like to hear comments about this.  If it is not fesable to do this, I'd
> recommend adding text to the man page so that others do not fall into the
> same problem I did.
>
> I have already worked around this problem in my setup.
MAC address is some concept in the link layer , so how do
you get the packet sender mac if the packet is routed to your
box through some other routers ?

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org
 
iD8DBQFFPB8L7tZp58UCwyMRAthwAKDXi4s4YznMzB58lEAYcn/QD5cHrACgo6/I
KvAaZB7hBiqKaJt7AE4duxs=
=znkf
-----END PGP SIGNATURE-----


