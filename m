From: Eric Leblond <eric@regit.org>
Subject: Re: PCI Compliance, gee fun.
Date: Tue, 13 Nov 2012 17:54:01 +0100
Message-ID: <1352825641.4597.6.camel@tiger2>
References: <1352823535.12211.20.camel@maxime.gregfolkert.net>
	 <20121113163232.GL3672@harrier.slackbuilds.org>
	 <CADGd2DpATp8nxpZyC_CU60xx42f1xJfcBGUFs6duB5zEP-U-bw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CADGd2DpATp8nxpZyC_CU60xx42f1xJfcBGUFs6duB5zEP-U-bw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: John Lauro <johnalauro@gmail.com>
Cc: netfilter@vger.kernel.org

Hi,

On Tue, 2012-11-13 at 11:45 -0500, John Lauro wrote:
> You could do some sort of template to generate iptables-restore format
> and refresh it every so often (once an hour, or day).

It should be possible to use the --comment option and to store inside
this the used DNS name. This will allow to store the information in the
iptables-save format. This will not fix the restoration but it could be
a good base for a conversion script.

BR,

> Yes, dyamic DNS is fairly common on application layer firewalls.  That
> said, they don't run in the kernel and their resolvers are fairly good
> at caching that info...  Running things through proxy servers or other
> things can allow you to make your rules use dns names there.
> 
> PS: I would assume that the "DNS" requirement is only for external
> services that publish by DNS name only and not for internal services
> or gateway services that publish the IP to use outside of DNS.
> 
> 
> On Tue, Nov 13, 2012 at 11:32 AM, /dev/rob0 <rob0@gmx.co.uk> wrote:
> > On Tue, Nov 13, 2012 at 11:18:55AM -0500, Greg Folkert wrote:
> >> I'm being told by my PCI QSA that IPTables supports DNS Names in kernel.
> >
> > You obviously know this is wrong.
> >
> >> He is forcing me to use "DNS Names" in my "iptables-restore" formatted
> >> save file. I am using a Fedora (FC2) based Firewall (with some updated
> >> packages to fix things)... its quite Old... (which they also don't like)
> >> using IPTables v1.2.9.
> >>
> >> The problem is, IPTables only deals with "IP Addresses" in its structure
> >> and doesn't have "dynamic" IP resolution and only resolves on
> >> "runtime/load". Now if I use "iptables-save" the file format does NOT in
> >> fact use DNS and only dumps the IP Address.
> >>
> >> What I need is the actual documentation that seems TERRIBLY hard to find
> >> on this very subject...
> >
> > The iptables(8) manual:
> > "
> > [!] -s, --source address[/mask][,...]
> >     Source specification. Address can be either a network name, a
> >     hostname, a network IP address (with /mask), or a plain IP
> >     address. Hostnames will be resolved once only, before the rule
> >     is submitted to the kernel. Please note that specifying any name
> >     to be resolved with a remote query such as DNS is a really bad
> >     idea. ...
> > "
> >
> > The iptables-restore(8) manual is very short and does not cover these
> > specifics, but it does refer to iptables in "SEE ALSO". And perhaps a
> > patch would be accepted. :)
> >
> >> He is also claiming that other firewalls solutions (aka Proprietary, aka
> >> Cisco) "dynamically" resolve rules... which I believe is incorrect, as
> >> well.
> >
> > I don't know Cisco et al, but I don't see how this would be practical
> > without some kind of backend to monitor DNS for changes and update a
> > list of IP addresses.
> >
> > (You could do the same thing with iptables and ipset(8), FWIW, albeit
> > not so easily on your Fedorasaurus, of course.)
> >
> >> Please point me at some place I can find "authoritative" documentation
> >> for this situation for me to either "suck it up" or to give him direct
> >> docs for him to include in our Audit.
> >>
> >> Thanks. Hopefully I have stated the issue well enough.
> >
> > Good luck.
> > --
> >   http://rob0.nodns4.us/ -- system administration and consulting
> >   Offlist GMX mail is seen only if "/dev/rob0" is in the Subject:
> > --
> > To unsubscribe from this list: send the line "unsubscribe netfilter" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


