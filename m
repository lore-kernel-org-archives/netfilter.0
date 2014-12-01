From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nft icmpv6 mld-listener-query rule not honored?
Date: Mon, 1 Dec 2014 13:59:40 +0100
Message-ID: <20141201125940.GA11047@salvia>
References: <547483B3.6040207@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <547483B3.6040207@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: stoffl4ever <stoffl4ever@gmail.com>
Cc: netfilter@vger.kernel.org

On Tue, Nov 25, 2014 at 02:27:15PM +0100, stoffl4ever wrote:
> Hallo,
> 
> I am trying to get a basic nftables set up working but i cannot figure
> out why  the packets get rejected despite the afaik correct rule to all
> this traffic. The overall result is that IPv6 connectivity is lost
> because the router seams not to be able to route any IPv6 Traffic to the
> host if Type=130 aka. mld-listener-query packets are rejected. May be
> someone could help me and correct me where i am wrong or point me to
> some documentation that would explain my misconceptions.
> 
> SysInfo:
> kernel: 3.17.4.201411220955-1-grsec (all nf* modules loaded)
> nft: nftables v0.3
> Network setup via systemd-networkd: br0(bridge) is attached to
> eth0(physical nic)
> 
> nft rule set:
> 
> table inet filter {
>         chain input {
>                  type filter hook input priority 0;
>                  ip protocol icmp icmp type { echo-request} accept
>                  ip6 nexthdr ipv6-icmp icmpv6 type { packet-too-big,
> mld-listener-query, nd-router-advert, mld-listener-report,
> nd-neighbor-advert, nd-neighbor-solicit, echo-reply,
> mld-listener-reduction, echo-request, destination-unreachable} accept
>                  log prefix "REJECTED - " counter packets 211 bytes 11718 reject
>         }
> 
>         chain forward {
>                  type filter hook forward priority 0;
>         }
> 
>         chain output {
>                  type filter hook output priority 0;
>         }
> }
> 
> 
> From Log: (interesting message is the second one)
> 
> kernel: REJECTED - IN=br0 OUT= PHYSIN=eth0
> MAC=01:00:5e:00:00:01:fe:54:00:02:14:8a:08:00 SRC=0.0.0.0 DST=224.0.0.1
> LEN=32 TOS=0x00 PREC=0xC0 TTL=1 ID=0 DF PROTO=2
> Nov 25 13:49:57
> kernel: REJECTED - IN=br0 OUT= PHYSIN=eth0
> MAC=33:33:00:00:00:01:fe:54:00:02:14:8a:86:dd
> SRC=fe80:0000:0000:0000:8497:04ff:fee4:07e0
> DST=ff02:0000:0000:0000:0000:0000:0000:0001 LEN=72 TC=0 HOPLIMIT=1
> FLOWLBL=0 PROTO=ICMPv6 TYPE=130 CODE=0

You need these two patches:

http://git.kernel.org/cgit/linux/kernel/git/pablo/nf-next.git/commit/?id=68b0faa87d167ec87ba2a26be62241ad94eb449b
http://git.kernel.org/cgit/linux/kernel/git/pablo/nf-next.git/commit/?id=1b63d4b9b54cee6002757a8d20b537aa4037ae8f

They apply to Linux kernel 3.18-rc.

The second patch sets the transport layer offset to get layer 4
protocol matching from the bridge. Please, I'd appreciate if you can
give them a test and report, those two are scheduled for 3.19.

BTW, I noticed that you're using the 'inet' family. I guess you're
using bridge netfilter. I think you should use the 'bridge' family
instead, it comes with native working reject support since the
upcoming 3.18.

One of the goals of nftables is to supersede br_netfilter.
