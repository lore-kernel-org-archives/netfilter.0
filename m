From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrack-tools rpc helper
Date: Wed, 26 Dec 2012 23:43:01 +0100
Message-ID: <20121226224301.GA32453@1984>
References: <50D90E08.40100@cavein.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <50D90E08.40100@cavein.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard A Nelson <cowboy@cavein.org>
Cc: netfilter@vger.kernel.org

Hi Richard,

On Mon, Dec 24, 2012 at 09:23:04PM -0500, Richard A Nelson wrote:
> I'm having a heck of a time getting this all going ;)
> 
> Debian Sid/Experimental
> Linux 3.7.1
> conntrack toolchain downloded yesterday (stable, not git)
> 
> I'm following the doc on conntrack-tools to enable RPC tracking (for
> NFS support), and wind up with this state:
> # nfct helper list
> {
>     .name = rpc,
>     .queuenum = 0,
>     .l3protonum = 2,
>     .l4protonum = 6,
>     .priv_data_len = 16,
>     .status = disabled,
> };
> {
>     .name = rpc,
>     .queuenum = 0,
>     .l3protonum = 2,
>     .l4protonum = 17,
>     .priv_data_len = 16,
>     .status = disabled,
> };
> 
> Why disabled?  conntrackd startup went fine, the nfct helper add
> went fine, what am I missing ?

That means conntrackd did not configured the helper so far, so it
remains dormant in the kernel.

Did you add the corresponding Helper clause to conntrackd.conf?

It should be something similar to what you can find under
conntrack-tools/doc/helper/conntrackd.conf.

Please, check /var/log/conntrackd.log (or custom path in case you set
it). It should report some information regarding the helper
configuration.

> And, of course, it doesn't work ;)
> 
> I may be royally screwed anyway - due to the bizarre situation I'm
> trying to support...
> LAN:  192.168/16 - mix of Linux, Windows, and AIX clients
> Gateway: 192.168.1.205 (Linux Gateway/Firewall)
> OpenConnect VPN to work (CISCO ASA client) - IBM
> IBM network - GSA NFS Servers
> 
> The sticky point for a statefull firewall seems to be twofold:
> 1) AIX (at least 5.3) still does RPC mount lookups - even if NFSV4
> and port=2049 are specified
>     Which, it seems, is totally needless
> 
> 2) The GSA infrastructure is layered, and littered with High
> Availability & load balancing - but seems to break
>     extant rules...
> - My LAN client does a RPC GETPORT (MOUNT -V3) to snjgsa.sanjose.ibm.com
> - My firewall NATs the request
> - The GSA mainline server delegates (forwards, whatever) to a disk sever
> - The disk server (snjxgsasd2.sanjose.ibm.com) replies the RCP GETPORT request
> 
> At this point, we have two streams, with matching ports, but
> differing IP sets, both in UNREPLIED status.
> 
> I am not at all sure, that even were I to get the RPC helper going,
> and it issues and EXPECT, that things will work, but am willing to
> hack to make it so :)

This was tested with NFSv3 running both Linux in the client and the
server sides.

I'd suggest to start by getting that "disabled" issue resolved first,
then, move on to see what other problem you find.
