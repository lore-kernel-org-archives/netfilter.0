From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: ssl forward / proxy question
Date: Fri, 25 Jul 2003 10:44:54 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A15BFC4@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: jen@saturn5.com, netfilter@lists.netfilter.org

You cannot do this as SSL by default will connect, negotiate a =
certificate and the DISCONNECT AND RECONNECT using the encryption.. =
which by then it's too late to know the virtual site it's for..

on the first connection it's fine but second connection is impossible to =
determine which virtual host it's for..

My only solution was to use different ports for SSL ie. 443 is not used, =
444-500 for each site.. or setup a common domain for all sites to use.. =
ie. www.paysafe.com/domain1 www.paysafe.com/domain2 etc.etc...

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au

Phone   : +61 2 9955 2644
HelpDesk: +61 2 9955 2698
=20

-----Original Message-----
From: jen@saturn5.com [mailto:jen@saturn5.com]
Sent: None
To: netfilter@lists.netfilter.org
Subject: ssl forward / proxy question



hi,=20

i have a NAT set up via an iptables firewall on RHAS. i have various =
webservers=20
behind it (and other stuff), but now i'm required by marketing (sigh) to =
set=20
up loads of SSL certificates. since apache/apache2 still requires one ip =

address per SSL certificate, and they mean to do lots of these, i'm =
wondering
how to set it up in such a way that all DNS points to one external IP =
address
such as 234.56.78.90. when the packet hits the firewall, something =
proxies it=20
so that it will see the *name* address, and forward it on to a virtual =
IP. for
example:

there are 3 domains all belonging to the same "real" IP address.=20

234.56.78.90 -> www.guinness.com
234.56.78.90 -> www.kicks.com
234.56.78.90 -> www.butt.com

so a user wants to go to www.guinness.com, the IP takes the packet to =
the fire
wall/proxy/whatever, notices that it's "www.guinness.com" and and will =
forward t
he packet on to the internal address of 10.31.1.44

user goes to www.kicks.com, and the packet goes to 10.31.1.45

www.butt.com will get forwarded to 10.31.1.46

is there something like this that is possible?=20

thanks!!

-\jen


