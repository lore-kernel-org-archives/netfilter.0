From: "Razham, Razak" <razhamr@regent-college.ac.uk>
Subject: Re: IPTables not available
Date: Wed, 26 Jun 2002 12:53:41 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <5.1.0.14.0.20020626125301.00abccf0@mail.regent-college.ac.uk>
References: <20020625174406.9A4D9489B@lists.samba.org>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="=====================_9275272==_.ALT"
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
To: netfilter@lists.samba.org

--=====================_9275272==_.ALT
Content-Type: text/plain; charset="us-ascii"; format=flowed

Hi,

Have you recompiled your kernel ?


am

At 10:32 26/06/02 +0800, jesse.linux wrote:

>Date: Tue, 25 Jun 2002 08:20:43 -0700
>From: "Daniel Curry" <<mailto:dcurry@cariocas.com>dcurry@cariocas.com>
>To: "Netfilter (E-mail)" 
><<mailto:netfilter@lists.samba.org>netfilter@lists.samba.org>
>
>On fresh RH7.2 and RH7.3 installs  IPTables executables are installed,
>but will not execute.  I get Kernel errors.  Can someone please direct
>me to a listing of what steps and option I need to enable this?  I wish
>to put firewalling with NAT services on a machine running an Apache web
>server, with PHP and Perl scripts connecting to a localhosted MySQL DB,
>as well as offering sendmail, POP(S)/IMAP(S), ftp, and PPTP VPN
>services.  Or a compatible ipchains script for this would also be
>appreciated.
>
>Thanks
>
>Daniel Curry
>IT Manager
>Cariocas
>625 Second Street=20
>Suite 201
>San Francisco, CA 94107=20
>ph: 415-348-6516
>fx: 415-348-6505=20
>cell: 510-579-6680
>
>"If A equals success, then the formula is: A =3D X + Y + Z,=20
>X is work. Y is play. Z is keep your mouth shut."=20
>   - Albert Einstein
>
>maybe ipchains is your problem.....
>try to unload ipchains then execute your iptables rules......
>
>

--=====================_9275272==_.ALT
Content-Type: text/html; charset="us-ascii"

<html>
Hi,<br><br>
Have you recompiled your kernel ?<br><br>
<br>
am<br><br>
At 10:32 26/06/02 +0800, jesse.linux wrote:<br><br>
<blockquote type=cite class=cite cite>Date: Tue, 25 Jun 2002 08:20:43
-0700<br>
From: &quot;Daniel Curry&quot;
&lt;<a href="mailto:dcurry@cariocas.com">dcurry@cariocas.com</a>&gt;<br>
To: &quot;Netfilter (E-mail)&quot;
&lt;<a href="mailto:netfilter@lists.samba.org">netfilter@lists.samba.org</a>&gt;<br><br>
On fresh RH7.2 and RH7.3 installs&nbsp; IPTables executables are
installed,<br>
but will not execute.&nbsp; I get Kernel errors.&nbsp; Can someone please
direct<br>
me to a listing of what steps and option I need to enable this?&nbsp; I
wish<br>
to put firewalling with NAT services on a machine running an Apache
web<br>
server, with PHP and Perl scripts connecting to a localhosted MySQL
DB,<br>
as well as offering sendmail, POP(S)/IMAP(S), ftp, and PPTP VPN<br>
services.&nbsp; Or a compatible ipchains script for this would also
be<br>
appreciated.<br><br>
Thanks<br><br>
Daniel Curry<br>
IT Manager<br>
Cariocas<br>
625 Second Street=20<br>
Suite 201<br>
San Francisco, CA 94107=20<br>
ph: 415-348-6516<br>
fx: 415-348-6505=20<br>
cell: 510-579-6680<br><br>
&quot;If A equals success, then the formula is: A =3D X + Y + Z,=20<br>
X is work. Y is play. Z is keep your mouth shut.&quot;=20<br>
&nbsp; - Albert Einstein<br>
&nbsp;<br>
<font face="arial" size=2>maybe ipchains is your 
problem.....</font><br>
<font face="arial" size=2>try to unload ipchains then execute your
iptables rules......</font><br><br>
&nbsp;</blockquote></html>

--=====================_9275272==_.ALT--


