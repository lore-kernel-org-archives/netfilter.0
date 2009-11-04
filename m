From: =?ISO-8859-1?Q?Fran=E7ois?= Delawarde 
	<fdelawarde@wirelessmundi.com>
Subject: kernel panic when adding QUEUE to OUTGOING
Date: Wed, 04 Nov 2009 12:01:34 +0100
Message-ID: <1257332494.1254.218.camel@francois.tc.commsmundi.com>
Reply-To: fdelawarde@wirelessmundi.com
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: netfilter@vger.kernel.org

Hello,

I got a kernel panic trying the following command on two different
computers with vanila kernel 2.6.30.9, and as soon as some traffic is
sent. Curriously I could not reproduce in QEMU.

There is no user space program handling the QUEUE (I did not have the
chance to get to that part).

# iptables -I OUTPUT -j QUEUE

Sorry I could only get a picture of the screen:
http://imagebin.org/70454


Regards,
=46ran=C3=A7ois.

