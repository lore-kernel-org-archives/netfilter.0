From: Ted Gervais <ve1drg@av.eastlink.ca>
Subject: A DNAT question.
Date: Sat, 05 Feb 2005 19:22:35 -0400 (AST)
Message-ID: <Pine.LNX.4.58.0502051918500.6532@linux>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
To: netfilter@lists.netfilter.org


I am new to this list and to iptables generally.

I have a line I am trying to translate into a current iptables line that
will work in my firewall.

' DNAT net loc:192.168.0.147 udp 5198,5199 '

If anyone could venture a thought as to how that might be translated into
a current iptables statement I would really appreicate it.

I have tried - iptables -t nat -A PREROUTING -i eth0 -d 192.168.0.1 -p tcp
--dport 5198:5199 -j DNAT --to 192.168.0.147

That doesn't appear to work so obviously I have not interpreted that line
correctly..

---
The big cities of America are becoming Third World countries.
                -- Nora Ephron


Ted Gervais
Coldbrook Nova Scotia
Canada B4R1A7

