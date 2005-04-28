From: Dwayne Hottinger <dhottinger@harrisonburg.k12.va.us>
Subject: Re: How to stop the flood?
Date: Thu, 28 Apr 2005 18:04:52 -0400
Message-ID: <1114725892.f9cf2d7156ac0@webmail.harrisonburg.k12.va.us>
References: <20050428154656.AA0188EDCEB@smtp.sterenborg.info>
	<1114703659.6fb8089c0e877@webmail.harrisonburg.k12.va.us>
	<Pine.LNX.4.60.0504281745440.16510@darkstar.sysinfo.com>
	<42715C88.9070606@tarapine.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42715C88.9070606@tarapine.co.nz>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

If that was the case, you should be able to find the culprints via a sniffer.  I
would watch for large amounts of icmp traffic and trace it back to the user. 
Do you also supply DHCP and DNS to your subnets?  If so you can glean through
the logs of each and get a W/S to IP name.  Shouldnt take much of a sniff to
get the culprits.  Most of the time DOS attacks are done unknowlingly by users.
 Usually try to head that off by ensuring patches and virus software is up to
date.  Although that isnt always foolproof.  If windows machines exist (and we
all have to live with them) than these things will be issues.

ddh


Quoting wkc <wkc@tarapine.co.nz>:

> R. DuFresne wrote:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >
> >
> > defiantly, as others have hinted, not everything is a technical/firewall
> > issue.  Block the network access and let the user explain to their
> > manager why they are not able to complete their work.  If this is
> > consumer access, then you don't need their monies, send them on their
> > merry way of finding another ISP to abuse.
> >
> > Thanks,
> >
>
> Is there the possibility the users may not know they are causing a
> problem? Perhaps a virus or worm has arrived on their computer.
> You could try blocking access, see who complains and then have a chat to
> them.
> Just my 2 cents worth.
>
> --
> Keith Clethero
>
>
>
> System Administrator
> Taranaki Sawmills Ltd.
> Ph 06 7559000 x 816
>


--
Dwayne Hottinger
Network Administrator
Harrisonburg City Public Schools

