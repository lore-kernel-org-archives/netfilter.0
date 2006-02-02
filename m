From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: NAT with iptables / linux
Date: Thu, 2 Feb 2006 16:02:34 -0500 (EST)
Message-ID: <Pine.LNX.4.60.0602021550250.13575@darkstar.sysinfo.com>
References: <dac71d7b0601261219q39b58368w@mail.gmail.com>
	<002101c622c0$dc643de0$0101000a@sterenborg.info>
	<Pine.LNX.4.60.0602011532290.9776@darkstar.sysinfo.com>
	<Pine.LNX.4.60.0602011716120.9996@darkstar.sysinfo.com>
	<20060201225341.GA3846@res0psau@verizon.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060201225341.GA3846@res0psau@verizon.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: kelly <kelly@cliffhanger.com>
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Wed, 1 Feb 2006, kelly wrote:

> Ah I see.  The 'ip address' command has a few
> params.  The 'ip addr' command will just apply the
> first or only ip address.  'ip addr add' adds
> another address.  The secondary address.
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
> #ip add help
> Usage: ip addr {add|del} IFADDR dev STRING
>       ip addr {show|flush} [ dev STRING ] [ scope SCOPE-ID ]
>                            [ to PREFIX ] [ FLAG-LIST ] [ label PATTERN ]
> IFADDR := PREFIX | ADDR peer PREFIX
>          [ broadcast ADDR ] [ anycast ADDR ]
>          [ label STRING ] [ scope SCOPE-ID ]
> SCOPE-ID := [ host | link | global | NUMBER ]
> FLAG-LIST := [ FLAG-LIST ] FLAG
> FLAG  := [ permanent | dynamic | secondary | primary |
>           tentative | deprecated ]
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

