From: Mattia Martinello <mattia@mattiamartinello.com>
Subject: DNS
Date: Mon, 13 Jan 2003 12:52:35 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E22A883.103@mattiamartinello.com>
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

Hi all

I wish to open DNS connections and redirect it from the gateway and the 
server on the DMZ.
I tried these rules:

iptables -t nat -A PREROUTING -p tcp -i ppp0 -d [public IP] --dport 53 
-j DNAT --to [private IP]:53
iptables -A FORWARD -i ppp0 -d [private IP] -p tcp --dport 53 -j ACCEPT

iptables -t nat -A PREROUTING -p udp -i ppp0 -d [public IP] --dport 53 
-j DNAT --to [private IP]:53
iptables -A FORWARD -i ppp0 -d [private IP] -p tcp --dport 53 -j ACCEPT

But if I try to query my DNS server from the Internet my query goes in 
timeout.
The connections between [private IP] and the Internet are allowed (all 
other services work good without any problem, the only service that gets 
me some problems is DNS).

What have I to open to allow DNS connections from the gateway and the DMZ?

Thank you very much
Bye
Mattia


