From: "Glover George" <dime@gulfsales.com>
Subject: RE: msn voice chat
Date: Tue, 31 Dec 2002 14:12:16 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000201c2b108$ed242960$6c00a8c0@blue>
References: <Pine.LNX.4.44.0212311414001.22652-100000@dh094-148.csb.sunysb.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0212311414001.22652-100000@dh094-148.csb.sunysb.edu>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I'm not aware that there actually are any SIP helper modules. Universal
Plug N Play (UPnP) is not actually used for the transmission, it has
nothing to do with the actual communication.  What it does, using an
IGD, is allows MSN messenger to ask the firewall what it's external ip
address is, and encapsulate that ip into the SIP packets.  As the SIP is
too unpredictable really to translate it, not to mention that it's high
text processing overhead for iptables to do this for EVERY SINGLE packet
on a video or voice transmission, this solves the problem.

I described this a while back, and there's more information on
Micro$ofts site and www.upnp.org, but here we go.  When MSN gets this ip
address from the UPnP IGD, whenever it asks the receiver for a
connection, it puts this packet in the payload, and asks the firewall to
open up some PortMappings to itself for the receiver to get back into
the local user.  In this way the packets are never modified by the
firewall.  

Herein lies the security problem, UPnP in it's current spec (soon to be
surpassed by version 2.0), doesn't specify authentication, so any
program can ask the firewall for any port to be portmapped to any
internal client.  No one can talk to the IGD from the outside, so if you
can trust every machine and every user inside (usually the case at home)
you can be relatively ok.  But just know this about using it in small
business, or large ones.  IT's NOT secure from the inside.  From the
outside, you simply block port 1900 and the port the igd runs on and
you'll be ok. Since all the daemon does is talk UpnP with the clients
inside, and places DNAT rules in the iptables, all you need is to worry
about the FORWARD chain being open for those ports.

Any rate, that was a really quick and dirty way of explaining it.  But
to make this all work on a linux firewall, you need a UPnP Compliant IGD
on the linux machine.  This is the only one.  And I'm currently one of
the more active projects on sourceforge, so you can expect lots of
little things to be tweaked.

MSN is also not the only thing that uses it.  Any DirectPlay games that
you use in windows will also work from behind a linux firewall using
this, without a need for a specific helper module (they must be
directplay games however). 

Supposedly XP will even set up the internet connection automatically
using this, but I have yet to verify that.  Take a look if anyone's
interested.  Just be aware I ONLY advise this in a trusted network.

Cheers. 

Glover George


-----Original Message-----
From: CUI, Guanglei [mailto:cuigl@morita.chem.sunysb.edu] 
Sent: Tuesday, December 31, 2002 1:16 PM
To: Roy Sigurd Karlsbakk
Cc: Glover George; cuigl@ilion.bio.sunysb.edu;
netfilter@lists.netfilter.org
Subject: Re: msn voice chat

Thanks for the response. I'm only a home user and don't care much about
security. My network knowledge is rather limited too. So what's the
different between SIP and UPnP? Which one should I use and where can I
get SIP modules? 

cuigl

On Tue, 31 Dec 2002, Roy Sigurd Karlsbakk wrote:

> As far as I'm concerned, MSN telephony, and voice chat, uses SIP, not 
> h.323, and SIP also needs a helper module the same way as pptp, ftp, 
> irc etc
> 
> roy
> 
> On Tuesday, December 31, 2002, at 07:34 PM, Glover George wrote:
> 
> > No you need this,
> >
> > http://linux-igd.sourceforge.net.  Be aware however that if you're
> > intention is completely security, then you should be warned by the
> > SECURITY documentation.
> >
> > -----Original Message-----
> > From: netfilter-admin@lists.netfilter.org
> > [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Guanglei
Cui
> > Sent: Thursday, December 26, 2002 11:48 AM
> > To: netfilter@lists.netfilter.org
> > Subject: msn voice chat
> >
> > Dear all,
> >     I've set up IP NAT in my redhat 8.0 (kernel-2.4.18.19.8.0,
> > iptables-1.2.6a-a). The following modules are loaded,
> > ip_nat_irc
> > ip_nat_ftp
> > iptable_nat
> > ip_conntrack_irc
> > ip_conntrack_ftp
> > ip_conntrack
> > ip_tables
> >
> > It seems almost everything works just fine in my local network,
except
> > MSN
> > voice chat (instant message works fine). Do I need other modules to 
> > make
> > it
> > work, something like ip_nat_h323? Thanks in advance.
> >
> > cuigl
> >
> >
> >
> 
> 

-- 
Guanglei Cui
Dept. of Chemistry
SUNY at Stony Brook
Stony Brook, NY 11790




