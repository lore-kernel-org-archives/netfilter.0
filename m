From: "Omar Castaneda Acosta" <omar@idea.com.mx>
Subject: RE: squid and iptables
Date: Fri, 14 Jun 2002 15:53:28 -0600
Sender: netfilter-admin@lists.samba.org
Message-ID: <3A5DC36EC1506C40825C05BE65E62AEF0E8B30@neptuno.idea.com.mx>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.samba.org

You could use David Ranch's stronger firewall script:
http://www.tldp.org/HOWTO/IP-Masquerade-HOWTO/stronger-firewall-examples
.html
Then add the necessary command to make SQUID transparent proxy work:

$IPTABLES -t nat -A PREROUTING -i $INTIF -p tcp --dport 80 -j REDIRECT
--to-port 3128

Once you check everything is working, you can go ahead and disable the
rule that allows every packet from the internal network to the universe

$IPTABLES -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT

and change that to a more restrictive set of rules, like:

$IPTABLES -A FORWARD -i $INTIF -o $EXTIF -p tcp --dport 80 -m state
--state NEW,ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -i $INTIF -o $EXTIF -p tcp --dport 21 -m state
--state NEW,ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -i $INTIF -o $EXTIF -p tcp --dport 53 -m state
--state NEW,ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -i $INTIF -o $EXTIF -p udp --dport 53 -m state
--state NEW,ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -i $INTIF -o $EXTIF -p tcp --dport 110 -m state
--state NEW,ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -i $INTIF -o $EXTIF -p tcp --dport 70 -m state
--state NEW,ESTABLISHED,RELATED -j ACCEPT

That would make the work!

Regards,
Omar

-----Original Message-----
From: Z=E9 Lu=EDs [mailto:zeluis@objetivo-americana.com.br]
Sent: Friday, June 14, 2002 3:16 PM
To: netfilter@lists.samba.org
Subject: Re: squid and iptables

Omar Castaneda Acosta wrote:

> Setup iptables to DROP/REJECT everything from the internal interface
> except -m state NEW,ESTABLISHED,RELATED on every service you want to
> allow.


thanks Omar,

i'm  needing more details about how to exactly do it.

I'm opening just few ports from eth0( NET_INT, my local network) to my
eth1 firewall (my internet valid ip), like 25,53,80 and 3128 ports.
I do something like this

"iptables -A INPUT -p tcp -j ACCEPT -s 192.168.1.10/255.255.255.0 -i
eth0 -d 192.168.1.154 --dport nn"

but all traffic is made like this:

Client:
------

from: 192.168.1.10:nn
to: 192.168.1.154:3128 (my firewall, squid server)

Server:
-------
from: 192.168.1.154:3128
to: 0.0.0.0 (Internet)

All client browsers is configurated to work with proxy on port 3128.


How can i filter destination ports requests from clients machines to
external internet with proxy intercepting this traffic on 3128 port???

Very Thanks again..

Ze Luis

>
> Hi,
>
> i have a network with squid authentication on port 3128 and acl's
> controls. My users only surf with password authentication.
>
> I don't control access port with squid acl. All ports is free by
squid.
>
> But,
>
> i need control wich ports each machine can access by iptables. Is it
> possible?
>
> My idea is :
>
> - squid do not control ports, only url_path, urlpath_regex, time,
> password.
>
> - iptables open and close ports (from internal mchines to internet)
for
> data from proxy and other (telnet, irc, ssh and all other)
>
> My question:
>
> - Is it possible.
>
> if yes:
>
> - what chain use?
> - a example, plase ;-)
>
> if no:
>
> - what's betther way to do this
>
>
> Thanks, thanks, thanks.
>
> Ze Luis


