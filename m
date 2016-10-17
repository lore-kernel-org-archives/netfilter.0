From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: IPSec, masquerade and dnat with nftables
Date: Mon, 17 Oct 2016 21:44:05 +0200
Message-ID: <20161017194405.GH24375@salvia>
References: <8737l9mu0c.fsf@ilexius.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8737l9mu0c.fsf@ilexius.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Bach <t.bach@ilexius.de>
Cc: netfilter@vger.kernel.org

On Fri, Sep 09, 2016 at 09:06:59AM +0200, Thomas Bach wrote:
> Hi,
> 
> I have two hosts with public ip addresses running Ubuntu 16.04 with
> Kernel version 4.4.0.
> 
> I want to interconnect two containers (systemd-nspawn) with veth
> interfaces running on these hosts in a server client setup.
> 
> So on the first host, where the server in the container runs I have
> the following rules:
> # nft list ruleset
> table ip nat {
>   chain prerouting {
>     type nat hook prerouting priority 0; policy accept;
>     tcp dport { 4506, 4505} dnat 10.0.0.2 
>   }
> 
>   chain output {
>     type nat hook output priority 0; policy accept;
>     tcp dport { 4505, 4506} dnat 10.0.0.2
>   }
> 
>   chain input {
>     type nat hook input priority 0; policy accept;
>   }
> 
>   chain postrouting {
>     type nat hook postrouting priority 0; policy accept;
>     ip saddr 10.0.0.0/8 oif enp4s0 masquerade 
>   }
> }
> 
> On the second host, where the client runs i have the following:
> # nft list ruleset
> table ip nat {
>   chain prerouting {
>     type nat hook prerouting priority 0; policy accept;
>   }
> 
>   chain output {
>     type nat hook output priority 0; policy accept;
>   }
> 
>   chain input {
>     type nat hook input priority 0; policy accept;
>   }
> 
>   chain postrouting {
>     type nat hook postrouting priority 0; policy accept;
>     ip saddr 10.0.0.0/8 oif enp0s31f6 masquerade 
>   }
> }
> 
> This works as expected and without any problems at all. Now IPSec
> enters the picture. As soon as I setup a policy to encrypt everyting
> between the two hosts the following happens:
> + I can still connect from the second host to the server in the
>   container without problems,
> + I can still /connect/ (i.e. establish a connection) from the
>   container on the second host to the server on the first host, but
> + in tcpdump listening on the interface of the container (on the
>   second host) I see lots of TCP Retransmissions and the TCP connection
>   is effectively broken.
> 
> Can someone give me a hint what is going on here?

Did you find the root cause for this problem?
