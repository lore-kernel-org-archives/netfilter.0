From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: ip_conntrack
Date: Thu, 22 May 2003 07:53:22 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A019233@wardrive.citadelcomputer.com.au>
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
To: netfilter_user <netfilter_user@o2.pl>, netfilter@lists.netfilter.org

ip connection tracking is what it says and using rules like

$IPTABLES -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

makes the existing connections automatically excepted, like an SSH =
connection will continue to work after the first SYN is accepted as the =
connection would be established and ip_conntrack will keep a record of =
the connection while it's still up.

Without ip_conntrack, the --state module would not work... correct me if =
I'm wrong guys.. ;)

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au

-----Original Message-----
From: netfilter_user [mailto:netfilter_user@o2.pl]
Sent: Thursday, May 22, 2003 6:18 AM
To: netfilter@lists.netfilter.org
Subject: ip_conntrack


Hello everyone,

I have got very simply and basic quastion.
What ip_cpnntrack and ip_cpnntrack_ftp realy do? Tracking connection
or something more?

 =20

--=20
Best regards,
 mailto:netfilter_user@o2.pl



