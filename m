From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: redundancy with linux and two NIC
Date: Mon, 16 Jun 2003 08:35:52 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A019281@wardrive.citadelcomputer.com.au>
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
To: netfilter@lists.netfilter.org

You need to use iproute2 for redundancy routing. iptables isn't really =
for that kind of job I think..

Here's a link that can help you that I found to be pretty good...

http://www.samag.com/documents/s=3D1824/sam0201h/0201h.htm


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
From: Ivan Rodriguez [mailto:ivanoch79@yahoo.com.mx]
Sent: Saturday, June 14, 2003 3:17 AM
To: netfilter@lists.netfilter.org
Subject: redundancy with linux and two NIC


Hi=20
i have the next situation

                          ADSL
                   eth1--------->
192.168.64.x --->LinuxBox
                   eth0--------->
                          DS0
=20
my Linux box is a GW i need the following:
        =20

        if etho is down then all traffic is routed
        by eth1 and  if eth1 is down then all=20
        traffic is routed by eth0

it is posible ?
please help me and excusme mi english is not god


