From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: Problem with sendmail server behind firewall...
Date: Fri, 5 Sep 2003 16:45:18 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A15C264@wardrive.citadelcomputer.com.au>
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
To: Pradeep Bhomia <pradeepbhomia@ahm.cmc.net.in>, netfilter@lists.netfilter.org

This is a sendmail or a network setup problem not really a Netfilter =
problem.. unless it's really badly done rules.

What does a mailq show or even the /var/log/maillog? Have you got the =
DNS and default gateway correct..etc.etc..

Also, this is probably something that should be taken off the list if =
you establish it's definately sendmail problem.


-----Original Message-----
From: Pradeep Bhomia [mailto:pradeepbhomia@ahm.cmc.net.in]
Sent: Friday, September 05, 2003 4:40 PM
To: netfilter@lists.netfilter.org
Subject: Problem with sendmail server behind firewall...


We are facing problem with the sendmail server when it is put behind the =

iptables firewall.
The setup is:
Sendmail 8.12.9
IPTables 1.2.7
Shorewall 1.3.14

Earlier Sendmail server was connected directly to the Internet with a =
valid=20
Internet IP. At that time the number of sendmail processes never =
exceeded 10=20
at any given poing of time. (Checked with ps -ef | grep sendmail)
Now we have implemented the Mandrake Linux 9.1 based firewall using =
IPTables=20
and Shorewall. NATting was configured on the firewall. After doing this, =
we=20
have observed that the number of sendmail process keeps on increasing =
and=20
goes upto nearly 170 processes. It seems that the problem is with the=20
incoming message requests. It process remains open for nearly 2 hours. =
This=20
is observed for random connections or some particular sites.
As such sendmail server is receiving and sending mails without any =
problem to=20
the users.
After I remove the firewall and put the server directly on the internet =
the=20
sendmail processes remain at less than 10.

I have been working on this problem for last two days without success. I =

cannot understand whether the problem is with the implementation of =
firewall=20
(NATting) or with sendmail server. I have checked the firewall with only =

NATting (removed all the rules)

Kindly help.

Thanks and regards,=20
=20
Pradeep Bhomia=20


