From: <oarojo@intermediacorp.com>
Subject: Re: netfilter digest, Vol 1 #514 - 7 msgs
Date: Wed, 8 Jan 2003 17:32:21 +0800 (PHT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <14780.192.168.0.1.1042018341.squirrel@mail.intermediacorp.com>
References: <20030108052635.5370.76979.Mailman@kashyyyk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030108052635.5370.76979.Mailman@kashyyyk>
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
To: netfilter@lists.netfilter.org

Yes I'm using telnet from other network...

> Send netfilter mailing list submissions to
> 	netfilter@lists.netfilter.org
>
> To subscribe or unsubscribe via the World Wide Web, visit
> 	https://lists.netfilter.org/mailman/listinfo/netfilter
> or, via email, send a message with subject or body 'help' to
> 	netfilter-request@lists.netfilter.org
>
> You can reach the person managing the list at
> 	netfilter-admin@lists.netfilter.org
>
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of netfilter digest..."
>
>
> Today's Topics:
>
>   1. Re: port redirection *without* NAT (sm@rhythm.cx)
>   2. Re: 2.4.20 - ntfilter (owner) problems (Thorsten Scherf)
>   3. OT: curious about eth0/eth1 (Tommy McNeely)
>   4. RE: netfilter digest, Vol 1 #513 - 12 msgs (Bob Balsover)
>   5. Re: 2.4.20 - ntfilter (owner) problems (blkcore)
>   6. Re: OT: curious about eth0/eth1 (Joel Newkirk)
>   7. Re: portforwarding-HOWTO (Joel Newkirk)
>
> --__--__--
>
> Message: 1
> Date: Tue, 7 Jan 2003 17:36:30 -0500
> From: sm@rhythm.cx
> To: Athan <netfilter@miggy.org>
> Cc: netfilter@lists.netfilter.org
> Subject: Re: port redirection *without* NAT
>
> On Tue, Jan 07, 2003 at 10:08:00PM +0000, Athan wrote:
>>
>>    Didn't you already ask this and myself and someone else replied
>>    with
>> "yes you want DNAT".
>>
>
> Yes. This was a duplicate message, sorry. I sent it to the list from
> the wrong address by mistake, and was informed it got put into a queue
> for the moderator to look at. I asked for it to be disregarded and then
> I posted again from the correct address, but I guess the original got
> passed to the list anyway. (oops, there goes my spam-free address into
> the archives :/).
>
> I understand now that was I am describing is in fact NAT, it just
> didn't hit me at the time (duh). Sorry for the dupe, thanks for the
> help (Joel Newkirk too). Issue resolved.
>
>
>
> --__--__--
>
> Message: 2
> From: Thorsten Scherf <tscherf@web.de>
> Reply-To: tscherf@web.de
> To: "blkcore" <netfilter@blackcore.net>,
> <netfilter@lists.netfilter.org>
> Subject: Re: 2.4.20 - ntfilter (owner) problems
> Date: Wed, 8 Jan 2003 00:19:09 +0100
>
>> I recently compiled 2.4.20 with netfilter support, with the owner
>> modul=
> e
>> (-m owner), and after several attempts of trying to use it (worked for
>> 2.4.18), it gives an error.
>>
>> [root@scsi1 slinksi]# iptables -I OUTPUT -m owner --uid-owner root=20
>> iptables: Target problem
>
> Where is your target?! Is see no one!
>
>
>
> --__--__--
>
> Message: 3
> Date: Tue, 07 Jan 2003 16:59:53 -0700
> From: Tommy McNeely <Tommy.McNeely@Sun.COM>
> Subject: OT: curious about eth0/eth1
> To: netfilter@lists.netfilter.org
>
>
> I am curious about why people choose to make a certain interface
> internal  or external...
>
> I have always made my "eth0" interface my inside interface.. and once I
>  have the box UP and RUNNING (and firewalled), then bring up my outside
>  interface "eth1" ... My primary network for smb/nfs/whatever is my
> inside  network (thus eth0)... The outside interface is just a "extra
> interface"  that I can add on (or move/change/delete) or even make it
> ppp0 if I happen  to be changing ISP's :)
>
> I notice several people pick eth0 as their outside interface, and sorta
> "oh  yea" the rest of the inside network is on eth1.  I know the linux
> kernel  could really care less what they are called, its mostly a
> "neatness" thing  I guess... Also it seems like that leaves your box
> open to attack from the  time it installs (if you do a NET based
> install) till the time you get  around to actually putting a firewall
> on it.
>
> Again.. I am just curious as to why some do it one way.. and some the
> other... the above is only MY opinion, and could be dreadfully wrong :)
>
> Tommy
>
>
>
> --
> Tommy McNeely         --        Tommy.McNeely@Sun.COM
> Sun Microsystems - IT Ops - Broomfield Campus Support
> Phone:  x50888 / 303-464-4888  --  Fax:  720-566-3168
>
>
>
> --__--__--
>
> Message: 4
> Date: Tue, 07 Jan 2003 17:01:30 -0800
> From: Bob Balsover <balsover@pacbell.net>
> Subject: RE: netfilter digest, Vol 1 #513 - 12 msgs
> To: netfilter@lists.netfilter.org
>
>
> Message: 9
> Date: Tue, 7 Jan 2003 21:13:34 +0100
> From: Harald Welte <laforge@netfilter.org>
> To: Netfilter Development Mailinglist
> <netfilter-devel@lists.netfilter.org>
> Cc: Netfilter Mailinglist <netfilter@lists.netfilter.org>,
> 	Netfilter Announcement List
> <netfilter-announce@lists.netfilter.org>
> Subject: [ANNOUNCE] New netfilter/iptables patch-o-matic release
> Reply-To: coreteam@netfilter.org
>
>
> --KMIs29sPfC/9Gbii
> Content-Type: text/plain; charset=us-ascii
> Content-Disposition: inline
> Content-Transfer-Encoding: quoted-printable
> While patch-o-matic-20030107 is announced on the home page, it is not
> listed on the download page...
>
>
>
> ------------------------------------------
> Good news, Everyone! (TM)
>
> The netfilter core team announces a new release of the netfilter
> patch-o-matic suite:
>
> 	patch-o-matic-20030107
>
> This release contains the most up-to-date bugfixes and new features
> for=20
> the netfilter/iptables subsystem of the 2.4.x Linux kernel.
>
> The patches are devided into several repositories.  Which ones are to
> be used, depends on how conservative or adventurous the user is ;)
>
> 'submitted':
> 	Patches which have been submitted for kernel inclusion, most of
> 	them have already appeared in 2.4.20.  It's really recommended
> 	to always apply those
>
> 'pending':
> 	Patches currently pending for kernel inclusion.  They will
> 	almost certainly appear in the next official kernel release.
>
> 'base':
> 	New features which are self-contained enough so it's sure they
> 	don't clash with each other.  Those are safe in the way that
> they
> 	don't harm already existing functionality.  Playing with them
> 	might discover one or the other remaining bug... you've been
> 	warned.
>
> 'extra':
> 	New features which might cause other patches from 'extra' to
> 	clash with each other.  Most interestingly, you will find here
> 	conntrack/nat helpers for H.323, PPTP, talk/ntalk, rsh, tftp,
> 	mms and amanda.
>
>
> Read more about the individual patches of this new patch-o-matic
> release at:
> http://www.netfilter.org/documentation/pomlist/pom-summary.html
>
> The new patch-o-matic release including a cryptographic GPG signature
> is available for download at
>
> 	http://www.netfilter.org/downloads.html#pom-20030107
>
>
> Enjoy,
> 	Harald (for the netfilter core team)
>
>
>
> --__--__--
>
> Message: 5
> From: "blkcore" <netfilter@blackcore.net>
> To: <netfilter@lists.netfilter.org>
> Subject: Re: 2.4.20 - ntfilter (owner) problems
> Date: Tue, 7 Jan 2003 17:26:49 -0800
>
> You don't need a -j target to use the owner module, I use it for
> bandwidth byte/counter logging, but heres some output for you to read.
>
> [root@scsi1 root]# uname -r
> 2.4.20-grsec
> [root@scsi1 root]# iptables -I OUTPUT -m owner --uid-owner root -j
> ACCEPT iptables: Target problem
>
> laptop:~# uname -r
> 2.4.19
> laptop:~# iptables -I OUTPUT -m owner --uid-owner root
> laptop:~# iptables -I OUTPUT -m owner --uid-owner root -j ACCEPT
> laptop:~#
>
> ----- Original Message -----
> From: "Thorsten Scherf" <tscherf@web.de>
> To: "blkcore" <netfilter@blackcore.net>;
> <netfilter@lists.netfilter.org> Sent: Tuesday, January 07, 2003 3:19 PM
> Subject: Re: 2.4.20 - ntfilter (owner) problems
>
>
>> I recently compiled 2.4.20 with netfilter support, with the owner
>> module (-m owner), and after several attempts of trying to use it
>> (worked for 2.4.18), it gives an error.
>>
>> [root@scsi1 slinksi]# iptables -I OUTPUT -m owner --uid-owner root
>> iptables: Target problem
>
> Where is your target?! Is see no one!
>
>
>
>
>
> --__--__--
>
> Message: 6
> From: Joel Newkirk <netfilter@newkirk.us>
> Reply-To: netfilter@newkirk.us
> To: Tommy McNeely <Tommy.McNeely@Sun.COM>,
> netfilter@lists.netfilter.org
> Subject: Re: OT: curious about eth0/eth1
> Date: Tue, 7 Jan 2003 22:47:24 -0500
>
> On Tuesday 07 January 2003 06:59 pm, Tommy McNeely wrote:
>> I am curious about why people choose to make a certain interface
>> internal or external...
>
>> I notice several people pick eth0 as their outside interface, and
>> sorta "oh yea" the rest of the inside network is on eth1.  I know the
>> linux kernel could really care less what they are called, its mostly a
>> "neatness" thing I guess... Also it seems like that leaves your box
>> open to attack from the time it installs (if you do a NET based
>> install) till the time you get around to actually putting a firewall
>> on it.
>
> Why would this in particular leave a box exposed?
>
> I think that the main reason for 'some one way, some the other' is
> random= =20
> chance.  However, consider this scenario:
>
> You have two NICs, eth0 and eth1. The connections on one you trust
> (-i=20 eth0 -j ACCEPT), the other you don't.  One of them fails, or the
> board=20 works loose from it's socket, or something, so that upon
> booting the=20 machine you only have one interface.  No matter which
> board fails, the=20 remaining board would be eth0.  If eth0 is your
> 'trusted' internal=20 network in normal conditions, and it fails, then
> suddenly the untrusted=20 network is operating under the trusted
> network's rules.  However, the IP=20 assignment (if static!) would
> remain that of the trusted network, so as=20 long as eth0 is configured
> with a static IP this shouldn't present a=20 risk.  If, however, both
> are dynamic, (say DHCP assigned) then this=20 would qualify as a
> security hole, possibly a huge one.  To be fair, this=20 is probably a
> very rare intersection of situations, but if eth0 is the=20 untrusted
> network, then any failure would be an annoyance, not a risk.
>
> j
>
>
>
>
> --__--__--
>
> Message: 7
> From: Joel Newkirk <netfilter@newkirk.us>
> Reply-To: netfilter@newkirk.us
> To: <oarojo@intermediacorp.com>,
> <netfilter@lists.netfilter.org>
> Subject: Re: portforwarding-HOWTO
> Date: Tue, 7 Jan 2003 22:59:25 -0500
>
> On Monday 06 January 2003 01:50 am, oarojo@intermediacorp.com wrote:
>> Hello people!!!
>>
>> I have set-up a linux box firewall with two ethernet cards; eth0
>> facing the internet and eth1 facing the internal network. Inside my
>> network is my mail server with an IP of 192.168.0.5. Now since my ISP
>> had only given me one valid IP address for my network, I wish to do
>> port-forwarding for ports 25 and 110. I did something like:
>>
>> # iptables -t nat -A PREROUTING -p tcp -i eth0 -d xxx.xxx.xxx.xxx
>> --dport 25 -j DNAT --to 192.168.0.5:25
>>
>> # iptables -t nat -A PREROUTING -p tcp -i eth0 -d xxx.xxx.xxx.xxx
>> --dport 110 -j DNAT --to 192.168.0.5:110
>>
>> # iptables -A FORWARD -p tcp -i eth0 -d 192.168.0.5 --dport 25=20 -j
>> ACCEPT=20
>> # iptables -A FORWARD -p tcp -i eth0 -d 192.168.0.5 --dport 110
>> -j ACCEPT
>>
>> # iptables-save > /etc/sysconfig/iptables
>>
>> When i used nmap to determine if ports 25 and 110 are open, it says:
>>
>> 25/tcp     filtered    smtp
>> 110/tcp    filtered    pop-3
>>
>> and when i try telnetting its valid ip
>>
>> #telnet xxx.xxx.xxx.xxx 25
>>
>>
>> it says "trying...." and can't connect at all...
>>
>> How's this? Did I missed something here? Please Help!!!
>
> Do you have a FORWARD rule to allow return traffic back out?  You
> don't=20 mention one, so I have to ask.  Something like this would
> work, if no=20 other more general rule allows it:
>
> iptables -A FORWARD -p tcp -o eth0 -s 192.168.0.5 -m multiport  \
> --sport 25,110 -j ACCEPT
>
> Are you trying to telnet from outside the network?  If you are trying
> to=20 do it from the firewall box or from anywhere on the 192.168
> network it=20 will fail unless you have other rules to help 'guide' the
> traffic back=20 through the firewall.  (of course the rules you list
> are presumably for=20 traffice from outside...)  See Oskar's tutorial's
> DNAT info at:
> http://iptables-tutorial.frozentux.net/chunkyhtml/targets.html#DNATTARGET
> where he explains the problem and the solution, if you need to allow=20
> access from the local network or firewall.
>
> j
>
>
>
>
> --__--__--
>
> _______________________________________________
> netfilter mailing list
> netfilter@lists.netfilter.org
> https://lists.netfilter.org/mailman/listinfo/netfilter
>
>
> End of netfilter Digest




