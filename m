From: Rasmus Reinholdt Nielsen <rasmus@narani.dk>
Subject: Re: msn voice chat
Date: Fri, 03 Jan 2003 10:51:26 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.1.0.14.2.20030103104824.023b4530@of23sm3.kadnet.dom>
References: <A4136342-1CF1-11D7-8A13-000393950CC2@karlsbakk.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0212311414001.22652-100000@dh094-148.csb.sun
 ysb.edu>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: "CUI, Guanglei" <cuigl@morita.chem.sunysb.edu>, Roy Sigurd Karlsbakk <roy@karlsbakk.net>
Cc: Glover George <dime@gulfsales.com>, cuigl@ilion.bio.sunysb.edu, netfilter@lists.netfilter.org

Hi

I have the linux-igd installed and it works very well, all my users can 
voice and video chat. The MSN Telephony is not Upnp capable so it doesn't 
work, anybody knows how to make this work (or what protokol it uses - 
RTP?), it works with my cisco router, but not with my linux/netfilter one.

Thanks

/Rasmus

At 14:15 31-12-2002 -0500, CUI, Guanglei wrote:
>Thanks for the response. I'm only a home user and don't care much about
>security. My network knowledge is rather limited too. So what's the
>different between SIP and UPnP? Which one should I use and where can I
>get SIP modules?
>
>cuigl
>
>On Tue, 31 Dec 2002, Roy Sigurd Karlsbakk wrote:
>
> > As far as I'm concerned, MSN telephony, and voice chat, uses SIP, not
> > h.323, and SIP also needs a helper module the same way as pptp, ftp,
> > irc etc
> >
> > roy
> >
> > On Tuesday, December 31, 2002, at 07:34 PM, Glover George wrote:
> >
> > > No you need this,
> > >
> > > http://linux-igd.sourceforge.net.  Be aware however that if you're
> > > intention is completely security, then you should be warned by the
> > > SECURITY documentation.
> > >
> > > -----Original Message-----
> > > From: netfilter-admin@lists.netfilter.org
> > > [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Guanglei Cui
> > > Sent: Thursday, December 26, 2002 11:48 AM
> > > To: netfilter@lists.netfilter.org
> > > Subject: msn voice chat
> > >
> > > Dear all,
> > >     I've set up IP NAT in my redhat 8.0 (kernel-2.4.18.19.8.0,
> > > iptables-1.2.6a-a). The following modules are loaded,
> > > ip_nat_irc
> > > ip_nat_ftp
> > > iptable_nat
> > > ip_conntrack_irc
> > > ip_conntrack_ftp
> > > ip_conntrack
> > > ip_tables
> > >
> > > It seems almost everything works just fine in my local network, except
> > > MSN
> > > voice chat (instant message works fine). Do I need other modules to
> > > make
> > > it
> > > work, something like ip_nat_h323? Thanks in advance.
> > >
> > > cuigl
> > >
> > >
> > >
> >
> >
>
>--
>Guanglei Cui
>Dept. of Chemistry
>SUNY at Stony Brook
>Stony Brook, NY 11790


