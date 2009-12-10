From: =?UTF-8?Q?Fran=C3=A7ois_Legal?= <devel@thom.fr.eu.org>
Subject: SIP Helper
Date: Thu, 10 Dec 2009 15:24:55 +0100
Message-ID: <9f5567f3c2cc479f6aa065e0d0606a3a@thom.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: netfilter@vger.kernel.org

Hello,=20

I'm starting to use the SIP conntrack helper.=20

I'm using freeswitch for my internal lan, but need to use an external S=
IP
gateway to pass calls.=20

As I was not able to configure it so that the RTP stream could flow in =
&
out, I took a look at the code.=20

=46rom what I could read, it seems to me that this helper module has be=
en
developped for the opposite need (an external UA registering through th=
e
netfilter gateway to a SIP registrar/proxy).=20

Is that assumption correct ?=20

=46ran=C3=A7ois
