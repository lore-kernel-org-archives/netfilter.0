From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: max-src-conn-rate (Connection rate throttling per IP)
Date: Tue, 30 Aug 2005 18:03:14 -0500
Message-ID: <4314E5B2.6040309@riverviewtech.net>
References: <200508301440.59667.benoit.panizzon@imp.ch>
	<4314590F.7050804@toxicnet.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4314590F.7050804@toxicnet.de>
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
To: netfilter@lists.netfilter.org

Sascha Reissner wrote:
> iptables -I INPUT -i <interface> -p <protocol> --dport <port> -m state
> --state NEW -m recent --set
> iptables -I INPUT -i <interface> -p <protocol> --dport <port> -m state
> --state NEW -m recent --update --seconds 60 --hitcount 3 -j DROP
> Okay you might run into problems if people use forged source ip adresses
> since this would also block _new_ connection requests from this ip.
> 
> If someone has a smarter idea - let me know.

Why don't you add the "--rttl" parameter to the recent match extension.  Here is a quote from "iptables -m recent -h" output explaining it "For check and update commands above.  Specifies that the match will only occur if the source address and the TTL match between this packet and the one which was set.  Useful if you have problems with people spoofing their source address in order to DoS you via this module."



Grant. . . .

