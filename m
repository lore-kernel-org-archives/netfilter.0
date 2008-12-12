From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: UDP netbios nameserver packets blocked
Date: Fri, 12 Dec 2008 13:42:16 +0100
Message-ID: <49425C28.3090401@freemail.hu>
References: <493DBE52.1010003@www.knutejohnson.com> <493E4A95.7040302@freemail.hu> <493EBB3A.8080300@www.knutejohnson.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <493EBB3A.8080300@www.knutejohnson.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Knute Johnson <knute2008@www.knutejohnson.com>, Netfilter list <netfilter@vger.kernel.org>

Hello,

Knute Johnson =EDrta:
> Can you point me to a list of the modules what they do?
>
> Thanks very much,
Every nf_conntrack* module extends the whole conntracking subsystem.
The name tells you the protocol.

Check your modules directory

Swifty

