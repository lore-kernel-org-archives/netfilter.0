From: Pavlos Parissis <p_pavlos@freemail.gr>
Subject: About limit
Date: Fri, 1 Nov 2002 21:38:05 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021101213805.45bf3891.p_pavlos@freemail.gr>
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

Hello all,
I read today the thread "next topic:  --limit and --burst-limit" and some
thoughts came up
about my rules.
I have the followings :
-A internet-firewall -p icmp -m icmp --icmp-type 8 -m limit --limit 30/min
-j ACCEPT
-A internet-firewall -p icmp -m icmp --icmp-type 8 -m limit --limit 1/min
-j LOG --log-prefix "PoD attack! " --log-level 6
-A internet-firewall -p icmp -m icmp --icmp-type 8 -j DROP
SO with the rule 1 i accept only 30 packets per minute
with second rule i logged only the next 30 packets,actually only
the first of the 30 packtes.
and the third rule drops the next 30 packets.
I just want to allow only 30 packets per minute and log only 1 dropped
packet per limit.
So do i do what i want?

Thanks in advance,
Pavlos


-- 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
I love having the feeling of being in control
while i have the sensation of speed

The surfer of life
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


