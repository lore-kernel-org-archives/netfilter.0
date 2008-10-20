From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Some weird issue with return traffic with redirect rule
Date: Mon, 20 Oct 2008 16:24:17 -0500
Message-ID: <48FCF701.20709@riverviewtech.net>
References: <cc64e8ce0810162330i44d61166xc16eafc0cfbf3834@mail.gmail.com>	 <48F8C91E.5010608@riverviewtech.net> <cc64e8ce0810171246j131d3651rea38e4efee507608@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <cc64e8ce0810171246j131d3651rea38e4efee507608@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 10/17/08 14:46, Pranav Desai wrote:
> Too many clients will have to change their settings. Not feasible in 
> our case.

*nod*

This is where auto-configure scripts come in to play.

If you can't, you cant.  No point in ruffling any feathers over it.  If 
transparent proxying is working for you then go for it.

> There is no info there, and the tables are not getting full. Here are 
> the conntrack settings.
> 
> net.ipv4.ip_conntrack_max = 1048576
> net.ipv4.netfilter.ip_conntrack_buckets = 1048576
> net.ipv4.netfilter.ip_conntrack_count = 63908
> net.ipv4.netfilter.ip_conntrack_max = 1048576

If conntrack is not getting full I wonder if some packets are 
accidentally not being associated and thus not being handled correctly.

Dare I say it, you may be looking at setting up TCPDump (or the likes) 
to record all packets.  That way when you do have packets that did not 
get handled correctly you can go back and look at the rest of the 
packets that should have been associated but were not.



Grant. . . .
