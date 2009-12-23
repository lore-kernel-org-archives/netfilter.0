From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: Mapping external to internal IP addresses
Date: Wed, 23 Dec 2009 16:52:22 +0100
Message-ID: <4B323CB6.6090300@chello.at>
References: <C757E4D1.D29%npeirson@depoelconsulting.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <C757E4D1.D29%npeirson@depoelconsulting.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On 23.12.2009 16:22, netfilter-owner@vger.kernel.org wrote:
> We've got a couple of servers with external IP addresses NAT'd to internal
> IP addresses. Unfortunately the firewall that's performing the NAT isn't
> under our control and we have a problem where the servers can't access each
> other via their external IPs. This causes a problem when we use domain names
> on the servers, as the DNS lookup returns the external IP address. Ideally
> I'd like to avoid maintaing hosts files or an internal DNS server.
> 
> I looked to solve this with a iptables rule on each of the servers as
> follows:
> iptables -t mangle -A PREROUTING -d 1.1.1.32/29 -j NETMAP --to 2.2.2.32/29
> 
> where 1.1.1.32/29 is the range of external IPs and 2.2.2.32/29 is the range
> of internal IPs. I was expecting this to map the IP address from the
> external to the internal IP.
> 
> Firstly, I'm not sure if this would work at all, and if I'm heading in
> completely the wrong direction and someone has a better solution, I'd be
> happy to hear it.
> 
> Secondly, if I've got the right idea my implementation is a little wrong.
> When I run the command, I get "iptables: Invalid argument", which doesn't
> provide much info, and I'm not sure how to go about debugging.

wrong table, should be the nat table.

> 
> A little system info:
> nick@blade6-dev1:~$ uname -a
> Linux blade6-dev1 2.6.26-2-amd64 #1 SMP Thu Nov 5 02:23:12 UTC 2009 x86_64
> GNU/Linux
> nick@blade6-dev1:~$ sudo iptables -V
> iptables v1.4.2
> 
> Any thoughts greatly appreciated.

I'd try the following:

INT_NET=
EXT_NET=
SERVER_EXT_IP=
SERVER_INT_IP=

# select only packets with source = external server ip and destination =
external net
iptables -t nat -A PREROUTING -s $SERVER_EXT_IP -d $EXT_NET -j NETMAP
--to $INT_NET

# maybe needed that packets find the way back (over the same interface)
iptables -t nat -A POSTROUTING -s $SERVER_EXT_IP -d $INT_NET -j SNAT
--to-source $SERVER_INT_IP

Don't forget to allow the traffic in the filter table FORWARD chain.

regards

Mart
> 
> Thanks
> Nick
> 
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

