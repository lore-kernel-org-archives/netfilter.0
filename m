From: "Shaun T. Erickson" <ste@smxy.org>
Subject: accessing windows resources through firewall
Date: Mon, 26 Apr 2004 13:16:35 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <408D43F3.1030002@smxy.org>
Reply-To: ste@smxy.org
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Scenario:

WinXP client one one side of iptables firewall, cannot access shares on 
samba or Win2k servers on other side of firewall. WinXP client knows 
address of WINS server on other side of firewall. All traffic is allowed 
to be forwarded in either direction, through the firewall, with these rules:

$IPTABLES -A FORWARD -i $ONRAMP_IFACE -o $DEV_IFACE -j ACCEPT
$IPTABLES -A FORWARD -i $DEV_IFACE -o $ONRAMP_IFACE -j ACCEPT

Is there anything else that I have to pass/specify/whatever to get this 
to work? It worked before the iptables system was inserted into the 
path. All other traffic is being passed successfully - just windows 
stuff isn't (though they *can* print to printers on the other side of 
the firewall). Nothing is logged when the attempt are made.

	-ste

