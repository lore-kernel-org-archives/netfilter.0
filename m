From: Brice GIBOUDEAU <brice@pingus.org>
Subject: Re: insecure script
Date: Tue, 23 Mar 2004 21:49:59 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1080074999.663.51.camel@twin.pingus.org>
References: <20040323195832.0ACB83BAD18@smtp.latinmail.com>
	 <200403232017.17094.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200403232017.17094.Antony@Soft-Solutions.co.uk>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

1)
192.168.0.0 is your LAN.
3 users want to access to a server on port 8080.

iptables -t filter -A FORWARD -p tcp -s 192.168.0.0/24 --sport  
1024:65535 -d 0/0 --dport 8080 -j ACCEPT
iptables -t filter -A FORWARD -p tcp -s 0/0 --sport 8080 -d
192.168.0.0/24 --dport 1024:65535 -j ACCEPT

The 192.168.0.0/24 is dangerous because the access is open to all your
Lan and with 0/0 all the users of your Lan can access to all 8080 TCP
port on the internet, than they can install gateway, proxy, VPN with
this rule ... and an anonymous computer in your lan can use this, etc
....
    - It's better to specify the ip(s) of the computer can acces to the
service
    - It's better to specify the ip(s) of the server(s) the users want
to access.

2)
If you use NAT on your firewall, you can only NAT users in POSTROUTING
than no connection can be done from Internet to your LAN.
If you have servers who need connection initialised from the outside
(like SMTP, HTTP etc ...) you can add only this computer to your
PREROUTING.

3)
When you need to open a port to all your users to 0/0, like 80 or 443,
you can install a transparent proxy between the users and Internet, with
that you can filter all the traffic.

Brice

On Tue, 2004-03-23 at 21:17, Antony Stone wrote:
> On Tuesday 23 March 2004 7:58 pm, Jorge Garcia wrote:
> 
> > hi, im starting to write a paper about iptables security, and im trying to
> > focus in the scripts. anyone can give some examples of insecure scripts or
> > some tips to find my own insecurities in many scripts on the net. how
> > hackers can take advantages in insecurities in the scriipts??
> 
> Here's a few ideas:
> 
> 1. Don't use a default ACCEPT policy on INPUT or FORWARD chains.
> 
> 2. Don't try to "block the bad stuff and allow the rest" - always "allow what 
> you know you want, and block the rest"
> 
> 3. Use stateful matching - don't just allow packets in to high port numbers on 
> the basis that "they must be replies"
> 
> 4. Don't assume that all packets from source port 53 are DNS.
> 
> 5. Be careful about allowing all connections from internal clients to the 
> Internet - somebudy might bring a compomised laptop into your network, or 
> somebody inside the organisation might not be trustworthy.   Check for 
> suspicious outgoing traffic as well as incoming.
> 
> Regards,
> 
> Antony.


