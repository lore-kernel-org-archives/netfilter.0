From: test@seaconindia.com
Subject: DNAT Problem
Date: Mon, 19 Apr 2004 10:37:22 +0530 (IST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1611.80.0.0.23.1082351242.squirrel@80.0.0.175>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi All

I am new to Iptables & Firewall. I have 2 servers (web & email) running
behind firewall. I have DNAT rule on my firewall, so any request hitting
on port 25, 80, 110 are DNAT to internal servers. Inturn my internal
servers (web & email) feel these requests were received from firewall ie
internal ip and can be trusted.

I want these DNAT request to be forward with their original ip address and
not as coming from firewall ip.

Please advice my firewall rule is as follows :

iptables -t nat -A PREROUTING -p tcp -i eth1 --dport 25 -j DNAT --to
192.168.0.175:25

Regards

Joel

