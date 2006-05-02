From: kelly@cliffhanger.com
Subject: Re: Is there a way....
Date: Tue, 2 May 2006 17:40:28 -0500
Message-ID: <20060502224028.GK23121@Knoppix>
References: <000601c66cd1$a5a31190$0101000a@sterenborg.info>
	<Pine.LNX.4.64.0605021659450.17603@darkstar.sysinfo.com>
	<Pine.LNX.4.58.0605022118380.5909@linux.dpsims.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.58.0605022118380.5909@linux.dpsims.com>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


It's similar in concept to having several
computers that need an IP address from a DHCP
server.

The DHCP server has a range of addresses it hands
out.  It assigns an IP address for each host that
asks for one, up until it doesn't have anymore
address available.  They are assinged to a MAC
addr for a period of time.  When the time has
expired, the address may be used by a different
machine.

So in this case, he wants to set up a NAT Pool (to
use a Cisco term), of say ... /24.  Then all
machines can randomly be assinged an address out
of that pool, for a period of time.  After the
time has expired (and the session has ended), the
address is available for the next host.  This goes
on until all the addresses in the pool have been
used up.  For the /24 pool we setup, a total of
256 hosts could be NAT'd on a 1-to-1 basis.  

i.e., 

 - 256 Network Address Translations may occur.

 - 256 hosts will have a uniq "outside" public 
   IP address.
 
1 (NAT) ip address is assigned to each host, 
or 1-to-1


-- 
kelly
http://home1.gte.net/res0psau/index.html#Hang-Gliding-Stuff

	   --    -- 
	     \  /
	      \/
	      /\
	     /  \
	   --    --



Quoting David Sims <dpsims@dpsims.com>:
        Hi,
        
          Multiple calls can be going on simultaneously and each call needs to
        appear to originate from a different IP address.... The IP addresses can
        be 'reused' but the packets need to be mapped into a given IP address for
        the duration of a 'call' (terminal session)....
        
          I have 2000 to 2500 devices on one side (the private address space) and
        only 250 availble sessions on the other side (the address space into which
        I want to NAT them)....
        
        Dave
        *************************************************************************
        On Tue, 2 May 2006, R. DuFresne wrote:
        
        > -----BEGIN PGP SIGNED MESSAGE-----
        > Hash: SHA1
        >
        > On Mon, 1 May 2006, Rob Sterenborg wrote:
        >
        > >> Hi,
        > >>
        > >>   I want to use Linux to do NAT between some 192.168.x.x addresses
        > >> in a routed network on one side and a single 10.0.0.x/24 on the other
        > >> side. I want to do one-to-one NAT but in a dynamic way... such that a
        > >> calling address is NATed into the next available 10.0.0.x/24.... in a
        > >> round robin sort of way... IS there a way to do this using NETFILTER??
        > >> If not NETFILTER, then how??
        > >>
        > >>   This sort of thing is common in many-to-one NAT (port-address
        > >> translation)... but I need each call to come from a separate NATed IP
        > >> address to support my application (TN3270 session)... It's OK to reuse
        > >> addresses after a call (session) is complete, but each session needs
        > >> to come from it's own fixed (for the duration of the session) IP
        > >> address....
        > >>
        > >>   The exact application that I am trying to support is connecting to
        > >> an IBM mainframe from random hosts in a routed network via an
        > >> Attachmate gateway where calling addresses are mapped into terminal
        > >> sessions on a 1:1 basis.... Port address translation won't work
        > >> because all calls appear to eminate from the single IP address.... I
        > >> need to do 1:1 NAT but only on a temporary basis where once a call is
        > >> complete the NAT address can be used by another caller...
        > >>
        > >>   Clues? Suggestions? Examples?
        > >
        > > Have you tried the NETMAP target ? Using NETMAP I don't see a reason to
        > > have to reuse IP addresses for NAT because you can NAT a complete subnet
        > > 1:1 with NETMAP.
        > > http://www.netfilter.org/projects/patch-o-matic/pom-base.html#pom-base-N
        > > ETMAP
        > >
        >
        >
        > Perhaps I'm reading this incorrectly, but, I get the impression this is
        > not a 1:1 NAT setup, but a reverse masq tye setup, comes from the original
        > posters statement:
        >
        > >> Port address translation won't work
        > >> because all calls appear to eminate from the single IP address.... I
        > >> need to do 1:1 NAT but only on a temporary basis where once a call is
        > >> complete the NAT address can be used by another caller...
        >
        >
        > As I read this it comes off not as 1:1 NAT but masq as mentioned.  What am
        > I reading incorrectly or interpretting wrong here?
        >
        > Thanks,
        >
        >
        > Ron DuFresne
        > - --
        > ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        >          admin & senior security consultant:  sysinfo.com
        >                          http://sysinfo.com
        > Key fingerprint = 9401 4B13 B918 164C 647A  E838 B2DF AFCC 94B0 6629
        >
        > ...We waste time looking for the perfect lover
        > instead of creating the perfect love.
        >
        >                  -Tom Robbins <Still Life With Woodpecker>
        > -----BEGIN PGP SIGNATURE-----
        > Version: GnuPG v1.4.2.2 (GNU/Linux)
        >
        > iD8DBQFEV8jcst+vzJSwZikRAiP3AKDSthAVcJvatOcX7TDBObDkfjyOkACfR6RM
        > PVd7CTyQVJyEeZUm1rvnB34=
        > =wRLT
        > -----END PGP SIGNATURE-----
        >
        

