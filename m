From: "bino_oetomo" <bino@indoakses-online.com>
Subject: Re: CISCO VPN clients behind firewall
Date: Wed, 5 May 2004 18:44:10 +0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003401c43296$48b52210$0300a8c0@indoakses2>
References: <00f101c43236$e54f0380$0300a8c0@indoakses2> <4098774D.6070604@isoar.ca> <008201c43270$a53b0110$0223a8c0@soren>
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

Dear All
thx for all answer to my question.
I'll look deeper to my box

sincerely
-bino-
----- Original Message -----
From: "S=F8ren Kent Jensen" <soren@familie-jensen.dk>
To: <netfilter@lists.netfilter.org>
Sent: Wednesday, May 05, 2004 2:14 PM
Subject: Re: CISCO VPN clients behind firewall


Use IPSec UDP incapsulation on any port you like or  NAT-T
It has been developed for exactly that reason.

Regards

S=F8ren Kent Jensen


----- Original Message -----
From: "Andrew E. Mileski" <andrewm@isoar.ca>
To: <netfilter@lists.netfilter.org>
Sent: Wednesday, May 05, 2004 7:10 AM
Subject: Re: CISCO VPN clients behind firewall


> bino_oetomo wrote:
> > Hi All
> >
> > Is there any clue/docs on hoe to let multiple clients behind firewall =
=3D
> > connecting to CISCO vpn concentrator ?
> >
> > Sincerely
> > -bino-
>
> [This might be a dupe, as my addressbook had the wrong address]
>
> I just finished Intel Centrino Certification testing on the
> PPTP patch (2004-04-16 cvs snapshot) and Fedora's 2.4.22-1.nptl
> last week.  Passed with XP/2000 using Intel, Microsoft, Cisco,
> and Checkpoint VPN clients.
>
> You can browse the PPTP patch in CVS:
>
http://cvs.netfilter.org/cgi-bin/viewcvs.cgi/netfilter/patch-o-matic/extra/
> and check it out from a similar path.
>
> --
> Andrew E. Mileski
>
>
>








