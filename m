From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: H/A
Date: Tue, 27 May 2003 07:47:31 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0D6CE7@wardrive.citadelcomputer.com.au>
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
To: kluivert@tm.net.my, netfilter@lists.netfilter.org

iptables isn't a problem as I solved this using a special script and a =
special way of assigning the IPs.

    LIVE IP=3D203.x.x.x
FW1=3D10.1.1.1    FW2=3D10.1.1.1

using iproute2 I add the live IP to FW1 which is the Master FW.

ip add addr 203.x.x.x/28 dev eth0

Then my firewall scripts find the dev IP using "ip addr show $EXTDEV" =
add then "tail -1" for so it grabs the last line of the list otherwise =
it finds 2 IP bounded to the 1 network card and the scripts go nuts.. =
See snippet of my iptables script below.

getipfromdevice()
{
        DEV=3D"$1"
        DEVIP=3D`ip addr show dev $DEV | grep "inet" |tail -1 |awk =
{'print $2'} | cut -f1 -d "/"`
        echo "$DEVIP"
}
EXTDEV=3D"eth0"
EXTIP=3Dgetipfromdevice $EXTDEV


The problem is more with VPNs like PPTP/IPSEC as they won't pass the =
session over. But if they are company to company tunnels and they =
automatically reconnect, how it is a problem. a bit of packet loss for a =
few seconds and it's back up.. that's the internet for ya. ;)

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au

-----Original Message-----
From: Julian Gomez [mailto:kluivert@tm.net.my]
Sent: Monday, May 26, 2003 7:59 PM
To: netfilter@lists.netfilter.org
Subject: Re: H/A


On Sun, May 25, 2003 at 09:45:12PM -0500, g_netfilter@netfids.com spoke =
thusly:

>Hi friends, I have some boxes running iptables and i works well. But =
now I
>need to configure a failover solution, please could you give me some =
links
>to start reading? I need to consider Netfilter/Iptables and FreeSwan in
>the same box and with a failover configuration.

A few things you need to clarify :

	a) What are the failover criteria ? Does the other box need to
	   maintain full state, or can you accept that all connections will
	   die for the moment, and can be re-established with the new
	   master server ?

           If state is required, iptables2 should contain failover
	   capability according to some previous posts by Harald. There was
	   some experimental work being done by someone, in regards to
	   exporting the entries out (you'll have to check the archives for
	   details). I'm not sure how you'll get freeswan to play nice
	   though.

	b) If you merely want dumb failover, then google around for VRRP.
	   But understand the drawbacks in each circumstance.


