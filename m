From: Roman Fiedler <roman.fiedler@ait.ac.at>
Subject: Re: Diskless and Firewall
Date: Tue, 6 Apr 2010 09:41:42 +0200
Message-ID: <4BBAE5B6.1030505@ait.ac.at>
References: <1270117547.3335.15.camel@khaled-laptop>	 <4BB4AB9E.3080208@ait.ac.at> <1270279479.3340.1.camel@khaled-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1270279479.3340.1.camel@khaled-laptop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Khaled Hussein <khaled@bisan.com>
Cc: netfilter <netfilter@vger.kernel.org>

Khaled Hussein wrote:
> Dear Roman, 
> 
> how can i set conntrack liberal globally (via proc)?

You can do it using:
echo 1 > /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_be_liberal
echo 1 > /proc/sys/net/netfilter/nf_conntrack_tcp_be_liberal

I only use these settings for a short moment, so I don't know
exactly what the difference between both controls is. I set
them back to 0 as soon as possible.

Best Regards,
Roman

> Best Regards,
> ==========================
> Khaled J. Hussein
> Senior System Engineer
> Bisan Systems Ltd.
> Tel: +970-22985941
> Fax: +970-22985942
> Web: www.bisan.com
> Email: khaled@bisan.com
> ========================== 
