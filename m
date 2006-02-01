From: kelly <kelly@cliffhanger.com>
Subject: Re: NAT with iptables / linux
Date: Wed, 01 Feb 2006 14:26:35 -0600
Message-ID: <36145.2349498451$1138828774@news.gmane.org>
References: <dac71d7b0601261219q39b58368w@mail.gmail.com>
	<002101c622c0$dc643de0$0101000a@sterenborg.info>
	<Pine.LNX.4.60.0602011532290.9776@darkstar.sysinfo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-reply-to: <Pine.LNX.4.60.0602011532290.9776@darkstar.sysinfo.com>
Content-disposition: inline
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

I'm not sure if I'm addressing your question or
not, but I'll take a stab at what I *_think_*
you're refering to.

The secondary IP address is a way of telling an
interface to accept (and send) packets on more
than one IP segment.  It's the iproute2 utilities
way of doing the same thing as the ifconfig option
with the colon (sub-interface).

	i.e. 
	eth0
	eth0:1

For instance, if you have a private IP segment
(RFC 1918) between the firewall and the border
router (the border router connects your network to
the Internet in this case) -- i.e., 10.x.x.x --.
This private segment cannot be advertised to the
Internet.

Therefore you can add a secondary IP address to
the firewall's ethernet interface.  The secondary
IP address is a public IP that *_CAN_* be
advertised to the Internet.  This same IP is the
IP you want to create a *_STATIC NAT_* to.  Be
aware this is not a *_PAT_* (Port Address
Translation).

The difference between a *_Static NAT_* and a
*_PAT'd NAT_* is important.  The Static NAT allows
hosts from the *_OUTSIDE_* (i.e., the Internet) to
establish a connection to the NAT'd host.  Where
as, with a *_PAT_*, the outsides hosts *_CANNOT_*
establish connections (to a PAT'd host).

So the Internet border router needs to advertise
the NAT IP (or the network containing the NAT IP)
to the internet. But it also has to have a route
that sends all traffic destined for that NAT IP
(or Network) to the firewall's interface.  This
can be a static route.

HTH,
kelly


-- 
kelly
http://home1.gte.net/res0psau/index.html#Hang-Gliding-Stuff

	   --    -- 
	     \  /
	      \/
	      /\
	     /  \
	   --    --



Quoting R. DuFresne <dufresne@sysinfo.com>:
        -----BEGIN PGP SIGNED MESSAGE-----
        Hash: SHA1
        
        On Tue, 31 Jan 2006, kelly wrote:
        
        >Maybe this will help.
        >
        >http://home1.gte.net/res0psau/security/nat-on-linux.html
        >
        >
        >
        
        
        This is an interesting paper, wish I'd have found it when putting up the 
        1:! NAT system I have in place.  Wondering though, can someone clarify for 
        me why the secondary param is listed in the paper with significance?  I 
        was never informed of and have not made use of the ip add addr <dev> 
        secondar....
        
        
        
        Thanks,
        
        
        Ron DuFresne
        - -- 
        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                admin & senior security consultant:  sysinfo.com
                                http://sysinfo.com
        Key fingerprint = 9401 4B13 B918 164C 647A  E838 B2DF AFCC 94B0 6629
        
        ...We waste time looking for the perfect lover
        instead of creating the perfect love.
        
                        -Tom Robbins <Still Life With Woodpecker>
        -----BEGIN PGP SIGNATURE-----
        Version: GnuPG v1.2.4 (GNU/Linux)
        
        iD8DBQFD4Rt6st+vzJSwZikRApG3AKCGu4oxqO9q5fOqQ0P9JZ7xmT9kWwCgvEKS
        R1Ja85KU4knftUm7Nc/+tpI=
        =8rsK
	-----END PGP SIGNATURE-----

