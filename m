From: "Benny Butler" <benny.butler@nexusitg.com>
Subject: RE: IPTables not available
Date: Wed, 26 Jun 2002 08:37:29 -0500
Sender: netfilter-admin@lists.samba.org
Message-ID: <002301c21d16$9e229df0$0205a8c0@maxima>
References: <004601c21cb9$a9482400$2400a8c0@inq7.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <004601c21cb9$a9482400$2400a8c0@inq7.net>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

I have a RH 7.2 box that's running iptables and has never had the kernel
recompiled.  Check 'lsmod' and make sure that ipchains is not listed.
If it is then 'rmmod ipchains' then 'insmod ip_tables'  Actually you can
skip that last command and it will load the module for you.

Hope this helps.




-----Original Message-----
From: netfilter-admin@lists.samba.org
[mailto:netfilter-admin@lists.samba.org] On Behalf Of jesse.linux
Sent: Tuesday, June 25, 2002 9:32 PM
To: netfilter@lists.samba.org
Cc: dcurry@cariocas.com
Subject: Re: IPTables not available



Date: Tue, 25 Jun 2002 08:20:43 -0700
From: "Daniel Curry" <dcurry@cariocas.com>
To: "Netfilter (E-mail)" <netfilter@lists.samba.org>

On fresh RH7.2 and RH7.3 installs  IPTables executables are installed,
but will not execute.  I get Kernel errors.  Can someone please direct
me to a listing of what steps and option I need to enable this?  I wish
to put firewalling with NAT services on a machine running an Apache web
server, with PHP and Perl scripts connecting to a localhosted MySQL DB,
as well as offering sendmail, POP(S)/IMAP(S), ftp, and PPTP VPN
services.  Or a compatible ipchains script for this would also be
appreciated.

Thanks

Daniel Curry
IT Manager
Cariocas
625 Second Street=20
Suite 201
San Francisco, CA 94107=20
ph: 415-348-6516
fx: 415-348-6505=20
cell: 510-579-6680

"If A equals success, then the formula is: A =3D X + Y + Z,=20
X is work. Y is play. Z is keep your mouth shut."=20
  - Albert Einstein

maybe ipchains is your problem.....
try to unload ipchains then execute your iptables rules......

 


