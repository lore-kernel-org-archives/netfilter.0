From: Thomas Preissler <tomjohn@gmx.de>
Subject: Re: How to make a computer invisible
Date: Tue, 2 Dec 2003 17:26:28 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031202162628.GW26447@zeus.tpfm.de>
References: <000501c3b88e$65e35550$6400a8c0@deamon> <20031202081427.58d57208.mgale@utilitran.com> <1070380086.2057.17.camel@grendel>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1070380086.2057.17.camel@grendel>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; x-action="pgp-signed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hello,

* Chris wrote on 12/02/03:

> On Tue, 2003-12-02 at 10:14, Michael Gale wrote:
> > Hello,
> > 
> > You can make a machine almost invisible with iptables.
> 
> <snip>
> 
> > So if I do a nmap for all TCP and UDP ports and watch the traffic through a TCP dump the only responses I see are ARP replies.
> 
> I guess this depends on what you mean by "invisible". When you ran your

I mean, that it looks like that the computer with the ip x is not
reachable as the same as it is, when you address an ip that
addresses no computer, i.e. is an unused ip.

I think RECJECTing with "Destination Host Unreachable" is ok and
produces nice results.

But I must have a look at the ARP requests, I think I must feed the
documentation from ebtables, it looks good ;-))

[...]

Background: I am just experimenting and this was an interesting
issue for me. I want to setup a whole net with UML boxes and hide
the physical computer... Just testing, just playing... nothing else.
Just testing about some very crazy networking issues ;-)))


Thx,
Tom
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQE/zL00LnRAQMIdq38RApZUAJ92WxUQNO2s4ee18iKbv3iM2lmi+gCgi7li
It1DRQKHq8RjJ3/fOufZE5U=
=8ZAg
-----END PGP SIGNATURE-----

