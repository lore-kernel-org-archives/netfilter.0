From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Filtered Port
Date: Tue, 31 Jan 2006 19:26:54 +0100
Message-ID: <001101c62693$e95d6d60$0101000a@sterenborg.info>
References: <OF97E2A442.CD46230A-ONC2257107.00555AB7-C2257107.0055F0E2@gunessigorta.com.tr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <OF97E2A442.CD46230A-ONC2257107.00555AB7-C2257107.0055F0E2@gunessigorta.com.tr>
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
To: Netfilter <netfilter@lists.netfilter.org>

> I have another rule after preouting,   postrouting snat (for
> the firewall
> itself) for that purpose. Packets coming from outside going to inside
> machine as from firewall machine.
> 
> May be helps.

If you accept ESTABLISHED (and RELATED for simplicity and other
functionality) you don't have to ; only a PREROUTING will do the trick.
What I mean is this :

$ipt -P FORWARD DROP
$ipt -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
$ipt -A FORWARD -m state --state NEW -i <if_inet> -o <if_lan> \
  -d <ip_rdp_host> -p tcp --dport 3389 -j ACCEPT
$ipt -t nat -A PREROUTING -i <if_inet> -p tcp --dport 3389 \
  -j DNAT --to <ip_rdp_host>

Robby Workman also has a point : does "iptables -nvL" show packetcount
for these rules. Maybe the packets never reach the iptables firewall, or
maybe there is some other rule blocking rdp traffic before it can be
accepted.


Gr,
Rob


