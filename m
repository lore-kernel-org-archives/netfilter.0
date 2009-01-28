From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: nth match extension (was: Blocking outgoing 802.11 ACKs)
Date: Wed, 28 Jan 2009 13:23:10 +0100
Message-ID: <49804E2E.30604@plouf.fr.eu.org>
References: <441977.39906.qm@web31604.mail.mud.yahoo.com> <d39744a20901280329y4a2edc9yc0f7c59eb86c4bbc@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <d39744a20901280329y4a2edc9yc0f7c59eb86c4bbc@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

Ivan Petrushev a =E9crit :
> iptables has "nth" match extension that matches every n-th packet.

Be aware that "nth" was in the patch-o-matic and was never included in=20
the standard kernel. It has been superseded by the "statistic" match=20
added in kernel 2.6.18 and iptables 1.3.6.
