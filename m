From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: How to troubleshoot (suspected) flowtable lockups/packet drops?
Date: Wed, 17 Mar 2021 23:28:54 +0100
Message-ID: <20210317222854.GA24692@salvia>
References: <CANf9dFO+CAuiugQjwKDZ+tOVYuB+HMKeJzDVqekY=vVFE-rxFw@mail.gmail.com>
 <20210316230521.GB981@salvia>
 <CANf9dFMxabVweO2ipnPL8Ncemc9wQaxeJQs0dazrgf=VeXVjbA@mail.gmail.com>
 <20210317103443.GA18462@salvia>
 <CANf9dFPDyAU-WKD5SSBv2M+PUoUmT5jQAjLcD1jcwEYzWKPqXQ@mail.gmail.com>
 <20210317204220.GA13211@salvia>
 <CANf9dFOHgb+QNqVkWVsnP6ALSQxbPzyv8xA0LXyck39w3bUjwg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CANf9dFOHgb+QNqVkWVsnP6ALSQxbPzyv8xA0LXyck39w3bUjwg@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martin Gignac <martin.gignac@gmail.com>
Cc: netfilter@vger.kernel.org

On Wed, Mar 17, 2021 at 06:01:43PM -0400, Martin Gignac wrote:
> If I just run:
> 
>     nft list ruleset > rules.txt
> 
> add:
> 
>     flush ruleset
> 
> to the top of the file, add the:
> 
>     counter
> 
> statement to the flowtable section, and then:
> 
>     nft -f rules.txt
> 
> This should atomically add the "counter", but not impact traffic in
> any way, shape or form, correct?

It turns on packets and bytes counters:

# conntrack -L
tcp      6 src=10.141.10.2 dst=192.168.10.2 sport=57758 dport=5201 packets=1998758 bytes=87532896157 src=192.168.10.2 dst=192.168.10.1 sport=5201 dport=57758 packets=1966493 bytes=102257896 [OFFLOAD] mark=0 use=2

You also have to enable counters in conntrack:

echo 1 > /proc/sys/net/netfilter/nf_conntrack_acct 
