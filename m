From: Michal Kubecek <mkubecek@suse.cz>
Subject: Re: Selective proxy ARP
Date: Wed, 13 Jul 2016 07:26:14 +0200
Message-ID: <20160713052614.GB27436@unicorn.suse.cz>
References: <515FCDC1-BB06-4AD4-BFE6-383AA8561395@alex.org.uk>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <515FCDC1-BB06-4AD4-BFE6-383AA8561395@alex.org.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org
Cc: Alex Bligh <alex@alex.org.uk>

On Tue, Jul 12, 2016 at 05:50:41PM +0100, Alex Bligh wrote:
> I am trying to set up what is often called a pseudo-bridge
> on a machine in a data centre. The config looks like this:
> 
> DC LAN
> |
> |
> |           bond0          br0     veth0
> +----------------[ Linux ] ------+-------[ VM 192.0.200.101/24 ]
> | 192.0.200.23/24                |
> |                                | veth1  
> |                                \-------[ VM 192.0.200.101/24 ]
> 
> 
> The data centre do not want me to simply make bond0 a member
> of the br0 bridge, because they only want to see a single MAC
> and are worried about forwarding loops. Fair or not, let's
> assume that's a fixed point.
> 
> I could get this to work (I think) simply be putting the
> appropriate /32 routes in the kernel, and then enabling
> proxy_arp on bond0 and br0.
> 
> However, I want to be very cautious about what my machine arps
> for on bond0. Specifically, I want to ensure it does not arp
> for anything except its own address and the other 2 IP addresses
> listed.

How about doing it the old manual way?

  ip neigh add proxy 192.0.200.101 dev bond0
  ip neigh add proxy 192.0.200.??? dev bond0

(in your schema above, both VMs have the same address which is probably
only a copy&paste mistake).

Michal Kubecek
