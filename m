From: "Contact" <contact@netscan.ca>
Subject: RE: Iptables
Date: Tue, 28 Sep 2004 04:19:48 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <MAIL5urjNnTNG33J7pq00000024@mail.netscan.ca>
References: <20040928052524.ABB11E2C@sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040928052524.ABB11E2C@sterenborg.info>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: 'Rob Sterenborg' <rob@sterenborg.info>, netfilter@lists.netfilter.org.

This helps a bit, but still way out of my league - there is a lot of stuff
to remember. In the many sites, including the one you list below, they talk
of various configurations before ever getting to the rules - is this
necessary?

i.e.

INET_IP="194.236.50.155"
INET_IFACE="eth0"
INET_BROADCAST="194.236.50.255"

LAN_IP="192.168.0.2"
LAN_IP_RANGE="192.168.0.0/16"
LAN_IFACE="eth1"

Then a bunch of modules are loaded....

Are <if_lan>, <net_lan> and <if_inet> reserved commands or do I need to put
something in here. I am assuming these are variables and tie in with the
above - not sure though.

Note: All the other LAN clients have access to the internet via the Linksys
router as does the Linux box. The router is my gateway....

One last thing. Is there a way to block an entire domain i.e. domain.com or
an entire IP block i.e 24.168.1.0/24.

Thanks

> -----Original Message-----
> From: Rob Sterenborg [mailto:rob@sterenborg.info] 
> Sent: September 28, 2004 1:25 AM
> To: 'Contact'; netfilter@lists.netfilter.org.
> Subject: RE: Iptables 
> 
> netfilter-bounces@lists.netfilter.org wrote:
> > Hi,
> > 
> > I'm new to iptables and having a problem grasping the 
> concept as well 
> > as the syntax. I have read a lot of sites on this but just 
> not getting 
> > it. First - running rules. From what I can gather I need to have an 
> > rc.firewall file with the various rules and such in it - and
> 
> The filename depends on your system and/or what you define to 
> be a startup script.
> 
> > have this started at boot. Am I close?  Second - the 
> syntax. I want to 
> > be able to allow my local LAN full access to the Linux box 
> (Slackware 
> > 10). I also have a website which I want to allow everyone
> 
> Ah. Slack. Yes, if you put a rc.firewall file in /etc/rc.d 
> and do a "chmod 700 rc.firewall" there, it will start at boot 
> (if I read rc.inet2 correctly).
> 
> > - except for a few domains and IP's, SSH which I want to allow only 
> > certain IP's or domains, and Samba which I want to allow 
> only my local 
> > LAN. This is where I'm really confused putting this all 
> together. If 
> > someone could explain this in plain english - or put me on 
> to a really 
> > easy iptables for dummies type site, it would be appreciated.
> > 
> > This box is behind attached to a Linksys router and does 
> not act as a 
> > NAT. It is just a simple little setup on a p166.
> 
> Okay. You want to close your box as much as possible :
> iptables -P INPUT DROP
> iptables -P FORWARD DROP
> iptables -P OUTPUT ACCEPT # because in the beginning it will cause \
>                           # you headaches if you DROP this
> 
> Next, allow related and established connections :
> iptables -A INPUT -m state --state RELATED,ESTABLISHED -j 
> ACCEPT iptables -A FORWARD -m state --state 
> RELATED,ESTABLISHED -j ACCEPT
> 
> Allow full access from LAN :
> iptables -A INPUT -i <if_lan> -s <net_lan> -j ACCEPT
> 
> Allow access to website (running on the firewall box I assume) :
> iptables -A INPUT -i <if_inet> -s <ip_to_deny> -p tcp --dport 80 \
>          -j DROP
> ...Repeat for any disallowed host...
> iptables -A INPUT -i <if_inet> -p tcp --dport 80 -j ACCEPT
> 
> Allow access to SSH :
> iptables -A INPUT -i <if_inet> -s <ip_allowed_host> -p tcp \
>          --dport 22 -j ACCEPT
> ...Repeat for any allowed host...
> 
> You already opened up your box for your LAN. That includes 
> Samba so you don't need a rule for this.
> 
> Do you also want internet access for your LAN clients ?
> iptables -A FORWARD -i <if_lan> -o <if_inet> -s <net_lan> \
>          -j ACCEPT
> iptables -t nat -A POSTROUTING -o <if_inet> -s <net_lan> \
>          -j SNAT --to-source <ip_inet>
> 
> 
> A good reading site includes Oskar's :
> http://iptables-tutorial.frozentux.net/iptables-tutorial.html
> 
> 
> Gr,
> Rob
> 
> 




