From: "Dharmendra T." <dharmu@nsecure.net>
Subject: Re: Bridge/VPN question.
Date: 23 Jun 2004 15:00:20 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1087983028.7624.55.camel@dharmu.nsecure.net>
References: <041201c45865$cb810cf0$c10da8c0@arvmobile>
	<1087980148.7626.35.camel@dharmu.nsecure.net> 
	<200406231008.40635.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406231008.40635.Antony@Soft-Solutions.co.uk>
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
To: netfilter@lists.netfilter.org

On Wed, 2004-06-23 at 14:38, Antony Stone wrote:
> On Wednesday 23 June 2004 9:42 am, Dharmendra T. wrote:
> 
> > Hi,
> >
> > Are there any other rules you have defined? If no, this may work:
> >
> > iptables -P INPUT DROP
> > iptables -P OUTPUT DROP
> > iptables -P FORWARD DROP
> >
> > iptables -A FORWARD -o eth0 -p tcp -m tcp -d <approved mail server>
> > --dport 25 -j ACCEPT
> >  iptables -A OUTPUT -o eth0 -p tcp -m tcp -d <approved mail server>
> > --dport 25 -j ACCEPT
> 
> The above rules (if you are propsing them as a complete ruleset) are a highly 
> secure system - nothing will get through it, and nothing will get to 
> communicate with the box itself.
> 
> Why?
> 
> 1. You have a default DROP policy on FORWARD (good idea), and a rule allowing 
> packets to TCP port 25 on a specific server, but no rule allowing replies 
> back again.   Therefore no traffic gets *through* the machine.
> 
> 2. You have a default DROP policy on INPUT, and no rules in the INPUT chain 
> allowing anything at all, therefore no packets can get in (which makes the 
> rule in the OUTPUT chain allowing some packets out somewhat pointless).
> 
> Regards,
> 
> Antony.
> 
> -- 
> "Black holes are where God divided by zero."
> 
>  - Steven Wright
> 
>                                                      Please reply to the list;
>                                                            please don't CC me.
> 
> 

Yes I agree. But these rules were given assuming that the user has given
Required rulsets (Assuming means that the user can connect to the
approved mail server. Please check the last mail to which I replied).

Regards,
-- 
Dharmendra T.
Linux Security and Admin,
www.nsecure.net

This message is intended for the addressee only. It may contain
privileged or confidential information. If you have received
 this message in error, please notify the sender and destroy the message
immediately. Unauthorised use or reproduction of 
this message is strictly prohibited.


