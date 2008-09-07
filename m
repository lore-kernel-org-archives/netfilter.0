From: =?ISO-8859-1?Q?Jo=E3o_Valverde?= <backup95@netcabo.pt>
Subject: NFNETLINK answers: File exists
Date: Sun, 07 Sep 2008 17:07:09 +0100
Message-ID: <48C3FC2D.903@netcabo.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello everyone,

I'm working on a program that uses libnetfilter_queue, and after the=20
program crashes or I have to kill it I get the following error starting=
 up:

NFNETLINK answers: File exists
Error during nfq_bind_pf(): File exists

Rebooting fixes it so I guess the netlink socket in question is a=20
"virtual" one. What I'd like to know is how to clear this error without=
=20
rebooting?

Thank you for your help,

Jo=E3o Valverde
