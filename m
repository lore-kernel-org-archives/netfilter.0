From: Jan Niggemann <jn@hz6.de>
Subject: Re: conntrack GRE behaves differently in 3.17 / 3.18
Date: Wed, 21 Jan 2015 20:03:24 +0100
Message-ID: <20150121200324.Horde.ukdDqFj6DTInNSIVwG4VzA1@htjn.suhail.uberspace.de>
References: <f37def15eb82a2685c1041db1b37454e@d119.x-mailer.de>
 <54BF086E.5080906@ngtech.co.il>
 <20150121141907.Horde.Z6MfNa3HaQNYCcKYODI4iQ1@htjn.suhail.uberspace.de>
 <54BFB8A3.7090504@chello.at>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <54BFB8A3.7090504@chello.at>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="Yes"
Content-Transfer-Encoding: 7bit
To: Mart Frauenlob <mart.frauenlob@chello.at>
Cc: Eliezer Croitoru <eliezer@ngtech.co.il>, netfilter@vger.kernel.org

Zitat von Mart Frauenlob <mart.frauenlob@chello.at>:
> /lib/modules/$(uname -r)/kernel/net/netfilter/nf_conntrack_proto_gre.ko
> is available as specific helper.

GRE packets are still dropped, even after "modprobe nf_conntrack_proto_gre".
Isn't that how it's supposed to work, or am I still missing something?

root@laptop:/etc# iptables -S;lsmod|grep conntrack
-P INPUT DROP
-P FORWARD DROP
-P OUTPUT ACCEPT
-A INPUT -i lo -j ACCEPT
-A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
-A INPUT -p tcp -m tcp --dport 22 -j ACCEPT
nf_conntrack_proto_gre    12886  0
nf_conntrack_ipv4      18003  1
nf_defrag_ipv4         12443  1 nf_conntrack_ipv4
xt_conntrack           12601  1
nf_conntrack           57737  3  
nf_conntrack_proto_gre,xt_conntrack,nf_conntrack_ipv4
x_tables               18078  5  
ip_tables,xt_tcpudp,xt_conntrack,iptable_filter,iptable_mangle

Jan


