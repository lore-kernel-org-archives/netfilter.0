From: Daniel Chemko <dchemko@smgtec.com>
Subject: Re: IPTABLES Nightmare - Save Me
Date: Mon, 04 Aug 2003 17:22:12 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F2EF8B4.9090303@smgtec.com>
References: <3F2EEFA2.4040208@flashmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F2EEFA2.4040208@flashmail.com>
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
To: dalive@flashmail.com
Cc: netfilter@lists.netfilter.org

The input chain is only used for packets destined for the firewall 
itself. If the NAT tells the firewall that the packets are going to pass 
through the machine to another conputer, the FORWARD chain is thn passed 
through, NOT the INPUT.


Option 1.

Change:
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 8080 -j ACCEPT

To:
$IPTABLES -A FORWARD -p TCP -s 0/0 --dport 8080 -j ACCEPT

Option 2.
What you are really looking for is to direct traffic from the FORWARD 
chain to the tcp_packets chain:

$IPTABLES -A FORWARD -p tcp -j tcp_packets



