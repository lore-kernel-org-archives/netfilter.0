From: "Moti Levy" <moti@flncs.com>
Subject: Can anyone please review the following rules and comment on them ?
Date: Wed, 30 Apr 2003 12:23:03 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <0f4201c30f34$c78ae330$fd01a8c0@bvg6>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

Thanks ,
Moti



iptables -t nat -A PREROUTING -d $EXTIP -p TCP -m multiport \
   --dport 25,80,110,443 -j DNAT --to $SRV_IP

 iptables -t nat -A POSTROUTING -o $EXTIF -s $LAN -j MASQUERADE
# --------------------------------------------------------------------------
--
  iptables -A INPUT -i $EXTIF -p udp -m udp -s 0/0 --sport 67:68 -j ACCEPT
  iptables -A INPUT -i $EXTIF -m state --state RELATED,ESTABLISHED -j ACCEPT

  iptables -A INPUT -i $EXTIF -p udp -m udp -s 0/0 --sport 500 -j ACCEPT
  iptables -A INPUT -i $EXTIF -p 50 -s 0/0 -j ACCEPT
  iptables -A INPUT -i $EXTIF -p 51 -s 0/0 -j ACCEPT

  iptables -A INPUT -i $EXTIF -p tcp -d $EXTIP -m multiport \
           --dport 22,25,80,110,443,8080 -j ACCEPT

  iptables -A INPUT -i $EXTIF -p ICMP -s 0/0 --icmp-type 8 -j ACCEPT
  iptables -A INPUT -i $EXTIF -p ICMP -s 0/0 --icmp-type 11 -j ACCEPT
  iptables -A INPUT -i $EXTIF -m limit --limit 5/minute -j LOG --log-prefix
"IPT->"
  iptables -A INPUT -i $EXTIF -j DROP


