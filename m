From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: Multiple IP addresses
Date: Thu, 22 May 2003 11:31:55 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0D6C94@wardrive.citadelcomputer.com.au>
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
To: "Brei, Matt" <mbrei@medclaiminc.com>, netfilter@lists.netfilter.org

OK well you have to write the rules a little differently then.
You can write it this way which redirects ALL port 80/443 including the =
other IP (4.3.2.1), then add a rule for the 1 address (4.3.2.1) and =
redirect that to 10.1.1.2 example below....

# Redirect for this one IP to it's server
iptables -A PREROUTING -t nat -i $EXTDEV -d 4.3.2.1 -p tcp --dport 80 -j =
DNAT 10.1.1.2
# Everything else goes to 10.1.1.1 server.
iptables -A PREROUTING -t nat -i $EXTDEV            -p tcp --dport 80 -j =
DNAT 10.1.1.1=20


does that make better sense now..??

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au
=20

-----Original Message-----
From: Brei, Matt [mailto:mbrei@medclaiminc.com]
Sent: Thursday, May 22, 2003 11:25 AM
To: netfilter@lists.netfilter.org; George Vieira
Subject: RE: Multiple IP addresses





Yes, almost anything is possible.

>For instance, there are 3 web servers on the lan say 10.1.1.1 -
10.1.1.3 and
>I want all port 80/443 that comes to the netfilter machine on the
>inet_address 1.2.3.4 to go to lan_address 10.1.1.1=20

iptables -A PREROUTING -i $EXTDEV -d 1.2.3.4 -p tcp --dport 80 -j DNAT
10.1.1.1=20
# If I understand what you said is that "on the inet_address" meanin the
-d destintion address..??


>and all port 80/443 from inet_address 4.3.2.1 to forward to 10.1.1.2
etc.  Is this possible?

iptables -A PREROUTING -i $EXTDEV -s 4.3.2.1 -p tcp --dport 443 -j DNAT
10.1.1.1
# Also you said "from inet_address"..
I'm sorry, what I meant was "TO", I apologize.
>If so, how about a point in the right direction.


So what your doing is making everybody browse 10.1.1.1 but yourself
coming from a different source IP outside to view a different
webserver?? right??

Yes and no.  I actually hadn't thought of it that way.  The idea was to
be able to split up multiple sites on different servers each using
Apache's virtual hosts, say 10 or so per server.

Thanks a bunch for the help.
Matt
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
From: Brei, Matt [mailto:mbrei@medclaiminc.com]
Sent: Thursday, May 22, 2003 9:02 AM
To: netfilter@lists.netfilter.org
Subject: Multiple IP addresses


Greetings,

I'm using netfilter to nat/firewall my cable connection to my lan.  I
currently have 5 static IP addresses and would like to know if it is
possible to alias all 5 addresses on the inet_iface and then forward to
different machines on the lan_iface based on destination IP.  For
instance, there are 3 web servers on the lan say 10.1.1.1 - 10.1.1.3 and
I want all port 80/443 that comes to the netfilter machine on the
inet_address 1.2.3.4 to go to lan_address 10.1.1.1 and all port 80/443
from inet_address 4.3.2.1 to forward to 10.1.1.2 etc.  Is this possible?
If so, how about a point in the right direction.

TIA

Matt=20


