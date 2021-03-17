From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: How to troubleshoot (suspected) flowtable lockups/packet drops?
Date: Wed, 17 Mar 2021 11:34:43 +0100
Message-ID: <20210317103443.GA18462@salvia>
References: <CANf9dFO+CAuiugQjwKDZ+tOVYuB+HMKeJzDVqekY=vVFE-rxFw@mail.gmail.com>
 <20210316230521.GB981@salvia>
 <CANf9dFMxabVweO2ipnPL8Ncemc9wQaxeJQs0dazrgf=VeXVjbA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CANf9dFMxabVweO2ipnPL8Ncemc9wQaxeJQs0dazrgf=VeXVjbA@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martin Gignac <martin.gignac@gmail.com>
Cc: netfilter@vger.kernel.org

On Tue, Mar 16, 2021 at 09:37:44PM -0400, Martin Gignac wrote:
> Hi Pablo,
> 
> How can I add the 'counter' option to the existing flowtable? Is this
> possible? I tried the following:
> 
>     [magi@s116r2l1fw01a ~]$ sudo nft add flowtable inet filter f {
> hook ingress priority filter \; counter \;}

Sorry, support for updating flowtable properties is missing:

https://patchwork.ozlabs.org/project/netfilter-devel/patch/20210317103156.23859-1-pablo@netfilter.org/
https://patchwork.ozlabs.org/project/netfilter-devel/patch/20210317103156.23859-2-pablo@netfilter.org/

> It didn't complain, but I couldn't see the 'counter' option when I
> listed the flowtable:
> 
>     [magi@s116r2l1fw01a ~]$ sudo nft list flowtables
>     Did not kill
>     table inet filter {
>             flowtable f {
>                     hook ingress priority filter
>                     devices = { tun0, bond0, dummy0, bond1.999, bond1,
> vrf-conntrackd, vrf-mgmt, enp66s0f1, enp66s0f0, enp5s0f1, enp5s0f0,
> eno4, eno3, eno2, eno1 }
>             }
>     }
>     table ip nat {
>     }
> 
> And looking at the output of conntrack -L, the counters didn't
> increase past the initial flow creation packet:
> 
>     tcp      6 src=192.168.125.3 dst=192.168.40.254 sport=53420
> dport=22 packets=1 bytes=60 src=192.168.40.254 dst=192.168.125.3
> sport=22 dport=53420 packets=1 bytes=60 [OFFLOAD] mark=0 use=2
> 
> How do I enable the 'counter' option exactly (since I'm clearly doing
> something wrong)?

Set on the counter flags at flowtable creation time, ie. flowtable 'f'
should not exist.

# cat flowtable.nft
table inet filter {
        flowtable f {
                hook ingress priority filter
                devices = { tun0, bond0, dummy0, bond1.999, bond1, vrf-conntrackd, vrf-mgmt, enp66s0f1, enp66s0f0, enp5s0f1, enp5s0f0, eno4, eno3, eno2, eno1 }
                counter
        }
}
# nft -f flowtable.nft
