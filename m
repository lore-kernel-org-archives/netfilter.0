From: "Luis Fernando Barrera" <luba@assist.com.gt>
Subject: ICMP question
Date: Thu, 14 Nov 2002 12:28:29 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <NABBIDJPNCAGKGOFGHBFOELFPIAA.luba@assist.com.gt>
References: <1037211234.2257.14.camel@mentor>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1037211234.2257.14.camel@mentor>
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

Hi all,

I have a RedHat 7.3 box which I use as a dual homed firewall.

One of the rules is that I allow all the ICMP traffic from one
PC in the protected LAN to the Internet.

Here it is one set of rules

iptables -A FORWARD -p ICMP -s 192.168.1.37 -m state --state
NEW,ESTABLISHED -j ACCEPT
iptables -A FORWARD -p ICMP -d 192.168.1.37 -m state --state ESTABLISHED -j
ACCEPT

I've been experiencing the problem that with this set of rules, suddenly,
the PC in the LAN cannot "ping" any hosts in the Internet. To solve the
problem
I delete all my user's chains and flush them, and I worked again.
I already asked if there is a buffer or counter that gets filled, and
someone
told me to watch the number of connections being tracked. I did that and it
seems
that the number of connections being tracked is very low (about 160).

Since the problem was a "mistery", I changed the rules to this:

iptables -A FORWARD -p ICMP -s 192.168.1.37 -j ACCEPT
iptables -A FORWARD -p ICMP -d 192.168.1.37 -j ACCEPT

These are the same rules, except that don't track the state of the
connections...

Could someone tell me what is the risk asociated to NOT to track the
connections?

One more question... Is it true that when you specify the ICMP protocol,
iptables only
applies the rule to the type 0?

thanks in advance

Luis Fernando Barrera
luba@assist.com.gt



