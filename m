From: "Ming-Ching Tiew" <mingching.tiew@redtone.com>
Subject: Re: virtual interfaces
Date: Mon, 5 Jul 2004 14:49:17 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003201c4625c$315c1c90$0100a8c0@newlife>
References: <20040705062734.92171.qmail@web54007.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: ip tables <netfilter@lists.netfilter.org>


> What i thought was to have a virtual interface and
> bind the other internet routable address to it, ex
> eth0:0. What are my options?
> Also how could i do the POSTROUTING SNAT if I cannot
> use virtual in terfaces?
> 

You can use the Source IP or Destination IP, can't you ?

....-i eth0 -A POSTROUTING -s 192.168.128.6 -j SNAT --to 64.24.12.46 
....-i eth0 -A POSTROUTING -s 192.168.128.5 -j SNAT --to 64.24.12.45 

....-i eth1 -A PREROUTING -d 64.24.12.46 -j DNAT --to 192.168.128.6
....-i eth1 -A PREROUTING -d 64.24.12.45 -j DNAT --to 192.168.128.5











