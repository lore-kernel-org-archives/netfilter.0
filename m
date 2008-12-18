From: "Oscar N" <oscar@linnea.net>
Subject: Re: Problems with UNIX SCO
Date: Thu, 18 Dec 2008 22:05:31 +0100 (CET)
Message-ID: <48839.90.239.73.117.1229634331.squirrel@mh.linnea.com>
References: <186247.24078.qm@web33206.mail.mud.yahoo.com>
Reply-To: oscar@linnea.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <186247.24078.qm@web33206.mail.mud.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@vger.kernel.org>

Don't know if this has anything to do with your problem but some network
drivers calculate checksum on the network card, so if you to tcpdump
directly on sending machine it can report checksum errors.

/Regards Oscar

>  Friends:
>
>  The problems is not only with UNIX. If I put two routers
>  Linux with my modules the communications between boths are
>  OK but when I try to connect from a Client the TCP reports
>  checksum problems. For example:
>
>
>  Linux1    ------   Linux2
>
>  is OK, but
>
>
>  Client (windows or Linux)    ------ Linux1 ------- Linux2
>
>  The Client reports checksum TCP errors. The gateway for the
>  Client is Linux1 and the TCP is made form Client to the
>  Linux2.
>
>  It's like the TCP checksum was modify but the TCP
>  checksum depends only of data and the IP directions and this
>  not change, beside, the original packet content (protocol,
>  length, ..) is restore. I see the TCP checksum header before
>  modify the packets and its the same when I restore the
>  original packets, so I think that the pseudo header is the
>  problem but I don't have clear whats the problem.
>
>
>  I glad to receive some comments,
>
>  Thanks.
>
>  Postdata: I use SUSE Enterprise Server 10.
>
>
>
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


