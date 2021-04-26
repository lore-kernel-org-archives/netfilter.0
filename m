From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Flowtable with ppp/bridge
Date: Mon, 26 Apr 2021 19:57:03 +0200
Message-ID: <20210426175703.GA3590@salvia>
References: <16CF72C8-335A-48D2-BA6F-FF632735DCFD@public-files.de>
 <20210426172924.GA3178@salvia>
 <8AA68E42-DE50-4591-BCF0-18A058FA93F8@public-files.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8AA68E42-DE50-4591-BCF0-18A058FA93F8@public-files.de>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frank Wunderlich <frank-w@public-files.de>
Cc: netfilter@vger.kernel.org

On Mon, Apr 26, 2021 at 07:51:11PM +0200, Frank Wunderlich wrote:
> Hi Pablo,
> 
> Is alex' guess right and i need to use physical interface instead of
> the virtual one?

Confusing, you reported an example that works:

http://forum.banana-pi.org/t/new-netfilter-flow-table-based-hnat/12049/30

That was in March 2021.

> In my case i have ppp connection over vlan on wan port.
> 
> ppp8 => wan.110 => wan
> 
> Lan side (bridge) may work,but for ppp it sounds wrong to me.

Just add the 'wan' device to the flowtable, as you did back in March.

