From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Flowtable with ppp/bridge
Date: Wed, 28 Apr 2021 01:49:29 +0200
Message-ID: <20210427234929.GA19570@salvia>
References: <16CF72C8-335A-48D2-BA6F-FF632735DCFD@public-files.de>
 <20210426172924.GA3178@salvia>
 <8AA68E42-DE50-4591-BCF0-18A058FA93F8@public-files.de>
 <20210426175703.GA3590@salvia>
 <B1C290C8-8CF7-435B-88B0-29A09E4B0CA6@public-files.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <B1C290C8-8CF7-435B-88B0-29A09E4B0CA6@public-files.de>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frank Wunderlich <frank-w@public-files.de>
Cc: netfilter@vger.kernel.org

On Mon, Apr 26, 2021 at 08:08:05PM +0200, Frank Wunderlich wrote:
> Am 26. April 2021 19:57:03 MESZ schrieb Pablo Neira Ayuso <pablo@netfilter.org>:
> >On Mon, Apr 26, 2021 at 07:51:11PM +0200, Frank Wunderlich wrote:
> >> Hi Pablo,
> >> 
> >> Is alex' guess right and i need to use physical interface instead of
> >> the virtual one?
> >
> >Confusing, you reported an example that works:
> >
> >http://forum.banana-pi.org/t/new-netfilter-flow-table-based-hnat/12049/30
> >
> >That was in March 2021.
> 
> That was a test without ppp/vlan/bridge on my test device (to make
> performance test and looking for bindings on simple setup). Now i'm
> working on my main router where i use pppoe to my isp which needs to
> be encapsulated into a vlan (to separate from voip).
> 
> >> In my case i have ppp connection over vlan on wan port.
> >> 
> >> ppp8 => wan.110 => wan
> >> 
> >> Lan side (bridge) may work,but for ppp it sounds wrong to me.
> >
> >Just add the 'wan' device to the flowtable, as you did back in March.
> 
> Ok, i try it...If this works also for traffic routed to the ppp
> interface then it is ok. Forwarding is done from lanbr0 to ppp8
> virtual interfaces not to physical interfaces directly like i've
> done on test in March

Since Linux kernel 3.13-rc, the flowtable is capable of autodetecting
your existing network device configurations. Therefore, you only have
to add the physical devices in the flowtable definition.

The flowtable offload supports for:

- VLAN device.
- Bridge VLAN filtering.
- PPPoE device.
- Bridge device.

and combinations of these devices.

PPPoE over VLAN is also supported, I tested this specifically before
submission upstream.
