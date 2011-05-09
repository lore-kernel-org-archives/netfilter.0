From: Ed W <lists@wildgooses.com>
Subject: Re: High accuracy bandwidth accounting?
Date: Tue, 10 May 2011 00:23:09 +0100
Message-ID: <4DC8775D.1080007@wildgooses.com>
References: <4DC7F632.9020105@wildgooses.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4DC7F632.9020105@wildgooses.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Netfilter <netfilter@vger.kernel.org>

On 09/05/2011 15:12, Ed W wrote:
> 1) Best way to do per user traffic accounting *per* internet gateway. ie
> each gateway will have quite radically different costs to run and so we
> need to also count traffic per route.  My current thinking is to use
> packet marking to choose the route and my tests suggest that I can
> pickup this mark via conntrack and therefore account using ulogd/pmacct
> or similar?  Anyone got any thoughts on other ways to slice this or
> anything I am missing?

I have been experimenting with logging conntrack flows using ulogd2.  However, 
the numbers aren't stacking up against a simple iptables accounting rule...  
Is there an expectation that nf_conntrack should log every single byte in/out?

An example seems to be to cause a name lookup via dnsmasq. For whatever reason 
this does two simultaneous dns requests to both configured dns servers.  One 
reply comes back slightly quicker than the other and the slower reply appears 
to cause a local ICMP unreachable response to be generated.  Everything is 
logged *except* the data for the ICMP unreachable response?

So tcpdump gives me (note sizes are payload, add 28 to compare with conntrack):

22:23:40.151666 IP 10.141.36.76.25630 > 8.8.4.4.53: 11049+ AAAA? www.yahoo.co.uk. (33)
22:23:40.151993 IP 10.141.36.76.25630 > 8.8.8.8.53: 11049+ AAAA? www.yahoo.co.uk. (33)
22:23:40.850776 IP 8.8.4.4.53 > 10.141.36.76.25630: 11049 3/1/0 CNAME rc.yahoo.com., CNAME rc.g01.yahoodns.net., CNAME any-rc.a01.yahoodns.net. (178)
22:23:41.014108 IP 8.8.8.8.53 > 10.141.36.76.25630: 11049 3/1/0 CNAME rc.yahoo.com., CNAME rc.g01.yahoodns.net., CNAME any-rc.a01.yahoodns.net. (178)

22:23:41.014217 IP 10.141.36.76 > 8.8.8.8: ICMP 10.141.36.76 udp port 25630 unreachable, length 214

22:23:41.401743 IP 10.141.36.76.10248 > 8.8.4.4.53: 25285+ A? www.yahoo.co.uk. (33)
22:23:41.764124 IP 8.8.4.4.53 > 10.141.36.76.10248: 25285 4/0/0 CNAME rc.yahoo.com., CNAME rc.g01.yahoodns.net., CNAME any-rc.a01.yahoodns.net., A 77.238.178.122 (133)


However, conntrack gives me:

May  9 22:24:10 localhost [DESTROY] ORIG: SRC=10.141.36.76 DST=8.8.4.4 PROTO=UDP SPT=25630 DPT=53 PKTS=1 BYTES=61 , REPLY: SRC=8.8.4.4 DST=10.141.36.76 PROTO=UDP SPT=53 DPT=25630 PKTS=1 BYTES=206 
May  9 22:24:10 localhost [DESTROY] ORIG: SRC=10.141.36.76 DST=8.8.8.8 PROTO=UDP SPT=25630 DPT=53 PKTS=1 BYTES=61 , REPLY: SRC=8.8.8.8 DST=10.141.36.76 PROTO=UDP SPT=53 DPT=25630 PKTS=1 BYTES=206 
May  9 22:24:11 localhost [DESTROY] ORIG: SRC=10.141.36.76 DST=8.8.4.4 PROTO=UDP SPT=10248 DPT=53 PKTS=1 BYTES=61 , REPLY: SRC=8.8.4.4 DST=10.141.36.76 PROTO=UDP SPT=53 DPT=10248 PKTS=1 BYTES=161 


Basically it's missing any count for the packet with tcpdump timestamp: 22:23:41.014217 - ie the port unreachable response?  This is confirmed by looking at the iptables counts


Disregarding whether this is good protocol use or not, I need to track to byte accurate levels - do I therefore need to avoid conntrack based accounting?  Or is this a "bug" in conntrack or in ulogd?  Conntrack based accounting has lured me in because it seems to do a lot of the heavy lifting for me - would be nice if this turned out to be fixable?

Anyone know of any other reasons that conntrack accounting might not count some traffic? (corrupted packets? tcp resends?)

Just trying to get the base architecture correct from the start!

Thanks

Ed W
