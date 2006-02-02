From: kelly <kelly@cliffhanger.com>
Subject: Re: NAT with iptables / linux
Date: Thu, 02 Feb 2006 16:24:08 -0600
Message-ID: <45261.3660054796$1138922193@news.gmane.org>
References: <dac71d7b0601261219q39b58368w@mail.gmail.com>
	<002101c622c0$dc643de0$0101000a@sterenborg.info>
	<Pine.LNX.4.60.0602011532290.9776@darkstar.sysinfo.com>
	<Pine.LNX.4.60.0602011716120.9996@darkstar.sysinfo.com>
	<Pine.LNX.4.60.0602021550250.13575@darkstar.sysinfo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-reply-to: <Pine.LNX.4.60.0602021550250.13575@darkstar.sysinfo.com>
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
To: "R. DuFresne" <dufresne@sysinfo.com>
Cc: netfilter@lists.netfilter.org

The syntax I used while testing doesn't seem to
work on my new box.  Maybe the 'global' entries
will act the same way?  Lab it up and let me know.

Maybe this verion of IPROUTE2 is different from
what I used when I wrote that page.


	#/sbin/ip addr add 12.12.12.12/24 dev eth0 secondary
        Error: either "local" is duplicate, or "secondary" is a garbage.

	#ip addr add help
	Usage: ip addr {add|del} IFADDR dev STRING
	       ip addr {show|flush} [ dev STRING ] [ scope SCOPE-ID ]
				    [ to PREFIX ] [ FLAG-LIST ] [ label PATTERN ]
	IFADDR := PREFIX | ADDR peer PREFIX
		  [ broadcast ADDR ] [ anycast ADDR ]
		  [ label STRING ] [ scope SCOPE-ID ]
	SCOPE-ID := [ host | link | global | NUMBER ]
	FLAG-LIST := [ FLAG-LIST ] FLAG
	FLAG  := [ permanent | dynamic | secondary | primary |
		   tentative | deprecated ]


Check out this doc.  Look at section 5.2 on page
6.  It talks about the 'secondary' addresses.

http://www.deepspace6.net/docs/iproute2tunnel-en.pdf


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
        
        On Wed, 1 Feb 2006, kelly wrote:
        
        >Ah I see.  The 'ip address' command has a few
        >params.  The 'ip addr' command will just apply the
        >first or only ip address.  'ip addr add' adds
        >another address.  The secondary address.
        >
        
        
        no it does not unless one spcifically applies the secondary param to the 
        command, otherwise it applies the next and all proceeding addresses as 
        globals, like this:
        
        1: lo: <LOOPBACK,UP> mtu 16436 qdisc noqueue
            link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
            inet 127.0.0.1/8 scope host lo
        2: eth0: <BROADCAST,MULTICAST,UP> mtu 1500 qdisc pfifo_fast qlen 1000
            link/ether 00:0d:56:11:11:11 brd ff:ff:ff:ff:ff:ff
            inet 20.20.80.18/28 brd 20.20.80.31 scope global eth0
            inet 20.20.80.19/32 scope global eth0
            inet 20.20.80.20/32 scope global eth0
            inet 20.20.80.21/32 scope global eth0
            inet 20.20.80.22/32 scope global eth0
            inet 20.20.80.23/32 scope global eth0
            inet 20.20.80.24/32 scope global eth0
            inet 20.20.80.25/32 scope global eth0
            inet 20.20.80.26/32 scope global eth0
            inet 20.20.80.27/32 scope global eth0
            inet 20.20.80.28/32 scope global eth0
            inet 20.20.80.29/32 scope global eth0
            inet 20.20.80.30/32 scope global eth0
        3: eth1: <BROADCAST,MULTICAST,UP> mtu 1500 qdisc pfifo_fast qlen 1000
            link/ether 00:0c:11:11:11:60 brd ff:ff:ff:ff:ff:ff
            inet 192.168.80.19/28 brd 192.168.80.31 scope global eth1
        
        If secondary is appended to the command, then secondary is applied to the 
        additional IP's and the ip add show output for that interfaces IP's.  My 
        questions is;  beside being able to flush all addresses by flushing the 
        main global address, what is the significance of the "secondary" attribute 
        to the ip addr add command?
        
        
        
        note the difference above to what is in your paper;
        
        1: lo:  mtu 16436 qdisc noqueue
            link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
            inet 127.0.0.1/8 brd 127.255.255.255 scope host lo
        2: eth0:  mtu 1500 qdisc pfifo_fast qlen 100
            link/ether 00:10:5a:10:0d:37 brd ff:ff:ff:ff:ff:ff
            inet 12.12.12.2/24 brd 12.12.12.255 scope global eth0
            inet 12.12.12.12/24 scope global secondary eth0
        3: eth1:  mtu 1500 qdisc pfifo_fast qlen 100
            link/ether 00:10:5a:10:0d:34 brd ff:ff:ff:ff:ff:ff
            inet 192.168.1.1/24 brd 192.168.1.255 scope global eth1
        
        
        In my output there is no "scope global secondary", never used that param 
        on the commandline when setting up NAT, and yet mine works...
        
        
        >
        >#ip add help
        >Usage: ip addr {add|del} IFADDR dev STRING
        >      ip addr {show|flush} [ dev STRING ] [ scope SCOPE-ID ]
        >                           [ to PREFIX ] [ FLAG-LIST ] [ label PATTERN ]
        >IFADDR := PREFIX | ADDR peer PREFIX
        >         [ broadcast ADDR ] [ anycast ADDR ]
        >         [ label STRING ] [ scope SCOPE-ID ]
        >SCOPE-ID := [ host | link | global | NUMBER ]
        >FLAG-LIST := [ FLAG-LIST ] FLAG
        >FLAG  := [ permanent | dynamic | secondary | primary |
        >          tentative | deprecated ]
        >
        >
        
        This is all undecipherable, and not explained at all in the man page, nor 
        in the document that I did enjoy and wished I'd had found when fisrt 
        setting up my 1:1 NAT setup.  But as I keep asking what is the reall 
        significance of the secondary attribute being added to the command as 
        suggested but poorly explained in the documantation.  Not adding that 
        param and it all works fine, so what does that param addition really by me 
        in a 1:1 NAT setup?
        
        
        	[SNIPPED old replies in this thread]
        
        
        
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
        
        iD8DBQFD4nNyst+vzJSwZikRAlb3AKCd63t2rSMmhbi8bWDwpaVyS2Zk1gCfcXlo
        /txM6QNbQjcVSPB1gjJ3UrQ=
        =3amA
        -----END PGP SIGNATURE-----

