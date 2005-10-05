From: "Winanjaya - PBXSoftwares" <winanjaya@pbxsoftwares.com>
Subject: Re: IP and MAC Address check
Date: Wed, 5 Oct 2005 12:50:39 +0700
Message-ID: <00cb01c5c970$b6eb9620$580110ac@HO.lippogeneral.com>
References: <005d01c5c964$b7ccebe0$580110ac@HO.lippogeneral.com><20051005045822.GA5636@mobilion><006f01c5c96c$512f1c20$580110ac@HO.lippogeneral.com>
	<200510050029.36699.rob0@gmx.co.uk>
Reply-To: Winanjaya - PBXSoftwares <winanjaya@pbxsoftwares.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: /dev/rob0 <rob0@gmx.co.uk>, netfilter@lists.netfilter.org


----- Original Message -----
From: "/dev/rob0" <rob0@gmx.co.uk>
To: <netfilter@lists.netfilter.org>
Sent: Wednesday, October 05, 2005 12:29 PM
Subject: Re: IP and MAC Address check


> Please don't top-post. Thank you.
>
> On Wednesday 2005-October-05 00:19, Winanjaya - PBXSoftwares wrote:
> > Hi . . I already had the list of MAC Address .. and they stored in
> > the file named maclist (ie. /etc/sysconfig/maclist) ..
>
> Yes.
>
> > what I need is to configure iptables to read maclist file when there
>
> iptables cannot read from a file. Use a shell script to do that.
>
> > is incoming trafic from the IP address 172.16.2.241 to 172.16.2.250
> > ..if the MAC Address listed then the traffic will allowed otherwise
> > the traffic will be dropped or rejected..
> >
> > any idea ? .. please advise
>
> You were given good advice:
>
> > ----- Original Message -----
> > From: "Marcos S. Trazzini" <mstrazzini@gmail.com>
> > To: <netfilter@lists.netfilter.org>
> > Sent: Wednesday, October 05, 2005 11:58 AM
> > Subject: Re: IP and MAC Address check
> >
> snip
> > > ---CUT HERE---
> > > while read mac; do
> > >   iptables -A INPUT -m mac --mac-source $mac -m iprange \
> > >   --src-range 172.16.2.241-172.16.2.250 -j ACCEPT
> > > done < /path/to/maclist
> > > iptables -AINPUT -m iprange --src-range \
> > > 172.16.2.241-172.16.2.250 -j DROP
> > > ---CUT HERE---
>
> My only comment is that some older systems might not have -m iprange.
> But no worries, it's not far outside 2 CIDR ranges: 172.16.2.240/29 and
> 172.16.2.248/30.
>
> Ah, one other comment: this might be better structured using a
> user-defined chain.
>
> > > See also:
> > > # iptables -m mac --help
> > > # iptables -m iprange --help
>
> And of course "man iptables".
> --
>     mail to this address is discarded unless "/dev/rob0"
>     or "not-spam" is in Subject: header
>

so you meant I can use  below:

# Range 241 to 246
 -A RH-Lokkit-0-50-INPUT -m mac -s 172.16.2.240/29 ! --mac-source
00:12:95:6d:0a:3e -j DROP
-A RH-Lokkit-0-50-INPUT -m mac -s 172.16.2.240/29 ! --mac-source
00:12:95:15:61:14 -j DROP
-A RH-Lokkit-0-50-INPUT -m mac -s 172.16.2.240/29 ! --mac-source
00:12:95:15:62:29 -j DROP
-A RH-Lokkit-0-50-INPUT -m mac -s 172.16.2.240/29 ! --mac-source
00:12:95:15:63:ba -j DROP


please advise ..

Regards
Winanjaya


