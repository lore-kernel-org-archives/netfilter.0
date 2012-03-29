From: =?UTF-8?Q?Fran=C3=A7ois_Legal?= <devel@thom.fr.eu.org>
Subject: rtsp helper module
Date: Thu, 29 Mar 2012 17:04:44 +0200
Message-ID: <2e27e7c6d602f258d4d33c4da5b75648@thom.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

I'm using mod rtsp to nat RTP stream from my internet modem to some
machines on the network.

I've got a problem with the patch as it only let the packet through one=
=20
way
(and not let through the RTCP packets sent by the client to the=20
streming
server).

Moreover, I checked the code and did not see any expectation removal=20
when
the connection is terminated. Is this expected ? Anybody can help me to
improve this ?

=46ran=C3=A7ois
