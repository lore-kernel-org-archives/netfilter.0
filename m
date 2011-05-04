From: Alessandro Vesely <vesely@tana.it>
Subject: Re: libnetfilter_queue question
Date: Wed, 04 May 2011 20:13:13 +0200
Message-ID: <4DC19739.2040008@tana.it>
References: <1304489658.32272.19.camel@compot-mob>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tana.it; s=test;
	t=1304532810; bh=VKLfW34s6WL8bw4HoQRezk5ejldMlICMAhT7PWaaXN8=;
	l=2878;
	h=Message-ID:Date:From:MIME-Version:To:References:In-Reply-To:
	 Content-Transfer-Encoding;
	b=Rd8r3GAg9/Xqc+uN825tg2gco/UvqWq0lp0hS0ROYp4VRTAOYliKrZ5Q7uf2K3Ci9
	 Y/Qj1eKivtzXLeO+zfPK6JCob8Dt6GWColALXO/tYMmGaA7gV1FiDbDwWdKZ5kZ9T3
	 Ul5HmkO11q8f+Kh2wSf/7RvkcaoZK01h0H163X7g=
In-Reply-To: <1304489658.32272.19.camel@compot-mob>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On 04.05.2011 08:14, nowhere wrote:
> 5. Worker threads accept packets, which (if I understand correctly)
> still reside in kernel netfilter queue

Part of them are copied to user's space (no payload but only metadata,
according to your use of nfq_set_mode).

> Then I do the following to test the setup:
> iptables -t mangle -A POSTROUTING -p icmp -d 10.77.130.72 -j NFQUEUE
> --queue-num 1
> 
> and then start ping. If i do normal ping, everything works like expected
> 
> $ping 10.77.130.72
> PING 10.77.130.72 (10.77.130.72) 56(84) bytes of data.
> 64 bytes from 10.77.130.72: icmp_req=1 ttl=64 time=97.0 ms
> 64 bytes from 10.77.130.72: icmp_req=2 ttl=64 time=97.1 ms
> 64 bytes from 10.77.130.72: icmp_req=3 ttl=64 time=97.6 ms
> 64 bytes from 10.77.130.72: icmp_req=4 ttl=64 time=93.6 ms
> 64 bytes from 10.77.130.72: icmp_req=5 ttl=64 time=101 ms
> 64 bytes from 10.77.130.72: icmp_req=6 ttl=64 time=94.8 ms
> 
> Packets are passed to the target host, delay is applied. Stats from
> application and fro iptables counters show consistent figures.
> 
> But when I issue flood ping I see this:
> $ sudo ping 10.77.130.72 -i0
> PING 10.77.130.72 (10.77.130.72) 56(84) bytes of data.
> 64 bytes from 10.77.130.72: icmp_req=1 ttl=64 time=111 ms
> 64 bytes from 10.77.130.72: icmp_req=8 ttl=64 time=118 ms
> 64 bytes from 10.77.130.72: icmp_req=9 ttl=64 time=114 ms
> 64 bytes from 10.77.130.72: icmp_req=10 ttl=64 time=104 ms
> 64 bytes from 10.77.130.72: icmp_req=11 ttl=64 time=93.5 ms
> 64 bytes from 10.77.130.72: icmp_req=12 ttl=64 time=93.9 ms
> 64 bytes from 10.77.130.72: icmp_req=13 ttl=64 time=94.3 ms
> 64 bytes from 10.77.130.72: icmp_req=14 ttl=64 time=101 ms
> 64 bytes from 10.77.130.72: icmp_req=15 ttl=64 time=96.8 ms
> 
> There are 7 packets dropped at the beginning.

I assume you meant 6 (15 - 9)

> Several packets at the beginning get lost.

Are they always at the beginning, or does that depend on the distribution of
delays?

> iptables counters show, that NFQUEUE rule has processed all the packets
> (15 in this example), app debug output shows 15 processed packets,

They were seen, but it seems the verdict didn't arrive in time for 6 of them.

> nfqueue stat show no drops, tc -s -d qdisc show dev eth0 shows no drops
> in the interface queue. But tcpdump has caught only 9 packets on remote
> and on local hosts.

The relationship between filter and local tcpdump is not always obvious, IME.
 Perhaps, your choice of table/chain makes it better.  Anyway, the remote
host cannot get it wrong.  Did you dump requests, responses, or both?

> There is app's source code here. Maybe, I'm doing something wrong in it?

I see nothing wrong in it.  However, I'd print out occurrences of rv < 0
after recv() and look for errno==ENOBUFS in particular.  It should report
lost packets.

hth
