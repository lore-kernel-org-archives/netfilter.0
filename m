From: Maarten Vanraes <maarten@ba.be>
Subject: Re: xtables-addons ACCOUNT
Date: Tue, 19 Oct 2010 12:00:39 +0200
Message-ID: <201010191200.39920.maarten@ba.be>
References: <201010181712.03160.maarten@ba.be> <201010191009.32841.maarten@ba.be> <alpine.LNX.2.01.1010191136050.19178@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1010191136050.19178@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: Jan Engelhardt <jengelh@medozas.de>, Bob Miller <bob@computerisms.ca>

Op dinsdag 19 oktober 2010 11:38:30 schreef Jan Engelhardt:
> On Tuesday 2010-10-19 10:09, Maarten Vanraes wrote:
> >iptables -A INPUT -j ACCOUNT --addr 10.66.6.0/24 --tname storagenet
> >iptables -A FORWARD -j ACCOUNT --addr 194.0.234.0/24 --tname publicnet
> >iptables -A FORWARD -j ACCOUNT --addr 0.0.0.0/0 --tname self
> >
> >and stuff. in any case, i can't do this now, because i always get the same
> >error now. I think i'll need to reboot to get a fresh start.
> >
> >this was all in the main table.
> 
> What main table?

i mean in the iptables i did not pass a "-t" option to put it into nat or 
mangle table.


> >where exactly should i use the ACCOUNT module? does that matter?
> >
> >the error message:
> >
> >"iptables: Invalid argument. Run `dmesg' for more information."
> >
> >in dmesg nothing is there.
> >error message when trying to use it now:
> >
> >ACCOUNT: Table publicnet found, but IP/netmask mismatch. IP/netmask found:
> >194.0.234.0/255.255.255.0
> >ACCOUNT: Table insert problem. Aborting
> 
> Got a mix of old versions, or using non-Xt-a components, or
> non-little-endian machine?

the machine is x86_64, kernel is 2.6.26-2-amd64 (debian lenny)
 * iptables: 1.4.8 (from debian squeeze)
 * xtables-addons: 1.26 (built from source)

at this moment, there is no other iptables usage and is a default debian 
lenny.

is there anything else you wish to know?
