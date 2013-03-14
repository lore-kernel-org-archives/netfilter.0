From: Stefan Sabolowitsch <Stefan.Sabolowitsch@felten-group.com>
Subject: Re: need help with nfqueue and bridge
Date: Thu, 14 Mar 2013 17:08:49 +0000
Message-ID: <E7F178B652D7E546A7B0B46511A3A5B91984790B@SFG21.feltengroup.local>
References: <E7F178B652D7E546A7B0B46511A3A5B919843D2A@SFG21.feltengroup.local>
 <alpine.LNX.2.01.1303141753370.19695@nerf07.vanv.qr>
Reply-To: Stefan.Sabolowitsch@felten-group.com
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=felten-group.com;
	s=feltengroup_com; l=2769; t=1363280935; x=1363885735;
	q=dns/txt; h=DomainKey-Signature:Received:VBR-Info:Received:From:
	To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	References:In-Reply-To:Accept-Language:Content-Language:
	Content-Type:Content-ID:Content-Transfer-Encoding:MIME-Version:
	Reply-To; bh=r7GDIPltF7vxU311EHWH9wxpUzpQeScd/ce4emeCV9w=; b=BaG
	r2e7JO8sXdJI9eIXgQ+toYFqKkfosh5iossp/4t0FctuYtBT+oR+e3u6q1zedsOX
	Dom+0eYJmTTcydWw/8bcBTHOd5RbDfXs9LKvlMm4bGvyi/MtOOkJJs3l661TU0Ua
	idiePrN1B6989T9X+fBXIdu6TLGEYhOveqmX0olg=
In-Reply-To: <alpine.LNX.2.01.1303141753370.19695@nerf07.vanv.qr>
Content-Language: de-DE
Content-ID: <316F16CF106622459C41B0487AB9EB5B@felten-group.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "<jengelh@inai.de>" <jengelh@inai.de>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi Jan,
hmm, on this machine run in IPD mode (suricata / snort ) with out any problems and this bridges, but  i have only problems with nfqueue and this bridge br2.
Jan what can i do to solve this Problem ? (in br2 give it vlan tagged traffic)

thx for your help and time.
Stefan 

Am 14.03.2013 um 17:56 schrieb Jan Engelhardt <jengelh@inai.de>
:

> On Thursday 2013-03-14 15:51, Stefan Sabolowitsch wrote:
> 
>> Hi all,
>> i have here Centos 6.4 with 3.8.2-2.el6.elrepo.x86_64 kernel an latest iptables.
>> 
>> I have the following Queue:
>> Queue 1 and 2 have data but not 3 (br2)
>> Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
>> num   pkts bytes target     prot opt in     out     source               destination         
>> 1     901K  728M NFQUEUE    all  --  br0    *       0.0.0.0/0            0.0.0.0/0            NFQUEUE num 1 bypass
>> 2     117K 9150K NFQUEUE    all  --  br1    *       0.0.0.0/0            0.0.0.0/0            NFQUEUE num 2 bypass
>> 3        0     0 NFQUEUE    all  --  br2    *       0.0.0.0/0            0.0.0.0/0            NFQUEUE num 3 bypass
>> 
>> [root@ipd2 Wecker-DMZ]# tcpdump -i br2
>> tcpdump: WARNING: br2: no IPv4 address assigned
>> tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
>> listening on br2, link-type EN10MB (Ethernet), capture size 65535 bytes
> [...]
>> 14:48:32.752335 IP 192.168.21.12.55191 > 239.255.255.250.ssdp: UDP, length 133
>> 14:48:36.645248 IP 192.168.21.12.netbios-dgm > 192.168.21.255.netbios-dgm: NBT UDP PACKET(138)
>> 14:48:53.830337 IP 192.168.21.16.54218 > fa-in-f108.1e100.net.imaps: Flags [S], seq 4290929463, win 14600, options [mss 1460,sackOK,TS val 56595795 ecr 0,nop,wscale 6], length 0
>> 14:48:54.126394 IP 192.168.22.13.39232 > 173.192.219.140-static.reverse.softlayer.com.https: Flags [P.], seq 2793050904:2793050905, ack 1478286381, win 8120, options [nop,nop,TS val 3886140 ecr 3960200924], length 1
>> 14:48:54.269009 IP 173.192.219.140-static.reverse.softlayer.com.https > 192.168.22.13.39232: Flags [.], ack 1, win 513, options [nop,nop,TS val 3960484207 ecr 3886140], length 0
>> 14:48:55.165501 IP 192.168.22.13.39232 > 173.192.219.140-static.reverse.softlayer.com.https: Flags [P.], seq 1:3, ack 1, win 8120, options [nop,nop,TS val 3886198 ecr 3960484207], length 2
>> 14:48:55.308009 IP 173.192.219.140-static.reverse.softlayer.com.https > 192.168.22.13.39232: Flags [.], ack 3, win 513, options [nop,nop,TS val 3960485246 ecr 3886198], length 0
>> 
>> any idea ?
> 
> I could imagine that the packets you see on br2 do not actually get into
> FORWARD, but are all delievered to, and sent from, a local endpoint.
> 


