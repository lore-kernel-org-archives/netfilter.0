From: "msn" <msn@vtopia.co.kr>
Subject: How to register DROP rules in the kernel mode
Date: Wed, 21 Nov 2007 16:14:12 +0900 (KST)
Message-ID: <2156.211.111.195.128.1195629252.squirrel@211.111.194.2>
Reply-To: msn@vtopia.co.kr
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org


Hi, i'm trying to writing the kerenl modules which is hooking the packet
from kernel mode, also it'll registering specific ip address to netfilter
drop rules. any one knows samples whatever ? thanks in advance.

all ruls comes from do_replace() in the ip_tables.c which copying from
user space, i guess. this is what i want exactly. i mean need to get the
exampls of the do_replace().

Cheers.



