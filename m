From: "Moath A. Khalaf" <moath2@yahoo.com>
Subject: Re: Re: Filtering using port+process (i.e. open port 80 for Apache only)
Date: Sun, 29 Feb 2004 07:44:48 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040229154448.76905.qmail@web40105.mail.yahoo.com>
References: <20040229143928.7884.68000.Mailman@netfilter-sponsored-by.noris.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040229143928.7884.68000.Mailman@netfilter-sponsored-by.noris.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

What I want is something like Zone Alarm
functionality. Infact I want to develop something like
Zone Alarm on Linux and I want to see what is the best
way to do this?
(www.sourceforge.net/projects/linuxalarm)

Regards, Muath

--- netfilter-request@lists.netfilter.org wrote:
> Send netfilter mailing list submissions to
> 	netfilter@lists.netfilter.org
> 
> To subscribe or unsubscribe via the World Wide Web,
> visit
> 
>
https://lists.netfilter.org/mailman/listinfo/netfilter
> or, via email, send a message with subject or body
> 'help' to
> 	netfilter-request@lists.netfilter.org
> 
> You can reach the person managing the list at
> 	netfilter-admin@lists.netfilter.org
> 
> When replying, please edit your Subject line so it
> is more specific
> than "Re: Contents of netfilter digest..."
> 
> 
> Today's Topics:
> 
>    1. Strange log info from iptables ? (Bo Jacobsen)
>    2. SNAT not working (Felipe)
>    3. Re: [ANNOUNCE] call for testing of
> patch-o-matic-ng (Willy TARREAU)
>    4. Re: Strange log info from iptables ? (Antony
> Stone)
>    5. Re: SNAT not working (Antony Stone)
>    6. Re: Strange log info from iptables ? (Cedric
> Blancher)
>    7. Filtering using port+process (i.e. open port
> 80 for Apache only) (Moath A. Khalaf)
>    8. Re: Filtering using port+process (i.e. open
> port 80 for Apache only) (Antony Stone)
>    9. Re: [ANNOUNCE] call for testing of
> patch-o-matic-ng (Harald Welte)
>   10. MAC addres and iptables (Sasa Stupar)
>   11. Re: MAC addres and iptables (Antony Stone)
>   12. Re: MAC addres and iptables (Sasa Stupar)
>   13. Re: MAC address and iptables (Antony Stone)
>   14. Re: MAC addres and iptables (Sasa Stupar)
> 
> --__--__--
> 
> Message: 1
> From: "Bo Jacobsen" <subs@systemhouse.dk>
> To: <netfilter@lists.netfilter.org>
> Subject: Strange log info from iptables ?
> Date: Sun, 29 Feb 2004 10:17:52 +0100
> 
> What is the following log info. It looks like some
> kind of combined ICMP =
> and DNS ?
> 
> Feb 29 10:02:03 WFx-SH kernel:=20
> DROP-OUT:IN=3D OUT=3Deth0 SRC=3D192.168.1.2
> DST=3D212.54.64.171=20
> LEN=3D198 TOS=3D0x00 PREC=3D0xC0 TTL=3D64
> ID=3D30626=20
> PROTO=3DICMP TYPE=3D3 CODE=3D3 [SRC=3D212.54.64.171
> DST=3D192.168.1.2 =
> LEN=3D170=20
> TOS=3D0x00 PREC=3D0x40 TTL=3D59 ID=3D53582=20
> PROTO=3DUDP SPT=3D53 DPT=3D59554=20
> LEN=3D150 ]=20
> 
> 
> 
> -------------------------------------------------
> Bo Jacobsen
> =20
> 
> 
> 
> 
> 
> --__--__--
> 
> Message: 2
> To: netfilter@lists.netfilter.org
> Subject: SNAT not working
> Date: Sun, 29 Feb 2004 04:34:44 -0500 (PET)
> From: Felipe <fflores@millicom.com.pe>
> 
> I've tried to set up SNAT to match INTERNAL network
> to a external ip,
> 
> 
> /usr/local/sbin/iptables -t nat -A POSTROUTING -o
> eth0 -s 10.0.0.0/16 -j SNAT --to-source
> 200.110.2.179
> 
> But that's working, it only works when i put:
> 
> /usr/local/sbin/iptables -t nat -A POSTROUTING -o
> eth0 -j MASQUERADE
> 
> 
> eth0= external interface
> eth1= internal interface
> 
> i've linux 7.3 kernel 2.6.3 andiptables v1.2.9
> 
> 
> Could you help me please?
> 
> 
> Thanks
> 
> 
> 
> 
> --__--__--
> 
> Message: 3
> Date: Sun, 29 Feb 2004 11:11:16 +0100
> From: Willy TARREAU <willy@w.ods.org>
> To: Harald Welte <laforge@netfilter.org>,
>    Netfilter Development Mailinglist
> <netfilter-devel@lists.netfilter.org>,
>    Netfilter Mailinglist
> <netfilter@lists.netfilter.org>
> Subject: Re: [ANNOUNCE] call for testing of
> patch-o-matic-ng
> 
> Hi Harald,
> 
> Just tested it on top of 2.4.25, like this :
> 
>     KERNEL_DIR=/usr/src/linux-2.4.25-pomng ./runme
> --batch extra
> 
> and I got a few problems :
> 
>   - first, I didn't find how to specify where my
> iptables sources is
>     installed, so I had to enter it by hand each
> time I restarted it.
>     I did not find any env variable in the perl
> code, and I must say
>     that my understanding of perl is, hmmm.. very
> limited.
>   - ROUTE and TRACE told me :
>     "unable to find ladd slot in src
> /usr/src/linux-2.4.25-pomng/./net/ipv6/Makefile"
>     I think they wanted to add a line in the
> Makefile but didn't find
>     the right place to do so. BTW, is there a way to
> install a patch
>     only for ipv4 or for ipv6 like before ?
>   - I observed usual conflicts :
>     present 'CONNMARK' conflicts with
> to-be-installed 'connbytes'
>     present 'raw' conflicts with to-be-installed
> 'conntrack-seqfile'
>     present 'CONNMARK' conflicts with
> to-be-installed 'conntrack_arefcount'
>   - and finally, trying to apply conntrack_locking
> litterally killed my
>     box in out of memory within a few tens of
> seconds (I could not even
>     run ps) :
>       Out of Memory: Killed process 9841 (runme).
>       Out of Memory: Killed process 9970 (ps).
>       Out of Memory: Killed process 159 (bash).
>       Out of Memory: Killed process 158 (bash).
> 
>     Since conntrack_locking needs
> conntrack_arefcount which could not
>     be applied, I wonder if there's some problem
> resolving dependancies.
> 
> I've not gone further yet.
> Do you need more info ? There may be some things I
> did wrong, do not hesitate
> to tell me ;-)
> 
> Cheers,
> Willy
> 
> 
> 
> --__--__--
> 
> Message: 4
> From: Antony Stone <Antony@Soft-Solutions.co.uk>
> To: <netfilter@lists.netfilter.org>
> Subject: Re: Strange log info from iptables ?
> Date: Sun, 29 Feb 2004 10:31:04 +0000
> 
> On Sunday 29 February 2004 9:17 am, Bo Jacobsen
> wrote:
> 
> > What is the following log info. It looks like some
> kind of combined ICMP
> > and DNS ?
> 
> Log entries for ICMP packets include the data in the
> body of the ICMP packet, 
> which is the header of the packet the ICMP is about.
> 
> 
=== message truncated ===


__________________________________
Do you Yahoo!?
Get better spam protection with Yahoo! Mail.
http://antispam.yahoo.com/tools

