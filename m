From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: NAT question (forwarding with subdomains)
Date: Thu, 13 May 2004 14:17:03 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1084472223.28188.33.camel@localhost>
References: <20040513172702.17791.51996.Mailman@vishnu.netfilter.org>
	 <55621.200.107.22.222.1084470741.squirrel@www.easyteck.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <55621.200.107.22.222.1084470741.squirrel@www.easyteck.com>
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
To: pbernal@easyteck.com
Cc: netfilter@lists.netfilter.org

On Thu, 2004-05-13 at 13:52, Paul F. Bernal B. - EasyTeck wrote:
> Hi!,
> 
> I got an internal 192.168.0.0/24 LAN with about 5 web servers including
> the one which has iptables running and internet output ...
> 
> in the firewall script:
> * INTERNALIF="eth1"
> * INTERNALNET="192.168.0.0/24"
> * INTERNALBCAST="192.168.0.255"
> * EXTERNALIF="eth0"
> * MYADDR="200.107.XXX.XXX"
> 
> got a rule that works fine that forwards the mail packets to the
> 192.168.0.2 machine:
> $IPTABLES -A PREROUTING -t nat -i $EXTERNALIF -p tcp -d $MYADDR --dport 25 \
>                       -j DNAT --to 192.168.0.2:25
> $IPTABLES -A FORWARD -i $EXTERNALIF -p tcp -d 192.168.0.2 --dport 25 -j
> ACCEPT
> 
> I have a couple subdomains pointing to MYADDR sub1.mydomain.com,
> sub2.mydomain.com, etc...
> 
> What I need to do is:
> 
> When someone in the Internet asks for http://sub1.mydomain.com/ respons
> the 192.168.0.3 machine (wich has a web server running port 80)
> 
> When someone in the Internet asks for http://sub2.mydomain.com/ responds
> the 192.168.0.4 machine (wich has a web server running port 80)
> 
> etc., etc., etc...
> 
> I've tried something like this, but doesn't works !!!
> 
> $IPTABLES -A PREROUTING -t nat -i $EXTERNALIF -p tcp -d sub1.mydomain.com
> --dport 80 \
>                       -j DNAT --to 192.168.0.3:80
> $IPTABLES -A FORWARD -i $EXTERNALIF -p tcp -d 192.168.0.3 --dport 80 -j
> ACCEPT
> 
> Pliz give me a hand on this, thanks in advance ...
> 
> ----------
> don pool
If I understand you correctly, sub1.mydomain.com and sub2.mydomain.com
both point to the same public address even though you want them to map
to different internal servers.  Publicly, they are only distinguished by
url and not IP.  Is that correct?

If so, iptables will resolve the names to IP addresses when it loads. 
From then on, it will use the IP address to identify the destination and
not the url.  If you want to NAT on the url, you will need some
functionality to read the url from the data portion of the packet and
not the IP portion.  I do not know if there is a iptables patch
available to do that or how such a patch would be used.  Does anyone
else know?
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


