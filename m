From: Jason Opperisano <opie@817west.com>
Subject: Re: MAC SOURCE
Date: Mon, 11 Jul 2005 11:05:44 -0400
Message-ID: <20050711150544.GA16345@bender.817west.com>
References: <BAY5-F14B5C5AE15C81A1871A8ABADC0@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <BAY5-F14B5C5AE15C81A1871A8ABADC0@phx.gbl>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Mon, Jul 11, 2005 at 07:58:15PM +0500, azeem ahmad wrote:
> hi list
> here is a script that i want to use to block unauthorized MACs on my 
> network. but the problem is that  its not blocking all other MACs that r 
> not specified in the script. plz help me out n telll wots the reaon of this
> ########################################################
> iptables -A INPUT -m mac --mac-source $MAC -j ACCEPT
> iptables -A FORWARD -m mac --mac-source $MAC -j ACCEPT
> iptables -A INPUT -m mac --mac-source ! 11:22:33:44:55:66 -j DROP
> iptables -A FORWARD -m mac --mac-source ! 11:22:33:44:55:66 -j DROP
> iptables -t nat -A POSTROUTING -i eth1 -j MASQUERADE
> ###################################################
> even now it is MASQUERADING all the macs that r not specified in the script.
> waiting for ur response
> Regards

i would do it this way:

  iptables -N check_mac
  iptables -A check_mac -m mac --mac-source $MAC1 -j RETURN
  iptables -A check_mac -m mac --mac-source $MAC2 -j RETURN
  # iptables -A check_mac -j LOG --log-prefix "INVALID MAC: "
  iptables -A check_mac -j DROP

  iptables -A INPUT -j check_mac
  iptables -A FORWARD -j check_mac

and then put your regular filter rules in INPUT and FORWARD after the
jump to check_mac; as only packets with either $MAC1 or $MAC2 will ever
make it out of the check_mac chain.

-j

--
"Lois: I'm sorry that Stewie ruined your books. Here, I brought
 you some of Peter's. 
 Brian: "Mr. T" by Mr. T. "T and Me" by George Poppard. "For The Last
 Time, I'm Not Mr. T" by Ving Rhames."
        --Family Guy

