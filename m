From: Miguel Manso <mmanso@yahoo.com>
Subject: Accessing problems from the inside network
Date: Sun, 23 Mar 2003 18:05:49 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030324020549.53630.qmail@web11505.mail.yahoo.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi people,

I've a ppp0 device wich receives connections to 4 staric ips:

1) 123.123.123.101
2) 123.123.123.102
3) 123.123.123.103
4) 123.123.123.104

Now, I've this rule:

iptables -t nat -A PREROUTING -i ppp0 -d 123.123.123.101 -j DNAT --to
192.168.1.10

which redirects all the traffic from the 123.123.123.101 IP to the internal
192.168.1.10 ip.

I've masquerade activated and I thought everything was doing fine... I can
access my internal machine from outside and today, I've found i've a problem.

When I'm on the 192.168.1.10 machine and I try, let's say, a 'ssh
123.123.123.101' I can't access it. I mean, I can access ouside machines, I can
access my internal machine from the outside but from my internal network I
can't access my own machine if I refer to it using it public IP.

Any suggestion?

Thanks in advance.

=====
Miguel Manso
mmanso@yahoo.com

__________________________________________________
Do you Yahoo!?
Yahoo! Platinum - Watch CBS' NCAA March Madness, live on your desktop!
http://platinum.yahoo.com

