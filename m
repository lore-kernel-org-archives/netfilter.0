From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: messages in /var/log/message file
Date: Thu, 10 Oct 2002 12:39:59 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0210101234220.27631-100000@blackhole.kfki.hu>
References: <3DA3D4CE.9050407@inbox.lv>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3DA3D4CE.9050407@inbox.lv>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arindam Haldar <arindamhaldar@inbox.lv>
Cc: netfilter <netfilter@lists.netfilter.org>

On Wed, 9 Oct 2002, Arindam Haldar wrote:

> Oct  9 12:26:31 ICG kernel: ip_conntrack: max number of expected
> connections 1 of ftp reached for <ipA> -> <ipB>, reusing
> Oct  9 12:27:12 ICG kernel: ip_conntrack: max number of expected
> connections 1 of ftp reached for <ipA> -> <ipB>, reusing
>
> these messages are piling the message file.
> am cusrious now why so ?.. what does this message signify ?

It means, that the FTP client in question sends new PORT/PASV commands
without establishing the data channel. The ip_conntrack_ftp module
registers the new request by overwriting the previous one and logs the
problem.

Regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


