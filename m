From: "Miguel Angel Amador L." <amador@puc.cl>
Subject: Re: PPP Routing
Date: Thu, 27 Feb 2003 01:50:04 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <009101c2de1b$bce34750$7fe753c8@as>
References: <3E5D008A.7070804@openadventures.org> <20030226225616.GA380@tekilla.homeip.net>
Reply-To: "Miguel Angel Amador L." <amador@puc.cl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

create the rules for each interface... and applied ppp+ for rules in all
ppp's interfaces,
the rules work when de interfaces are up , in the other case, the rules not
work if the interfaces not exist.

in other Words... Read the How To Filter Packet  (netfilter.samba.org)


Att.
  /=3D=3D=3D/  Miguel Angel Amador L.  /=3D=3D=3D=3D/
"la vida me sonrie, o se estara riendo de mi? "

-----BEGIN GEEK CODE BLOCK-----
Version: 3.12
GCM d- s:+ a- C++++ UL+++ P- L+++ E--- W+++ N++ o K- w++
O- M- V- PS+ PE++ Y PGP- t 5 X+++ R !tv b+ DI- D
G++ e- h* r- y*
------END GEEK CODE BLOCK------

----- Original Message -----
From: "Willi Dyck" <wdyck@gmx.net>
To: <netfilter@lists.netfilter.org>
Sent: Wednesday, February 26, 2003 7:56 PM
Subject: Re: PPP Routing


> On Wed, Feb 26, 2003 at 10:59:38AM -0700, Tom Smith wrote:
> > RedHat 7.3 Kernel 2.4.9-31
> > iptables 1.2.5
> >
> > I have a working Firewall/VPN. Problem is that I need to create a
> > seperate set of rules for each ppp# connection. For example, ppp0's
> > ruleset would be:
> >
> > $IPTABLES -A INPUT -i ppp0 -s $INTNET -d $INTNET -j ACCEPT
> > $IPTABLES -A OUTPUT -o ppp0 -s $INTNET -d $INTNET -j ACCEPT
> > $IPTABLES -A FORWARD -i ppp0 -d $INTNET -j ACCEPT
> > $IPTABLES -A FORWARD -o ppp0 -d $INTNET -j ACCEPT
> >
> > Is there a way to dynamically create the ppp# as new connections come
> > and go?
>
> You might try 'ppp+' instead of 'ppp0'. Although it might not be what
> you want, since it will not be loaded dynamically, but it will match
> dynamically for all ppp# interfaces. See the netfilter docs for further
> info. Hope that helps.
>
> Gru=DF/Regards -- Willi
>
> --
> A Microsoft Certified System Engineer is to information technology as a
> McDonalds Certified Food Specialist is to the culinary arts.
>         Michael Bacarella commenting on the limited value of
certification.
>
>


