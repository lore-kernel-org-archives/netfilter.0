From: =?ISO-8859-1?Q?Z=E9=20Lu=EDs?= <zeluis@objetivo-americana.com.br>
Subject: Re: squid and iptables
Date: Fri, 14 Jun 2002 18:16:06 -0300
Sender: netfilter-admin@lists.samba.org
Message-ID: <3D0A5D16.1020806@objetivo-americana.com.br>
References: <3A5DC36EC1506C40825C05BE65E62AEF0E7A0D@neptuno.idea.com.mx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.samba.org

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
> I don't control access port with squid acl. All ports is free by squid.
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
> - iptables open and close ports (from internal mchines to internet) for
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



