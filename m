From: Stephen Hemminger <shemminger@vyatta.com>
Subject: Re: NCD, a light scripting language for network configs and much
 more
Date: Fri, 17 Aug 2012 12:07:02 -0700
Message-ID: <20120817120702.62103ae4@nehalam.linuxnetplumber.net>
References: <CAOA3yKKmuAi=CPE=4-hyoGJJ7D7Oa_Bug5G=1Z3xif-5iFGeOw@mail.gmail.com>
	<20120817092253.41ade51b@nehalam.linuxnetplumber.net>
	<CAOA3yKLQNQ-t4VGENKTH683eLXA3A8GwPJ1w7zwT=AUus_CkFw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAOA3yKLQNQ-t4VGENKTH683eLXA3A8GwPJ1w7zwT=AUus_CkFw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ambroz Bizjak <ambrop7@gmail.com>
Cc: netfilter@vger.kernel.org

On Fri, 17 Aug 2012 21:04:04 +0200
Ambroz Bizjak <ambrop7@gmail.com> wrote:

> Huh, really? I can't seem to find those commands. I only see a
> "bridge" program added to iproute2 which does "forwarding database
> management", and doesn't seem to have the usual addbr/addif commands.
> Anyway, if brctl did suddenly disappear, imagine how easier it would
> be to fix that script I showed you compared to fixing something
> hardcoded like NetworkManager :)
> 
> On Fri, Aug 17, 2012 at 6:22 PM, Stephen Hemminger
> <shemminger@vyatta.com> wrote:
> >
> > FYI - you can use ip commands now to control bridge.
> > For all the new features planned, they won't be controllable via brctl.

You can make a bridge with:
 # ip link add br3 type bridge

and delete with
 # ip link del br3

To add device to bridge
 # ip li set dev eth2 master br3

To take out of bridge
 # ip li set dev eth2 nomaster

The point is that bridge isn't special.
