From: Mrunal Upadhyay <m.upadhyay@sta.samsung.com>
Subject: Set DSCP field for ipv6 packets using ip6tables command
Date: Wed, 25 Jan 2012 17:17:40 -0600
Message-ID: <083EE18768D966439D1223E96B690A910629868C79@staex7mb2.telecom.sna.samsung.com>
References: <083EE18768D966439D1223E96B690A910629868A65@staex7mb2.telecom.sna.samsung.com>
 <alpine.LNX.2.01.1201252203130.24440@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1201252203130.24440@frira.zrqbmnf.qr>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Cc: Jan Engelhardt <jengelh@medozas.de>

>On Wednesday 2012-01-25 20:35, Mrunal Upadhyay wrote:

>>I am currently trying to set DSCP fields for IPV4 and IPV6 packets with 
>>the version 1.3.7 of iptables using Linux kernel 2.6.35.7.
>>iptables -t mangle -I OUTPUT -p udp --dport 10000:30000 -j DSCP 
>>--set-dscp-class EF
>>
>>However when I am trying to fire the same command for IPV6 packets, is 
>>does not recognize the target DSCP.
>>
>>So my questions are Is there any way to set the TRAFFIC CLASS/ TOS/ 
>>DSCP field using ip6tables command for ipv6 packets?

>-j TOS sets the Class field in IPv6 and TOS field in IPv4.

Hi,
Thank you very much for the reply.

I tried to use the -j TOS option but it only sets the TOS field to Minimize-Delay, Maximize-Throughput, Maximize-Reliability, Minimize-Cost or Normal-Service.

I am more interested in setting the Differentiated Service Code Point Bits to classes EF, BE or any of CSxx or AFxx classes just for ipv6 packets using ip6tables command.

