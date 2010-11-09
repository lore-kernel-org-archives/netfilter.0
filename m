From: Marcelo Sobral <msobral@gmail.com>
Subject: Status of ebtables plus MPLS ?
Date: Tue, 9 Nov 2010 16:38:30 -0200
Message-ID: <AANLkTik7jDk3QhHz-6Z7fs_bRHPFdfhup8=3A9_Nqrk1@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type:content-transfer-encoding;
        bh=BpbPD7VrOx4vKiSWSzO7bzCOtlOogZOlUxlzBmMr4y0=;
        b=xPIouU824vGlluRRLQSU39JDVVr3d8RQ9AE19YxkhXdoJSn9gfGykuXJAstl3x71BL
         JUZ3pwGixPcIfIWK3Qtfe6JBLaztjxhkgyxaAF1Up4tlUFHmdIQiiHuJy7S02dmGDtPN
         FYY9Crvr6AEKugNYuvDDZtPdeKgm9TDWXMD18=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

   Hi, I've been trying to run a small example using ebtables and MPLS
(that available in MPLS-Sourceforge -
http://sourceforge.net/apps/mediawiki/mpls-linux/index.php?title=3DExam=
ples).
But everytime I setup my routers, they freeze. The initialization
script is:

brctl addbr br0
brctl addif br0 eth0
ip link set eth1 up
ip link set eth0 up
ip link set br0 up

mpls nhlfe add key 0 instructions push gen 1000 nexthop eth1 ipv4 172.1=
6.0.3
# (returns key 0x2)

# FEC
ebtables -t nat -A PREROUTING -i eth0 -j mpls --nhlfe 0x2

   Soon after the kernel freezes, these messages are shown:

KERNEL: assertion (sk_unhashed(sk)) failed at net/unix/af_unix.c (356)
KERNEL: assertion (!sk->sk_socket) failed at net/unix/af_unix.c (357)
KERNEL: assertion (!atomic_read(&sk->sk_wmem_alloc)) failed at net/unix=
/af_unix$
KERNEL: assertion (!atomic_read(&sk->sk_wmem_alloc)) failed at net/unix=
/af_unix$
KERNEL: assertion (sk_unhashed(sk)) failed at net/unix/af_unix.c (356)
KERNEL: assertion (!sk->sk_socket) failed at net/unix/af_unix.c (357)
KERNEL: assertion (!atomic_read(&sk->sk_wmem_alloc)) failed at net/unix=
/af_unix$
KERNEL: assertion (sk_unhashed(sk)) failed at net/unix/af_unix.c (356)
KERNEL: assertion (!sk->sk_socket) failed at net/unix/af_unix.c (357)
KERNEL: assertion (!atomic_read(&sk->sk_wmem_alloc)) failed at net/unix=
/af_unix$
KERNEL: assertion (!atomic_read(&sk->sk_wmem_alloc)) failed at net/unix=
/af_unix$
KERNEL: assertion (!atomic_read(&sk->sk_wmem_alloc)) failed at net/unix=
/af_unix$
KERNEL: assertion (!atomic_read(&sk->sk_wmem_alloc)) failed at net/unix=
/af_unix$
KERNEL: assertion (sk_unhashed(sk)) failed at net/unix/af_unix.c (356)
KERNEL: assertion (!sk->sk_socket) failed at net/unix/af_unix.c (357)

   I use kernel 2.6.25 with MPLS patches.

   Is there any issue with ebtables and MPLS ?

   Thanks in advance !

--=20
=C2=A0 -----------------------------
=C2=A0 Marcelo Maia Sobral
=C2=A0 Florian=C3=B3polis - SC - Brasil
=C2=A0 MSN ID: msobral@gmail.com
=C2=A0 -----------------------------
