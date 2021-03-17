From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: How to troubleshoot (suspected) flowtable lockups/packet drops?
Date: Wed, 17 Mar 2021 21:42:20 +0100
Message-ID: <20210317204220.GA13211@salvia>
References: <CANf9dFO+CAuiugQjwKDZ+tOVYuB+HMKeJzDVqekY=vVFE-rxFw@mail.gmail.com>
 <20210316230521.GB981@salvia>
 <CANf9dFMxabVweO2ipnPL8Ncemc9wQaxeJQs0dazrgf=VeXVjbA@mail.gmail.com>
 <20210317103443.GA18462@salvia>
 <CANf9dFPDyAU-WKD5SSBv2M+PUoUmT5jQAjLcD1jcwEYzWKPqXQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CANf9dFPDyAU-WKD5SSBv2M+PUoUmT5jQAjLcD1jcwEYzWKPqXQ@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martin Gignac <martin.gignac@gmail.com>
Cc: netfilter@vger.kernel.org

On Wed, Mar 17, 2021 at 03:07:55PM -0400, Martin Gignac wrote:
> > Set on the counter flags at flowtable creation time, ie. flowtable 'f'
> > should not exist.
> 
> I tried creating a file like this:
> 
>     delete flowtable inet filter f
> 
>     table inet filter {
> 
>         flowtable f {
>             hook ingress priority filter - 1
>             devices = { tun0, bond0, dummy0, bond1.999, bond1,
> vrf-conntrackd, vrf-mgmt, enp66s0f1, enp66s0f0, enp5s0f1, enp5s0f0,
> eno4, eno3, eno2, eno1 }
>             counter
>         }
>     }
> 
> And then running nft -f <filename> on it, but I got these errors:
> 
>     <filename>:1:30-30: Error: Could not process rule: Device or resource busy
>     delete flowtable inet filter f
> 
> I assume this is because the flowtable is in use, so it can not be deleted.
> 
> Short of rebooting the Linux server (which I cannot do right now since
> I have many people relying on it), is there any kind of way for me to
> re-create the flowtable with the added 'counter' parameter without
> impacting traffic?

It should be possible to:

 delete rule inet filter y handle 3
 delete flowtable inet filter

but transaction code for the flowtable is buggy :-\

Two more fixes: It looks like EEXIST is also bogusly reported in case of
add-after-delete flowtable in the same batch.

https://patchwork.ozlabs.org/project/netfilter-devel/patch/20210317201957.13165-1-pablo@netfilter.org/
https://patchwork.ozlabs.org/project/netfilter-devel/patch/20210317201957.13165-2-pablo@netfilter.org/

I made a regression test for nft to make sure this works fine in the
future:

https://patchwork.ozlabs.org/project/netfilter-devel/patch/20210317203636.14869-1-pablo@netfilter.org/
