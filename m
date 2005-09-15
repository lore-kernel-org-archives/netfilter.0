From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: Help for aplication.
Date: Thu, 15 Sep 2005 11:10:48 -0400
Message-ID: <1126797048.2624.37.camel@localhost>
References: <20050914120516.0777678A0@sankara2.bol.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050914120516.0777678A0@sankara2.bol.com.br>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: "Cristiano B. Couto" <cris_couto@bol.com.br>
Cc: netfilter@lists.netfilter.org

On Wed, 2005-09-14 at 09:05 -0300, Cristiano B. Couto wrote:
> Hi I need for help, necessary to make a incoming connection in my server,
> external connection IP validate for my internal net to have access an
> application in the hardware, this hardware in my internal net with IP
> 192,168,0,200 and it is in door 80, and is application wheel saw to browser,
> if they will be able to help I am been thank, forgives my English is that I
> am Brazilian, thank.
<snip>
I'm not sure I understand what you need.  It sounds like you have an
internal server at 192.168.0.200 and want to expose it to the world
through an iptables gateway.

If that is the case, you simply need a DNAT rule, a FORWARD rule and the
correct address bound to the public interface of the firewall unless you
want to port forward all traffic on port 80 to this internal server
on .200.  However, I would recommend that you never allow public access
to a server on your internal network.  It is FAR wiser to create a third
network on the firewall, a DMZ, put the .200 server there and firewall
it from the internal network.

Thus, you would need something like:
iptables -t nat -A PREROUTING -d 1.1.1.1 (replace with the proper
address) -i eth0 (or whatever your public interface is) -j DNAT
--to-destination 192.168.0.200
This will perform the address translation to get the packet headed
toward your internal network.  Note that I place no other restrictions
other than destination address and interface (to prevent NAT on internal
traffic) on this rule and prefer to eliminate malicious packets in the
mangle table and restrict access in the filter table.  Other may have a
different preference.

Then:
iptables -A FORWARD -d 192.168.0.200 -p 6 --dport 80 -j ACCEPT
This allows the access only on port 80.  It assumes you have a
RELATED,ESTABLISHED rule somewhere to allow the subsequent data flow.

Finally:
ip address add 1.1.1.1/24 (replace with the correct public address and
mask length) dev eth0 (replace with the correct interface) brd +
This will bind the public address for the internal server to the
firewall

If you are only port mapping, i.e., redirecting all port 80 traffic to
this server while using the firewalls public address, the first rule
becomes:
iptables -t nat -A PREROUTING -d 1.1.1.1 (replace with the firewall's
public IP address) -i eth0 (or whatever your public interface is) -j
DNAT --to-destination 192.168.0.200:80

and you do not need the last iproute2 rule.  Do NOT do this if you want
to run a web server on the firewall for some insane reason.

You may want to do some basic review of iptables.  Oskar Andreasson has
an excellent tutorial at
http://iptables-tutorial.frozentux.net/iptables-tutorial.html and there
are some slide shows on both iptables and iproute2 (a little out of
date) in the training section of the ISCS network security management
project at  http://iscs.sourceforge.net.  Hope this is what you need -
John

-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

Financially sustainable open source development
http://www.opensourcedevel.com


