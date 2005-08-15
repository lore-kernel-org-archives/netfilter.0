From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: filtering ruleset help sought
Date: Mon, 15 Aug 2005 17:22:49 -0400
Message-ID: <1124140969.21025.42.camel@localhost>
References: <4300FAAD.4060305@ttienterprises.org>
	<1124138954.21025.29.camel@localhost>
	<430102F9.3070207@ttienterprises.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <430102F9.3070207@ttienterprises.org>
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
To: Barry Fawthrop <barry@ttienterprises.org>
Cc: netfilter@lists.netfilter.org

You may find it helpful to review a good tutorial on iptables.  You can
find an excellent one at
http://iptables-tutorial.frozentux.net/iptables-tutorial.html
You can also find training slide shows (slightly dated) in the training
section of the ISCS network security management project
(http://iscs.sourceforge.net).

Basically, you will need the same rules in the FORWARD chain as in the
INPUT chain.  You will also need a NAT rule, e.g., 

iptables -t nat -A POSTROUTING -o <ExternalIF> -s <Internal Network> -j
SNAT --to-source <ExternalIP>

On Mon, 2005-08-15 at 17:02 -0400, Barry Fawthrop wrote:
> Thanks John
> 
> Yes I want this machine and every other machine on the LAN to be denied 
> access to the Internet except to the sites or IPs listed
> in the allowed-hosts file
> 
> So could you help what addionional rules would I need ?
> 
> 
> 
> John A. Sullivan III wrote:
> 
> >Hmm . . .looks a little strange.  Do you want such access for this
> >specific device or for other devices on the internal network that use
> >this device as a gateway? The INPUT and OUTPUT chains will only handle
> >traffic to and from this device.
> >
> >I would suggest you use connection tracking and you may find it easier
> >to use DROP policies. Thus:
> >
> >$IPT -t filter -P INPUT DROP
> >$IPT -t filter -P OUTPUT DROP
> >$IPT -t filter -P FORWARD DROP
> >$IPT -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> >
> >Then you can allow the outbound access including the protcol:
> >
> >while read s1 s2
> >     do
> >      $IPT -t filter -A OUTPUT -s $INNET -d $s1 -p 6 --dport 80 -j ACCEPT
> >      $IPT -t filter -A OUTPUT -p icmp -s $INNET -d $s1 -j ACCEPT
> >     done < /allowed-hosts
> >  
> >
> also what is the -p 6 ???
> 
> >If you want to allow other devices to access these sites through this
> >device, you will need rules in the FORWARD chain and probably an SNAT
> >rule in the nat table POSTROUTING chain.  Good luck - John
> >  
> >
> Thanks
> Barry
> No virus found in this outgoing message.
> Checked by AVG Anti-Virus.
> Version: 7.0.338 / Virus Database: 267.10.9/72 - Release Date: 8/14/2005
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

Financially sustainable open source development
http://www.opensourcedevel.com


