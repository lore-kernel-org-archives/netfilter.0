From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: Limits higher than 10000/sec
Date: Sun, 9 Dec 2012 23:41:52 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1212092341330.15774@nerf07.vanv.qr>
References: <CAFANWtU9aeFjgUvczjnCETxy4h01aFs6JnDcK_ikxz-ijJ=Adg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAFANWtU9aeFjgUvczjnCETxy4h01aFs6JnDcK_ikxz-ijJ=Adg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Darius Jahandarie <djahandarie@gmail.com>
Cc: netfilter@vger.kernel.org

On Sunday 2012-12-09 21:05, Darius Jahandarie wrote:

>Hi all. I currently have an iptables rule like follows in the raw table:
>
>-A PREROUTING -p tcp --dport 1234 --syn -m limit --limit 10000/sec
>--limit-burst 10000 -j ACCEPT
>-A PREROUTING -p tcp --syn -j DROP
>
>Does anyone have thoughts on a way to get some sort of rate-limiting
>(TBF or otherwise) that can handle more PPS than the limit module
>while still being as efficient as possible?

 -j RATEEST, -m rateest
