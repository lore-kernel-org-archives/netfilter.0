From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Securing a Firewall
Date: Sat, 27 Mar 2004 07:22:58 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040327062258.49D862EA4@sterenborg.info>
References: <4064E987.8090907@imperium-noctem.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4064E987.8090907@imperium-noctem.de>
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

> How can i secure my iptables? I want to stealth all my ports 
> and i want that no ping is awnsered. If a port is stealthed 

Perhaps : iptables -P INPUT DROP
In which case you will not be able to reach your machine over the network.
But I think this is not what you want because then you wouldn't be receiving
the packets that some host *sent back to you*, in reply to your request.
To avoid this you would at least have :

iptables -P INPUT DROP
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

> can i access that port?

No. A port has to be open to accept connections to it.

If a port is filtered (in your words : stealth), nmap will show "filtered".
If a port is open and has a service listening on it, nmap will show "open".
If a port is open and has no service listening on it, nmap will show
"closed".


Gr,
Rob


