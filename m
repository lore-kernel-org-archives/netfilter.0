From: Alexis <alexis@attla.net.ar>
Subject: Re: Ping and traceroute denied?
Date: Wed, 18 Feb 2004 07:52:34 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <151921888.20040218075234@attla.net.ar>
References: <40332D1F.5010806@epost.de>
Reply-To: Alexis <alexis@attla.net.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40332D1F.5010806@epost.de>
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
To: netfilter <netfilter@lists.netfilter.org>

if you have policies for INPUT, OUTPUT and FORWARD to ACCEPT, those
rules are not needed.

Also, if the traffic is generated in the same firewall FORWARD chain
will not match. Its no needed


Before you add those rules, the pings and traces was working?



Hello Nicole,

Wednesday, February 18, 2004, 6:15:11 AM, you wrote:

NH> Hi,

NH> I added this rules (with fwbuilder):

NH> $IPTABLES -A FORWARD -p icmp  -m state --state NEW  -j ACCEPT
NH> $IPTABLES -A OUTPUT -p icmp  -m state --state NEW  -j ACCEPT
NH> $IPTABLES -A INPUT -p icmp  -m state --state NEW  -j ACCEPT


NH> Why was ping from an interface of my firewall-host denied?
NH> Traceroute too.

NH> What rule shall I add?

NH> Thanks!

NH> Nicole



-- 
Best regards,
 Alexis                            mailto:alexis@attla.net.ar


