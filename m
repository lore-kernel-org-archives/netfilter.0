From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: Internal NAT Translation:
Date: Wed, 30 Jun 2004 23:18:42 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1088651922.2078.11.camel@localhost>
References: <003701c45f0d$15467890$0c02a8c0@bryanhome>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <003701c45f0d$15467890$0c02a8c0@bryanhome>
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
To: Bryan Martin <mailinglist@myplaceinspace.com>
Cc: netfilter@lists.netfilter.org

On Wed, 2004-06-30 at 21:45, Bryan Martin wrote:
> Setup looks like this
> 
>             Internet
>                  ^
> Redhat 9 iptables nat/masq    (200.200.200.200 public address = eth1;
> 192.168.2.1 private address = eth0)
>                  ^
> windows web server (192.168.2.254) | windows clients.    (all 192.168.2.X)
> 
> 
> Now the rh box is masquerading for the private boxes.  Only thing not
> standard is that any inbound http connections to the public address
> 200.200.200.200 is being dnatted to 192.168.2.254 which is the address of
> the windows server.  This is working as expected.  The problem arises when a
> internal client tries to connect to the public website.
> 
> For instance client request www.mycompany.com and DNS says go here
> 200.200.200.200 which would be correct if I was sitting on the outside
> looking in.  I need iptables to basically say if any http request comes from
> the internal network addressed to my public address dnat the public
> 200.200.200.200 to the private address.  I have tried the following without
> success.  Only other thing I know is to setup a internal DNS just so the
> internal clients get the internal address.  That would however be an extreme
> waste of resources.
> 
> -A PREROUTING -i eth1 -d 200.200.200.200 -p tcp --dport 80 -j
> DNAT --to-destination 192.168.2.254
> 
> Can someone help?
> 
> Bryan
I see a couple of potential problems here.  The simple solution is to
add SNAT rules, one that says all traffic coming from 192.168.2.254 and
going out eth1 is translated to 200.200.200.200 and the other which says
that any traffic from your internal network destined for 192.168.2.254
is translated to 200.200.200.200.  I would imagine that the PREROUTING
rule you created is working but when the web server gets the packets, it
sees the original source address, identifies the packets as belonging to
the local network and sends them directly back with it own internal
source address.  The reply packets will not be recognized since the
local workstations sent to packets to 200.200.200.200 and not
192.168.2.254.

However, I have some concerns about this architecture.  Are you allowing
public traffic into your web server and placing that web server directly
on the internal network? If so and if anyone every compromises it, they
may have free reign on your internal network.  If that server is exposed
to the Internet, I would very much recommend placing it on DMZ behind a
third NIC in your firewall.  I believe that will also take care of the
NAT problems.

Regarding split DNS, that is the approach I usually take.  Are you using
an internal DNS? If so, I assume it is not being used by the world to
locate the web server as that would create another major exposure.  You
could thus simply set it to distribute the private address of the web
server.

Hope this helps - John
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com
---
If you are interested in helping to develop a GPL enterprise class
VPN/Firewall/Security device management console, please visit
http://iscs.sourceforge.net 


