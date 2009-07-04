From: Martin <martin.listz@gmail.com>
Subject: Ipsec/L2tp with NETKEY
Date: Fri, 03 Jul 2009 21:21:46 -0300
Message-ID: <1246666906.5753.31.camel@localhost>
Reply-To: martin.listz@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:subject:from:reply-to:to
         :content-type:date:message-id:mime-version:x-mailer
         :content-transfer-encoding;
        bh=qoLiqHbZTlco5ORC9pb89xnBVfoUupFimaMXDvxNQg8=;
        b=JsrJIUtufypr9oIsSPNe/ut5OUQp6ezONF+oVTFNFJT3T4hnu0tEr+haW7edqznaop
         xfbU7E8mekTtMNOL2W1RpN3DQLx8QOOTC4r2T3XZUTDZPgjVoY6ul7yKKGfPvIOZJwgR
         q56ZyGUK3k1hryDc5hXBMtY2Oat2tvWJRp/nQ=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi list!


I've been looking for a solution for this for a few days, but couldn't
find any solution.


I've configured a VPN in a Debian box using openswan to do ipsec and
l2tp, as it is pretty simple to implement on Windows and Mac users and
it doesn't needs any 3rd party software.

My problem is that openswan uses netkey for ipsec unless you patch the
kernel to use klips, and netkey doesn't create an ipsec0 interface, and
makes it really difficult to firewall things to l2tp, and having as a
unique soltution (without compiling kernel), leaving l2tp port wide
open.


Here is a diagram, just for fun ;)

MS-client ==== /ext interface/ Linux GW /internal interface/ ==== LAN


What I see is that user completes ipsec auth, and then tries to connect
to the l2tpd's port (7101) on the external interface, and then I must
accept connections in that port, or the vpn connection fails.


Any suggestions how to let connections on udp 1701 only to connections
before authenticated by ipsec?


Cheers


Martin

