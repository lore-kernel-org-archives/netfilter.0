From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: ICMP firewalling on today's internet
Date: Mon, 05 Jul 2004 07:58:37 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1089028716.26529.6.camel@localhost>
References: <2E314DE03538984BA5634F12115B3A4E62E806@email1.mitretek.org>
	 <200406301557.58665.Antony@Soft-Solutions.co.uk>
	 <cc42u4$7bi$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <cc42u4$7bi$1@sea.gmane.org>
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
To: Jason Lunz <lunz@falooley.org>
Cc: netfilter@lists.netfilter.org

On Fri, 2004-07-02 at 12:36, Jason Lunz wrote:
> Antony@Soft-Solutions.co.uk said:
> > You should certainly allow ICMP through if you want traceroute to work, and 
> > you should generally allow ICMP if you want many other things to work.   If 
> > you want to block certain types of ICMP, that's fine (many people do), but 
> > don't block all ICMP.
> 
> Speaking of which, what's the consensus on appropriate ICMP filtering?
> Obviously you don't want to filter everything. But some types of ICMP
> are really archaic, and not of use anymore. (source quench? redirect?
> address mask request? Does anyone use these today? Were they ever in
> widespread use?)
> 
> And common stuff (like echo/echo reply) is abused by various malware,
> and should possibly be rate-limited. 
> 
> But looking down the list of icmp types
> (http://www.iana.org/assignments/icmp-parameters), there are several I'm
> not sure how to handle.
> 
> For a small site's common connection-tracking border firewall, for
> example, how are the following actions?
> 
> ]   0	Echo Reply				 [RFC792]
> 
> legitimate replies should be allowed in by ESTABLISHED (or RELATED?),
> otherwise block in both INPUT and FORWARD.
> 
> ]   1	Unassigned				    [JBP]
> ]   2	Unassigned				    [JBP]
> 
> block in both INPUT and FORWARD, with rate-limited logging?
> 
> ]   3	Destination Unreachable			 [RFC792]
> 
> legitimate replies should be allowed in by ESTABLISHED (or RELATED?),
> otherwise block in both INPUT and FORWARD.
> 
> ]   4	Source Quench			 	 [RFC792]
> ]   5	Redirect				 [RFC792]
> ]   6	Alternate Host Address			    [JBP]
> ]   7	Unassigned				    [JBP]
> 
> block in both INPUT and FORWARD, with rate-limited logging?
> 
> ]   8	Echo					 [RFC792]
> 
> allow both INPUT and FORWARD, but rate-limited
> 
> ]   9	Router Advertisement			[RFC1256]
> ]  10	Router Solicitation			[RFC1256]
> 
> don't know about these. They don't seem to be commonly used.
> 
> ]  11	Time Exceeded				 [RFC792]
> ]  12	Parameter Problem			 [RFC792]
> ]  13	Timestamp				 [RFC792]
> ]  14	Timestamp Reply				 [RFC792]
> ]  15	Information Request			 [RFC792]
> ]  16	Information Reply			 [RFC792]
> ]  17	Address Mask Request                     [RFC950]
> ]  18	Address Mask Reply			 [RFC950]
> 
> do any of these crop up much?
> 
> ]  19	Reserved (for Security)			   [Solo]
> ]  20-29	Reserved (for Robustness Experiment)	    [ZSu]
> 
> probably shouldn't be seeing these.  block in both INPUT and FORWARD,
> with rate-limited logging.
> 
> ]  30	Traceroute				[RFC1393]
> 
> allow outgoing?
> 
> ]  31	Datagram Conversion Error		[RFC1475]
> ]  32     Mobile Host Redirect              [David Johnson]
> ]  33     IPv6 Where-Are-You                 [Bill Simpson]
> ]  34     IPv6 I-Am-Here                     [Bill Simpson]
> ]  35     Mobile Registration Request        [Bill Simpson]
> ]  36     Mobile Registration Reply          [Bill Simpson]
> ]  37     Domain Name Request                     [RFC1788]
> ]  38     Domain Name Reply                       [RFC1788]
> ]  39     SKIP                                    [Markson]
> ]  40     Photuris                                [RFC2521]
> ]  41-255 Reserved				    [JBP]
> 
> no idea about these either.
> 
> So what would a good starting point for a good, but not heavy-handed,
> iptables icmp filter look like? maybe something like this (untested):
> 
> 	iptables -N icmp
> 	iptables -A icmp -m state --state ESTABLISHED,RELATED -j ACCEPT
> 	iptables -A icmp -i $INTERNAL_IFACE -p icmp --icmp-type echo-request -j ACCEPT
> 	iptables -A icmp -i $INTERNAL_IFACE -p icmp --icmp-type 30 -j ACCEPT
> 	iptables -A icmp -j LOG --log-prefix "iptables bad-icmp: " -m limit --limit 10/second
> 	iptables -A icmp -j DROP
> 
> 	iptables -I INPUT -p icmp -j icmp
> 	iptables -I FORWARD -p icmp -j icmp
> 
> Are there more types that should be let through?
> 
> Jason
I vary just slightly from Antony's recommendation that we use no ICMP
rules and trust all RELATED, ESTABLISHED ICMP packets.  I do rate limit
pings in case there is an unusual need for someone to allow echo
requests through.  I do drop broadcast pings.  And then, although I do
not do it in iptables, but rather sysctl, I disable redirects on the
gateway lest I be subject to someone else's compromise of my upstream
router (along with a few other things like allowing source routed
packets).
One certainly wants to allow reply time exceeded for traceroutes and I
believe non-windows stations are able to use source-quench for flow
control although I'm not entirely sure about that - John
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


