From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: Append rule to a NFQUEUE?
Date: Mon, 4 Mar 2013 21:06:36 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1303042106250.23678@nerf07.vanv.qr>
References: <20130212095049.GA21858@devnull>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20130212095049.GA21858@devnull>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Aaron Lewis <the.warl0ck.1989@gmail.com>
Cc: netfilter mailing list <netfilter@vger.kernel.org>

On Tuesday 2013-02-12 10:50, Aaron Lewis wrote:

>Hi,
>
>I would like to log everything in a created queue,
>
>iptables -A NFQUEUE --queue-num 0 -j LOG
>
>But that doesn't work, any ideas?

Log first, then feed to queue.
