From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Rejecting Ident (Auth) requests...
Date: Mon, 02 May 2005 02:28:13 -0500
Message-ID: <4275D68D.8040207@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

There was some talk on the list a while back about the merit of DROPing verses REJECTing Ident (Auth) requests at the firewall in response to outbound SMTP traffic.  I responded to the post (https://lists.netfilter.org/pipermail/netfilter/2005-April/060091.html) stating that I thought it would be possible to write some rules that would watch the outbound SMTP traffic and add entries to a recent list that would subsequently be checked by inbound Ident (Auth) traffic and REJECTed if it was on the recent list or silently DROPed if it was not on the recent list.  Well I have just had the time to play with this and I got it working.  I wanted to share this with the list for any one to benefit from.  Sorry if this is not a common practice her.  I think it would be a good idea, if not let me know and I'll not do such in the future.

Below are the iptables rules that I used to implement this feature.

iptables -t filter -A INPUT -i $INet -d $INet_IP -p tcp --dport 113 -m recent --name Outbound_SMTP --rcheck --seconds 3600 -j REJECT
iptables -t filter -A FORWARD -i $LAN -o $INet -s $LAN_Subnet -p tcp --dport 25 -m recent --name Outbound_SMTP --set --rdest -j ACCEPT
iptables -t filter -A FORWARD -i $LAN -o $INet -s $LAN_Subnet -p tcp --dport 587 -m recent --name Outbound_SMTP --set --rdest -j ACCEPT
iptables -t filter -A OUTPUT -o $INet -s $INet_IP -p tcp --dport 25 -m recent --name Outbound_SMTP --set --rdest -j ACCEPT
iptables -t filter -A OUTPUT -o $INet -s $INet_IP -p tcp --dport 25 -m recent --name Outbound_SMTP --set --rdest -j ACCEPT

The first rule is what will match against the Outbound_SMTP recent list to see if traffic Ident (Auth) traffic should be rejected.  If the traffic is not explicitly REJECTed it will continue traversing the chains(s) and have the default policy applied to it if there is not some other rule that explicitly acts on it.

The second and third rules are what add the destination of the SMTP / source of Ident (Auth) traffic to the Outbound_SMTP recent list for both port 25 and the alternant MUA submission port for LAN generated traffic.

The fourth and fifth rules are what add the destination of the SMTP / source of Ident (Auth) traffic to the Outbound_SMTP recent list for both port 25 and the alternant MUA submission port for locally generated (on the firewall / router) traffic.

Any comments or questions are welcome.  :)



Grant. . . .

