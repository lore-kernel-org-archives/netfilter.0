From: Ed W <lists@wildgooses.com>
Subject: Re: High accuracy bandwidth accounting?
Date: Sat, 14 May 2011 14:36:00 +0100
Message-ID: <4DCE8540.4060909@wildgooses.com>
References: <4DC7F632.9020105@wildgooses.com>	 <4DC8775D.1080007@wildgooses.com> <1305365024.1921.475.camel@andybev-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1305365024.1921.475.camel@andybev-desktop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Beverley <andy@andybev.com>
Cc: Netfilter <netfilter@vger.kernel.org>

>> I have been experimenting with logging conntrack flows using ulogd2.  However, 
>> the numbers aren't stacking up against a simple iptables accounting rule...  
>> Is there an expectation that nf_conntrack should log every single byte in/out?
>>
>> An example seems to be to cause a name lookup via dnsmasq. For whatever reason 
>> this does two simultaneous dns requests to both configured dns servers.  One 
>> reply comes back slightly quicker than the other and the slower reply appears 
>> to cause a local ICMP unreachable response to be generated.  Everything is 
>> logged *except* the data for the ICMP unreachable response?
>>
>> So tcpdump gives me (note sizes are payload, add 28 to compare with conntrack):
>>
>> 22:23:40.151666 IP 10.141.36.76.25630 > 8.8.4.4.53: 11049+ AAAA? www.yahoo.co.uk. (33)
>> 22:23:40.151993 IP 10.141.36.76.25630 > 8.8.8.8.53: 11049+ AAAA? www.yahoo.co.uk. (33)
>> 22:23:40.850776 IP 8.8.4.4.53 > 10.141.36.76.25630: 11049 3/1/0 CNAME rc.yahoo.com., CNAME rc.g01.yahoodns.net., CNAME any-rc.a01.yahoodns.net. (178)
>> 22:23:41.014108 IP 8.8.8.8.53 > 10.141.36.76.25630: 11049 3/1/0 CNAME rc.yahoo.com., CNAME rc.g01.yahoodns.net., CNAME any-rc.a01.yahoodns.net. (178)
>>
>> 22:23:41.014217 IP 10.141.36.76 > 8.8.8.8: ICMP 10.141.36.76 udp port 25630 unreachable, length 214
>>
>> 22:23:41.401743 IP 10.141.36.76.10248 > 8.8.4.4.53: 25285+ A? www.yahoo.co.uk. (33)
>> 22:23:41.764124 IP 8.8.4.4.53 > 10.141.36.76.10248: 25285 4/0/0 CNAME rc.yahoo.com., CNAME rc.g01.yahoodns.net., CNAME any-rc.a01.yahoodns.net., A 77.238.178.122 (133)
>>
>>
>> However, conntrack gives me:
>>
>> May  9 22:24:10 localhost [DESTROY] ORIG: SRC=10.141.36.76 DST=8.8.4.4 PROTO=UDP SPT=25630 DPT=53 PKTS=1 BYTES=61 , REPLY: SRC=8.8.4.4 DST=10.141.36.76 PROTO=UDP SPT=53 DPT=25630 PKTS=1 BYTES=206 
>> May  9 22:24:10 localhost [DESTROY] ORIG: SRC=10.141.36.76 DST=8.8.8.8 PROTO=UDP SPT=25630 DPT=53 PKTS=1 BYTES=61 , REPLY: SRC=8.8.8.8 DST=10.141.36.76 PROTO=UDP SPT=53 DPT=25630 PKTS=1 BYTES=206 
>> May  9 22:24:11 localhost [DESTROY] ORIG: SRC=10.141.36.76 DST=8.8.4.4 PROTO=UDP SPT=10248 DPT=53 PKTS=1 BYTES=61 , REPLY: SRC=8.8.4.4 DST=10.141.36.76 PROTO=UDP SPT=53 DPT=10248 PKTS=1 BYTES=161 
>>
>>
>> Basically it's missing any count for the packet with tcpdump timestamp: 22:23:41.014217 - ie the port unreachable response?  This is confirmed by looking at the iptables counts

> 
> Have you tried investigating whether the ICMP packets in question are
> making it into any of the conntrack system? Maybe by using the userspace
> program, or my using the conntrack match extension in iptables?

I think that these UDP packets are completely missing the entire
conntrack system?

I am using ulogd2 to dump all the connections and the ones above are all
that I see.  Therefore either there is a bug in ulogd2 which isn't
spitting out this connection or conntrack completely misses this packet?
(arguably whether should it be applied to this connection or not mind?)

I think you are leaning towards confirming this is unexpected and could
be reported as a "bug"?  I wrote up the above on the -devel list but
didn't attract any comments so far

It would be interesting to hear if this is a "bug" or expected?

Cheers

Ed W
