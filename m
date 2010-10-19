From: Maarten Vanraes <maarten@ba.be>
Subject: Re: xtables-addons ACCOUNT
Date: Tue, 19 Oct 2010 10:09:32 +0200
Message-ID: <201010191009.32841.maarten@ba.be>
References: <201010181712.03160.maarten@ba.be> <1287418703.13167.231.camel@laplaplian> <1287419553.13167.237.camel@laplaplian>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1287419553.13167.237.camel@laplaplian>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: Bob Miller <bob@computerisms.ca>

Op maandag 18 oktober 2010 18:32:33 schreef Bob Miller:
> >  loaded, I created the following rules for my
> > 
> > networks:
> > 
> > gatelian:/usr/lib# iptables-save | grep tname
> > -A POSTROUTING -j ACCOUNT --addr 0.0.0.0/0 --tname wan
> > -A POSTROUTING -j ACCOUNT --addr 192.168.25.0/24 --tname computerisms
> > -A POSTROUTING -j ACCOUNT --addr 192.168.24.0/24 --tname
> > computerisms-public
> 
> This is in the mangle table...

hmm.

i used iptables and iptables-dev from squeeze on a lenny; and libnfnetfilter 
from backports to get good versions as i looked at the distro compatibility 
chart. Then, i compiled xtables-addons from source with:

./configure --prefix=/usr --sbindir=/sbin --with-xtdirlib=/lib

this way the stuff is in the correct debian dir. The module loaded 
automatically and pretty ok.

i tried:
iptables -A INPUT -j ACCOUNT --addr 10.66.6.0/24 --tname storagenet
iptables -A FORWARD -j ACCOUNT --addr 194.0.234.0/24 --tname publicnet
iptables -A FORWARD -j ACCOUNT --addr 0.0.0.0/0 --tname self

and stuff. in any case, i can't do this now, because i always get the same 
error now. I think i'll need to reboot to get a fresh start.

this was all in the main table.

where exactly should i use the ACCOUNT module? does that matter?

the error message:


"iptables: Invalid argument. Run `dmesg' for more information."


in dmesg nothing is there.
error message when trying to use it now:


ACCOUNT: Table publicnet found, but IP/netmask mismatch. IP/netmask found: 
194.0.234.0/255.255.255.0
ACCOUNT: Table insert problem. Aborting


when trying to remove the rule with iptables:


ACCOUNT: Table publicnet not found for destroy


"iptaccount -a" does show the nets fine; but the -l publicnet always gives:


Showing table: publicnet
Run #0 - 0 items found
Finished.
