From: Jochen Vogel <jvogel@it-sec.de>
Subject: GRE/PPTP and modules
Date: Thu, 29 Apr 2004 16:47:01 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D3DD55FDB74AD511BA5100500416368053E88A@ORION>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Received: **stripped**
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,

I did the following
$IPT -t nat -A PREROUTING -d <firewall> -p tcp --dport 1723 -i $EXT -j DNAT
--to-destination <vpn>:1723
$IPT -t nat -A PREROUTING -d <firewall> -p gre              -i $EXT -j DNAT
--to-destination <vpn>
$IPT -A FORWARD -i $EXT -o $RAS -d <vpn> -p TCP --dport 1723 -m state
--state NEW -j ACCEPT
$IPT -A FORWARD -i $EXT -o $RAS -d <vpn> -p GRE              -m state
--state NEW -j ACCEPT

Do i need any modules?

Thx for infos
jo

