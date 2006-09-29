From: Bo Yang <struggle@mail.nankai.edu.cn>
Subject: Re: default drop on prerouting
Date: Fri, 29 Sep 2006 12:34:01 +0800
Message-ID: <359504678.29170@mail.nankai.edu.cn>
References: <359464355.22539@mail.nankai.edu.cn>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Message-ID: <451CA239.50001@mail.nankai.edu.cn>
In-Reply-To: <359464355.22539@mail.nankai.edu.cn>
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
 
gabrix :
> I have default drop on all INPUT,OUTPUT,FORWARD iptables
> chains.What if i default drop also the prerouting chain in the
> iptables script and than accepting connections for services on my
> inside lan pcs ? Thanks ! Gabriele
>
>
I think there is nothing difference in the prerouting chain . You can
just set it to drop any package by default and
allow some special kinds of package to through your box !

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org
 
iD8DBQFFHKI47tZp58UCwyMRAjyiAJ4qu/50TZBwZfx56I4HNLN7Mbn69QCePAL9
tVagNtndW/9YuoBTnJFoUKI=
=qoXZ
-----END PGP SIGNATURE-----


