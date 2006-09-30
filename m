From: Bo Yang <struggle@mail.nankai.edu.cn>
Subject: Re: Marks set in PREROUTING got lost
Date: Sat, 30 Sep 2006 14:29:51 +0800
Message-ID: <359598032.21356@mail.nankai.edu.cn>
References: <451B0E63.3010806@gmx.de>	<Pine.LNX.4.61.0609281029430.21498@yvahk01.tjqt.qr>	<451B9794.9090209@gmx.de>
	<451BBD3D.40305@eternet.cc>	<Pine.LNX.4.61.0609281430270.26317@yvahk01.tjqt.qr>	<451BF2CA.5060001@gmx.de>
	<359510883.21717@mail.nankai.edu.cn>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Message-ID: <451E0EDF.2050901@mail.nankai.edu.cn>
In-Reply-To: <359510883.21717@mail.nankai.edu.cn>
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
 
Jan Engelhardt:
>>> You have to mark it in the PREROUTING chain of the mangle
>>> table, to be able to match on it within the PREROUTING chain of
>>> the nat table.
>> Is this also true, if I jump from PREROUTING mangle in a user
>> defined chain and mark my packets there?
>
> Just make sure it gets marked in a table/chain (or subchain
> thereof) before the nat-PREROUTING chain is hit, according to
> http://www.imagestream.com/~josh/PacketFlow-new.png
>
Good stuff , very clear flow !
Thank you !

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org
 
iD8DBQFFHg7e7tZp58UCwyMRAqgDAJ9mVf92fMHZUL5PHhL0UtNBJn9nnACfS4rx
UG7NZsE/bgQMsbQTYnzCMdo=
=5FpZ
-----END PGP SIGNATURE-----


