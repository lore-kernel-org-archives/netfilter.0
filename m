From: "Gilles Yue" <gyue@novelgmt.intnet.mu>
Subject: RE: MRTG and IPTABLES
Date: Fri, 9 Jan 2004 09:54:47 +0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <83055D4B014C9E478D2F04624B9E82CFAE966A@noveldc.novelgmt.mu>
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
To: Alexis <alexis@attla.net.ar>
Cc: netfilter@lists.netfilter.org

That's it.=20
Thanks very much.

gy

-----Original Message-----
From: Alexis [mailto:alexis@attla.net.ar]=20
Sent: Thursday, January 08, 2004 5:47 PM
To: Gilles Yue
Subject: Re: MRTG and IPTABLES

POSTROUTING match all packets leaving the firewall, so you need to add
the
same rule, try with


iptables -t nat -A POSTROUTING -p udp --dport 161 -j ACCEPT


----- Original Message -----=20
From: "Gilles Yue" <gyue@novelgmt.intnet.mu>
To: "Gilles Yue" <gyue@novelgmt.intnet.mu>
Cc: <netfilter@lists.netfilter.org>
Sent: Thursday, January 08, 2004 8:56 AM
Subject: RE: MRTG and IPTABLES


Hi,

I have opened port 161 in my firewall script.

$IPTABLES -A INPUT -p udp -m udp --dport 161 -j ACCEPT

However, POSRTOUTING SET TO DROP By default, is preventing MRTG
from running properly. (I have tried setting POSTROUTING TO ACCEPT
and MRTG works fine)

$IPTABLES -t nat -P POSTROUTING DROP

Does anybody know how do I allow MRTG to run with POSTROUTING
SET TO DROP?

Thanks
gy


-----Original Message-----
From: Gilles Yue
Sent: Thursday, January 08, 2004 10:47 AM
To: Daniel F. Chief Security Engineer -; netfilter@lists.netfilter.org
Subject: RE: MRTG and IPTABLES

Dear sir,

Have tried your commands below but when I run my iptables script,

I get "command not found" and it points to the line

$SNMP_POLLER_IP=3D"xxx.xxx.xxx.xxx"

Thanks
gy


-----Original Message-----
From: Daniel F. Chief Security Engineer -
[mailto:danielf@supportteam.net]
Sent: Wednesday, January 07, 2004 6:18 PM
To: Gilles Yue; netfilter@lists.netfilter.org
Subject: Re: MRTG and IPTABLES

try

$IPTABLES -A INPUT -p udp --dport 161 -j ACCEPT

assuming that yuo are tryinh to accept port 161 on the local machine. if
you
doing stateful it should look similar to this.

# IP of machine running MRTG
$SNMP_POLLER_IP=3D"xxx.xxx.xxx.xxx"

$IPTABLES -A INPUT -p udp -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A INPUT -p udp --dport 161 -m state --state NEW -s
$SNMP_POLLER_IP
-j ACCEPT

$IPTABLES -A OUTPUT -p udp -m state --state ESTABLISHED,RELATED -j
ACCEPT
$IPTABLES -A OUTPUT -p udp --sport 161 -m state --state NEW -s
$SNMP_POLLER_IP
-j ACCEPT

This is assuming you have set the ploicies to drop
$IPTABLES -P INPUT DROP
$IPTABLES -P OUTPUT DROP

On Wednesday 07 January 2004 06:46, Gilles Yue wrote:
> Hi,
>
> Is this the way it should be in iptables?
>
> #Open SNMP Ports
> $IPTABLES -A INPUT -p udp -m udp --dport 161 -j ACCEPT
>
> Have tried it, not working
>
> Thanks.
> Gy
>
> -----Original Message-----
> From: Daniel F. Chief Security Engineer -
> [mailto:danielf@supportteam.net]
> Sent: Wednesday, January 07, 2004 4:45 PM
> To: Gilles Yue; netfilter@lists.netfilter.org
> Subject: Re: MRTG and IPTABLES
>
> SNMP UDP Ports 161 and 162 MRTG typically only uses 161.
>
>
> Thanks
>
> On Wednesday 07 January 2004 00:54, Gilles Yue wrote:
> > MRTG cannot work properly due to iptables running.
> >
> >
> >
> > Anybody knows which port number to open to enable MRTG to work
>
> properly.
>
> > Thanks.
> >
> >
> >
> > Rgds
> >
> > gy

--=20
Daniel Fairchild - Chief Security Officer | danielf@supportteam.net
The distance between nothing and infinity is always the same no matter
how
close you get to nothing.





