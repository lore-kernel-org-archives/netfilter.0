From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: YAPFQ (Yet Another Port forwarding Question)
Date: Thu, 4 Dec 2003 15:06:59 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF567906B@alderaan.smgtec.com>
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
To: "Kleiner, Peter" <kleinerp@smbmicro.com>, netfilter@lists.netfilter.org

This is what makes it all worth while :->

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Kleiner, Peter
Sent: Thursday, December 04, 2003 2:49 PM
To: 'netfilter@lists.netfilter.org'
Subject: RE: YAPFQ (Yet Another Port forwarding Question)


> 1. Is the firewall that you're configuring the default route for the=20
> IMAP server?
No.

> If it isn't, then you have to SNAT the initial connection to the IMAP=20
> server.
You nailed it!!!!  Tried that, and it worked instantly.  Now that you=20
suggested it, it makes perfect sense that the packets were coming into
the IMAP server with the public IP address and it (the server) was=20
replying to that ip address via its default route, which is other than
the new gateway.  Thank you thank you thank you!!!!!

> 2. It probably isn't such a good habbit to use MASQ so liberally. You=20
> should make sure to tie it to an interface. It is a good habbit to get

> into especially when you have many-many-many homed machines.
I have a much more extensive firewall script that I use, which locks=20
things down much more tightly. I just wanted to get the port forwarding
issue figured out before I lock the sucker down.

Did I thank you yet?  Thanks!!!!!!  I've spent hours trying to figure=20
this out, including switching (needlessly) from RH9 to Slackware. I'm so
silly.....

PK

