From: Daniel Chemko <dchemko@smgtec.com>
Subject: Re: SNAT
Date: Sun, 06 Apr 2003 14:49:18 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E90A0DE.5020807@smgtec.com>
References: <7C9884991ADAE0479C14F10C858BCDF5122DAF@alderaan.smgtec.com> <00f101c2fc2a$91158d90$6401a8c0@server>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00f101c2fc2a$91158d90$6401a8c0@server>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Rio Martin." <rio@martin.mu>
Cc: netfilter@lists.netfilter.org

Rio Martin. wrote:

>Okay,
>I add another interface so that make looks like this:
>eth0    = 64.1.1.1
>eth0:1 = 192.168.1.1
>eth1 = 64.1.1.2
>
>also add iptables command:
># /sbin/iptables -t nat -A POSTROUTING -p tcp -s 192.168.1.0/24 --dport
>6667 -j SNAT --to 64.1.1.2
>
>but still doesnt work, all users from 192.168.1.0/24 still irc using
>64.1.1.1
>need help.
>
>Regards,
>Rio Martin.
>
>
>
>----- Original Message -----
>From: "Daniel Chemko" <dchemko@smgtec.com>
>To: "Rio Martin." <rio@martin.mu>; <netfilter@lists.netfilter.org>
>Sent: Friday, April 04, 2003 1:34 AM
>Subject: RE: SNAT
>
>
>1. You are using aliases, which IPTables does not use. Please use look
>into IPRoute2 on the net on how to setup proper IPRoute2 bindings.
>
>2. Add an SNAT rule on the postrouting -o <internet_iface> pointing to
>64.1.1.2
>
>-----Original Message-----
>From: Rio Martin. [mailto:rio@martin.mu]
>Sent: Thursday, April 03, 2003 2:29 AM
>To: netfilter@lists.netfilter.org
>Subject: SNAT
>
>Dear folks,
>I need help to modify the source ip for every irc connection coming from
>my
>clients.
>
>Eg:
>
>eth0    = 64.1.1.1
>eth0:1 = 64.1.1.2
>eth0:2 = 192.168.1.1
>
>
>My clients is in 192.168.1.0/24. Right now all connection to irc server
>is
>using ip 64.1.1.1
>I want to modify, so all irc connection is using 64.1.1.2
>
>Thanks for helping me ...
>
>Regards,
>Rio Martin.
>
>
>
>
>
>
>
>  
>
*slaps his own  head* of course it does! Keep that rule in, but you have 
to mangle the packet route. If you have the ROUTE jump target, you can 
use that to explicitly use that to accomplish what you desire, making 
sure to apply your above rule to the outgoing interface, so just adding 
-o eth1 to your previously described rule.

Unfortunately, I have never personally used the ROUTE target so I am not 
sure the syntax. I think it would be something like:
iptables -t nat -A PREROUTING -p tcp --source 192.168.1.0/24 --dport 
6667 -j ROUTE --iface eth1
iptables -t nat -A POSTROUTING -o eth1 -p tcp --source 192.168.1.0/24 
--dport 6667 -j SNAT --to 64.1.1.2

You might need Patch-O-Matic to get the ROUTE option.


