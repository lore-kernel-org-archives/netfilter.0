From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: Strange problems on iptables (FC17) .... need your help
Date: Thu, 4 Oct 2012 01:02:10 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1210040058160.6228@nerf07.vanv.qr>
References: <1349288885.6825.9.camel@indica.cc.iitb.ac.in>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1349288885.6825.9.camel@indica.cc.iitb.ac.in>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ajit K Jena <ajit@iitb.ac.in>
Cc: netfilter@vger.kernel.org


On Wednesday 2012-10-03 20:28, Ajit K Jena wrote:
>
># The following is to just produce a log of all outgoing packets from
># IPs that are members in the set src_nm_set.
># The set has only one member with IP 10.209.13.6.
>
>-A FORWARD -p tcp -m set --match-set src_nm_set src \
>        -m multiport --dports 80:64000 -j LOG --log-level 4 --log-prefix
>"nm_http_outword: "

Why would you allow ports 81 through 64000? That seems like the oddest
range ever, even more so than the usually pointless 1024:65535.

># The following is to just produce a log of all incoming packets
>-A FORWARD -p tcp -m set --match-set src_nm_set dst \
>        -m multiport --sports 80:64000 -j LOG --log-level 4 --log-prefix
>"nm_http_inword: "

(outward - inward. No words here.)

>  c) The "inward" log entry is **NOT** produced in the logfile.
>  d) It appears as if the packet is simply dropped.
>  How do I go about debugging this further ?

Log all other packets that are not logged by the outward or inward one.
Their contents may be sufficiently different that your rules don't fire.
