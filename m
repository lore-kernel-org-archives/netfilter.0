From: "Dharmendra.T" <dharmu@nsecure.net>
Subject: Re: iptables-restore v1.2.5: can't initialize iptables table `': Table does not exist (do you need to insmod?) <<Help>>
Date: Tue, 24 Sep 2002 18:34:33 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002801c263ca$f480f1b0$2b00a8c0@dharmu>
References: <00fb01c263b7$a8fe5380$2900a8c0@spectranet.com> <002b01c263be$95b3f490$2b00a8c0@dharmu> <000901c263bd$da3d1480$2900a8c0@spectranet.com> <001701c263c1$887ebb40$2b00a8c0@dharmu> <004e01c263c1$15ed33e0$2900a8c0@spectranet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: Krishna <Krishna_shekhar@gmx.net>, netfilter@lists.netfilter.org

I can see only two rules in your mail. These two rules should not give any
problem like this. I guess that you have more rules which is giving this
error. Have you cheked whether the input chain is dropped completely. If the
input chain is getting dropped completely you may have to recompile the
kernel with all the modules(netfilter) and check again
Regards
Dharmu
----- Original Message -----
From: "Krishna" <Krishna_shekhar@gmx.net>
To: <netfilter@lists.netfilter.org>
Sent: Tuesday, September 24, 2002 5:24 PM
Subject: Re: iptables-restore v1.2.5: can't initialize iptables table `':
Table does not exist (do you need to insmod?) <<Help>>


> Hi,
> This is all what I get!
> I have made rules in /etc/sysconfig/iptables and the
> /etc/rc.d/init.d/iptables points to this file and starts it.
>
> regards
> Krishna
>
> Krishna Shekhar
> Network Administrator
> Wiplash Wireless
> ----- Original Message -----
> From: Dharmendra.T <dharmu@nsecure.net>
> To: Krishna <Krishna_shekhar@gmx.net>; <netfilter@lists.netfilter.org>
> Sent: Tuesday, September 24, 2002 5:27 PM
> Subject: Re: iptables-restore v1.2.5: can't initialize iptables table `':
> Table does not exist (do you need to insmod?) <<Help>>
>
>
> > You should send us the complete error message, which table the iptables
> > could not recognize
> > DHarmu
> > ----- Original Message -----
> > From: "Krishna" <Krishna_shekhar@gmx.net>
> > To: <netfilter@lists.netfilter.org>
> > Sent: Tuesday, September 24, 2002 5:00 PM
> > Subject: Re: iptables-restore v1.2.5: can't initialize iptables table
`':
> > Table does not exist (do you need to insmod?) <<Help>>
> >
> >
> > > Hi,
> > >     It gives the same error
> > >
> > >  iptables-restore v1.2.5: can't initialize iptables table `': Table
does
> > not
> > > exist (do you need to insmod?)
> > > Perhaps iptables or your kernel needs to be upgraded
> > >
> > > regards
> > > Krishna
> > >
> > > Krishna Shekhar
> > > Network Administrator
> > > Wiplash Wireless
> > > ----- Original Message -----
> > > From: Dharmendra.T <dharmu@nsecure.net>
> > > To: Krishna <Krishna_shekhar@gmx.net>; <netfilter@lists.netfilter.org>
> > > Sent: Tuesday, September 24, 2002 5:05 PM
> > > Subject: Re: iptables-restore v1.2.5: can't initialize iptables table
> `':
> > > Table does not exist (do you need to insmod?) <<Help>>
> > >
> > >
> > > > Hi Krishna,
> > > >  Have you tried it manually?
> > > > #iptables-restore < /etc/sysconfig/iptables
> > > >
> > > >  I think the iptables could not reach to the file
> > /etc/sysconfig/iptables
> > > > Regards
> > > > Dharmu
> > > > ----- Original Message -----
> > > > From: "Krishna" <Krishna_shekhar@gmx.net>
> > > > To: <netfilter@lists.netfilter.org>
> > > > Sent: Tuesday, September 24, 2002 4:16 PM
> > > > Subject: iptables-restore v1.2.5: can't initialize iptables table
`':
> > > Table
> > > > does not exist (do you need to insmod?) <<Help>>
> > > >
> > > >
> > > > > Hi,
> > > > >
> > > > > I switched from ipchains to iptables. But whenever I start
iptables
> it
> > > > gives
> > > > > me this error.
> > > > >
> > > > > iptables-restore v1.2.5: can't initialize iptables table `': Table
> > does
> > > > not
> > > > > exist (do you need to insmod?)
> > > > > Perhaps iptables or your kernel needs to be upgraded.
> > > > >
> > > > > lsmod shows that
> > > > > iptable_mangle,iptable_nat,ip_conntrack,iptable_filter and
iptables
> > are
> > > > > loaded.
> > > > > That means the modules for iptables has loaded also I can see that
> > > modules
> > > > > for ipchains are not loaded and that is right.
> > > > >
> > > > > The iptables file is in /etc/sysconfig/iptables
> > > > > The table goes like this
> > > > > -P INPUT DROP
> > > > > -A FORWARD -s 192.168.0.0/24 -j MASQUERADE
> > > > > .......
> > > > > ...........
> > > > > ........................
> > > > > I am using RedHAt 7.1 and kernel 2.4.2-2
> > > > > What could be the problem?
> > > > >
> > > > > regards
> > > > > Krishna
> > > > >
> > > > > Krishna Shekhar
> > > > > Network Administrator
> > > > > Wiplash Wireless
> > > > >
> > > > >
> > >
> > >
>
>


