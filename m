From: "Williamson, Fionn" <FWilliamson@fnb.co.za>
Subject: RE: Problems when runs iptables
Date: Wed, 4 Sep 2002 14:57:20 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <67024BB66045D511A9380000F6B2EF85F20DAE@RBGMSG02>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: =?iso-8859-1?Q?=27Antenor_R=2E_Corr=EAa_=27?= <antenor@sigmasoftware.com.br>
Cc: "'netfilter@lists.samba.org'" <netfilter@lists.samba.org>

=20
Hi Antenor,


This looks as though you might have ipchains running as well as trying to=

run iptables. Do the following (logged on or su'ed as "root", of course ;=
-):

1) /etc/rc.d/init.d/ipchains stop
2) /etc/rc.d/init.d/iptables stop (you may get a "failed" message here, t=
hat
is OK.
3) /etc/rc.d/init.d/iptables start
4) run "ntsysv" from a console command line and remove the "*" from the
ipchains field. This is to stop ipchains coming up again after a reboot.

Give it a try and see how you go, but I think this should resolve your
problem.


Regards,

Fionn.



-----Original Message-----
From: Antenor R. Corr=EAa
To: netfilter@lists.samba.org
Sent: 9/3/02 10:45 PM
Subject: Problems when runs iptables

Hello,
=20
I using RedHat 7.2 and runs any iptables commands, occurs:
=20
Sample
[root@Server /]# /sbin/iptables -L

/lib/modules/2.4.7-10/kernel/net/ipv4/netfilter/ip_tables.o:
init_module: Device or resource busy
Hint: insmod errors can be caused by incorrect module parameters,
including invalid IO or IRQ parameters
/lib/modules/2.4.7-10/kernel/net/ipv4/netfilter/ip_tables.o: insmod
/lib/modules/2.4.7-10/kernel/net/ipv4/netfilter/ip_tables.o failed
/lib/modules/2.4.7-10/kernel/net/ipv4/netfilter/ip_tables.o: insmod
ip_tables failed
iptables v1.2.3: can't initialize iptables table `filter': iptables who?
(do you need to insmod?)
Perhaps iptables or your kernel needs to be upgraded.

When runs "/sbin/insmod ip_tables:
[root@Server /]# /sbin/insmod ip_tables
Using /lib/modules/2.4.7-10/kernel/net/ipv4/netfilter/ip_tables.o
/lib/modules/2.4.7-10/kernel/net/ipv4/netfilter/ip_tables.o:
init_module: Device or resource busy
Hint: insmod errors can be caused by incorrect module parameters,
including invalid IO or IRQ parameters

=20
Who resolve this problem?
=20
Thanks.
Antenor
_________________________________________________________________________=
__________________________


The views expressed in this email are, unless otherwise stated, those of =
the author and not those
of the FirstRand Banking Group or its management.  The information in thi=
s e-mail is confidential
and is intended solely for the addressee. Access to this e-mail by anyone=
=20else is unauthorised.=20
If you are not the intended recipient, any disclosure, copying, distribut=
ion or any action taken or=20
omitted in reliance on this, is prohibited and may be unlawful.
Whilst all reasonable steps are taken to ensure the accuracy and integrit=
y of information and data=20
transmitted electronically and to preserve the confidentiality thereof, n=
o liability or=20
responsibility whatsoever is accepted if information or data is, for what=
ever reason, corrupted=20
or does not reach its intended destination.

=20                              ________________________________

