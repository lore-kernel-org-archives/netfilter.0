From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrackd failover works partially, was Re: conntrack performance
 test results in INVALID packets
Date: Thu, 04 Sep 2008 13:40:42 +0200
Message-ID: <48BFC93A.1050905@netfilter.org>
References: <488064DD.5080509@bock.nu> <alpine.LNX.1.10.0807181212331.12734@fbirervta.pbzchgretzou.qr> <488075F1.80901@bock.nu> <4880891C.4090004@netfilter.org> <4880A6BA.6030007@bock.nu> <489C0835.3090900@netfilter.org> <48BD09B6.5010905@bock.nu> <48BD0DD6.9000803@netfilter.org> <48BD32CC.5010203@bock.nu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48BD32CC.5010203@bock.nu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bernhard Bock <mailinglists@bock.nu>
Cc: netfilter@vger.kernel.org

Bernhard Bock wrote:
> Pablo Neira Ayuso wrote:
>> That's exactly the test that I do in my testbed and it works fine here,
>> the problem must be elsewhere. The following line should help to see how
>> the connection tracking is marking the traffic as invalid:
>>
>> echo 255 > /proc/sys/net/ipv4/netfilter/ip_conntrack_log_invalid
>>
>> However, please see the comment below before doing this and repeating
>> the test.
> 
> I didn't know one can increase the verbosity. Now I get some (more)
> helpful logs.
> 
> kernel: nf_ct_tcp: invalid packet ignored IN= OUT= SRC=10.5.0.101
> DST=10.6.6.102 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=9977 DF PROTO=TCP
> SPT=39101 DPT=80 SEQ=3381624888 ACK=0 WINDOW=5840 RES=0x00 SYN URGP=0 OPT
> 
> Invalid syn packet?

The firewall is out-of-sync, this means that firewall has a different
state than the client and the server. The packet is not marked as
invalid, so it is not dropped but it is logged if
ip_conntrack_log_invalid is set up.

> Hm. And then:
> 
> kernel: nf_ct_tcp: killing out of sync session IN= OUT= SRC=10.6.6.102
> DST=10.5.0.101 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=TCP SPT=80
> DPT=41647 SEQ=3243074286 ACK=3280173284 WINDOW=5792 RES=0x00 ACK SYN
> URGP=0 OPT

The firewall sees the syn-ack from the server after the previous -
ignored - syn packet.  Since the firewall is out-of-sync, the connection
tracking system kills conntrack and now it blocks the packet. Thus, the
client has to resend the syn to start a clean session.

Just to clarify, I don't think that these logs are very helpful for the
problem that you're reporting.

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers
