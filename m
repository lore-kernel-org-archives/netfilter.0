From: Andreas Meyer <anmeyer@anup.de>
Subject: iptables and redirects
Date: Mon, 10 Feb 2003 12:12:16 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030210111216.D8E2717D3A@delta.meyer.home>
Reply-To: anmeyer@anup.de
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

Hello!

I have problems getting PREROUTING to work.
I defined to simple rules:

iptables -t nat -A PREROUTING -i $loc -p TCP --sport 1024: \
                  --dport 80  -j DNAT --to 192.168.1.3:3128
iptables -t nat -A PREROUTING -i $loc -p TCP --sport 1024: \
                  --dport 110 -j DNAT --to 192.168.1.75:110

The connection with Netscape accesing the firewall-host times out.
Squid is configured as accelerator to 192.168.1.3.

A telnet to the firewall-host on port 110 (mailseerver) times out too.
Tried to add forwarding:

iptables -A FORWARD -p TCP -d 192.168.1.75  --dport 3128 -j ACCEPT
iptables -A FORWARD -p TCP -d 192.168.1.75  --dport 110 -j ACCEPT

No luck. What am I missing? No entries in the logs, nothing.
Just found one:
kernel: host 192.168.1.3/if2 ignores redirects for 192.168.1.75 to 192.168.1.75

Is this a kernel thing? As long as I don't redirect to another host
iptables are working.

Can someone help? Absolutly frustrated....

-- 

  Andreas Meyer

Object Class   Common Name   userPassword
posixAccount   andreas       {SSHA}hpyqObx1/BXbKFgXoqCayoGsvIgPYiVc

