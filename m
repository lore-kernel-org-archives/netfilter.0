From: "Jorge Bastos" <mysql.jorge@decimal.pt>
Subject: Re: PPTP Problem with 2.6.20-rc1 >=
Date: Tue, 16 Jan 2007 20:51:43 -0000
Message-ID: <06d701c739b0$2164a5e0$0a01a8c0@pcjorge>
References: <001d01c7399d$66573b30$0301a8c0@hercules.decimalint.pt>
	<45AD3872.4060103@pason.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="response"
To: netfilter@lists.netfilter.org

Hum... Yes

There's changes now?



----- Original Message ----- 
From: "Michael Gale" <michael.gale@pason.com>
To: "Jorge Bastos" <mysql.jorge@decimal.pt>
Cc: <netfilter@lists.netfilter.org>
Sent: Tuesday, January 16, 2007 8:41 PM
Subject: Re: PPTP Problem with 2.6.20-rc1 >=


> Hello,
>
> Were you using MPPE or any other specific kernel modules with the older 
> kernel ?
>
> Michael
>
> Jorge Bastos wrote:
>> Hi,
>> I just updated kernel to 2.6.20-rc5, and i can't make pptp connections 
>> anymore, is just stoped in the AUTH step, hanging up witout sucess.
>>
>> My cenario is:
>>
>> My private network => linux router (this machine) => ISP
>>
>> I can see that diferent modules are used now, before i used:
>> ---
>> ip_nat_pptp
>> ip_conntrack_pptp
>> ---
>>
>> Now there's new modules with new names, like:
>> nf_nat_pptp
>> nf_conntrack_pptp
>>
>> Are they the same with diferent names?
>> Thanks,
>> Jorge
>>
>> Below there the modules i have loaded:
>>
>> ---
>> ipt_REJECT              3584  2
>> xt_tcpudp               3200  38
>> nf_nat_pptp             3712  0
>> nf_conntrack_pptp       6656  1 nf_nat_pptp
>> nf_conntrack_proto_gre     4992  1 nf_conntrack_pptp
>> nf_nat_proto_gre        2820  1 nf_nat_pptp
>> nf_nat_ftp              3328  0
>> nf_conntrack_ftp        8320  1 nf_nat_ftp
>> nf_nat_irc              2688  0
>> nf_conntrack_irc        6168  1 nf_nat_irc
>> ipt_MASQUERADE          3456  1
>> iptable_nat             7300  1
>> nf_nat                 15404  6 
>> nf_nat_pptp,nf_nat_proto_gre,nf_nat_ftp,nf_nat_irc,ipt_MASQUERADE,iptable_nat 
>> nf_conntrack_ipv4      15372  2 iptable_nat
>> nf_conntrack           54488  11 
>> nf_nat_pptp,nf_conntrack_pptp,nf_conntrack_proto_gre,nf_nat_ftp,nf_conntrack_ftp,nf_nat_irc,nf_conntrack_irc,ipt_MASQUERADE,iptable_nat,nf_nat,nf_conntrack_ipv4 
>> nfnetlink               5656  2 nf_conntrack_ipv4,nf_conntrack
>> iptable_filter          2688  1
>> ip_tables              10952  2 iptable_nat,iptable_filter
>> x_tables               12548  5 
>> ipt_REJECT,xt_tcpudp,ipt_MASQUERADE,iptable_nat,ip_tables
>>
>>
>> And dmesg show's me:
>>
>> ip_tables: (C) 2000-2006 Netfilter Core Team
>> Netfilter messages via NETLINK v0.30.
>> nf_conntrack version 0.5.0 (1024 buckets, 8192 max)
>>
>>
>> ---
>>
>
> -- 
> Michael Gale
>
> Red Hat Certified Engineer
> Network Administrator
> Pason Systems Corp.
> 


