From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: Is this correct?
Date: Fri, 20 Jun 2003 12:39:57 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0D6F15@wardrive.citadelcomputer.com.au>
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
To: Shawn <core@enodev.com>
Cc: netfilter@lists.netfilter.org

Why/How would the linux box broadcast it's ARP response to 10.0.0.1 when =
the IP doesn't belong to the firewall.. it just has a rule saying what =
to do if the packet arrives to it asking it to forward to that host... =
ARP is on different IP layer to netfilter.
The rule doesn't make it respond to arp requests.

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
From: Shawn [mailto:core@enodev.com]
Sent: Friday, June 20, 2003 12:29 PM
To: George Vieira
Cc: netfilter@lists.netfilter.org
Subject: RE: Is this correct?


I get confused because I picture other 10.0.0.0/24 hosts arping for
10.0.0.1 and getting the MAC for linux-router/eth0. How is this not the
case?

Thank you all so much for the help!

