From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: Blocking Kazaa
Date: Sun, 24 Aug 2003 11:47:10 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A15C17F@wardrive.citadelcomputer.com.au>
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
To: Jean-Rene Cormier <jean-rene.cormier@cipanb.ca>, netfilter@lists.netfilter.org

well if it help, use squid to block anything to the kazaa servers =
(whatever they are..)since kazaa tries to use port 80, a transparent =
proxy would be good in this case..

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
From: Jean-Rene Cormier [mailto:jean-rene.cormier@cipanb.ca]
Sent: Friday, August 22, 2003 9:50 PM
To: netfilter@lists.netfilter.org
Subject: Blocking Kazaa


Anybody know a way of blocking Kazaa? I've tried the string matching way
but it doesn't seem to work. I tried logging all connections from  my
windows desktop so I could see to which port it connects and it connects
to so many different port that you basically need to block ports 1000 to
4000 but after that it connects to port 80 which obviously I can't
block. I installed ethereal on the windows desktop to check which string
I could filter but couldn't find anything useful.

Anybody have an idea what can be done? I'm thinking another option would
be to block the IP of the servers but there seem to be quite a list...
that's if it doesn't just try some random IPs...

Jean-Rene Cormier



