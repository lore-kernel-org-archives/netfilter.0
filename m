From: lutz.niederer@gmx.net
Subject: frequent network hangs on kernel 2.4.32 & netfilter 1.2.8
Date: Mon, 19 Dec 2005 09:31:23 +0100 (MET)
Message-ID: <18759.1134981083@www32.gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hi,

I just made the step from RH kernel 2.4.18 & RH nf 1.2.5 to kernel.org's
2.4.32 and netfilter 1.2.8 (the one from fedoralegacy.org).
Now I see strange problems where the network connections on all interfaces
suddenly become very sluggish, slow and sometimes simply stuck.  If I stop
iptables and restart iptables it works again.  Sometimes it takes some
seconds.  I have no idea where this comes from.  Is it the kernel?  Is it
the iptables?  How do I find out?  Is there something known about this
kernel / iptables version?  Has anybody seen something similar?  How can I
debug?  Any help/tips?

Thanks a lot!
-lutzn


--=20
Lust, ein paar Euro nebenbei zu verdienen? Ohne Kosten, ohne Risiko!
Satte Provisionen f=FCr GMX Partner: http://www.gmx.net/de/go/partner

