From: "Oscar N" <oscar@linnea.net>
Subject: Re: NAT TABLE Size
Date: Thu, 21 Feb 2008 17:41:08 +0100 (CET)
Message-ID: <54368.85.119.130.97.1203612068.squirrel@mh.linnea.com>
References: <14426.217.78.42.11.1203601437.squirrel@webmail.sys.kth.se>
Reply-To: oscar@linnea.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <14426.217.78.42.11.1203601437.squirrel@webmail.sys.kth.se>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Memon,Arshad Mehrab" <arshadm@kth.se>
Cc: netfilter@vger.kernel.org

Maybe this is what you're looking for?
/proc/sys/net/ipv4/ip_conntrack_max

/Mvh Oscar

>
> Hi,
>    How can i increase the NAT table size and its timeout value.I am facing
> this problem in the Linux based router when playing games or using
> torrent.
>  /Blessed
>
>
>
> -
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


