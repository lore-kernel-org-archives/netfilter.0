From: =?UTF-8?B?0JLQsNGB0LjQu9C40Lkg0KHQstC40YDQuNC00L7Qsg==?=
 <netspider@mail.ru>
Subject: Fedora Core 2. Port Forwarding Problems
Date: Fri, 23 Jul 2004 20:25:49 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4101D6BD.8040904@mail.ru>
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

Hello all.

I had to upgrade my border machine because previous installation had 
failed for some reason. Any attempt to modprobe any netfilter related 
modules returned "Floating point exception"

I've installed fedora core 2 and tried to reuse my old settings i 
retained from redhat9 system.

Masqeurading works fine, but when i try to do port forwarding like this
iptables -t nat -A PREROUTING -p tcp -d <domainname.com> --dport 80 -j 
DNAT --to 192.168.20.40:80
rule adds itself fine, but port 80 is not accessible from outside.

when i try to connect from outside it doesn't say connection refused, it 
dies after a timeout.
/proc/net/ip_conntrack doesn't show any presence of connection, I tried 
to send it to -j LOG & ULOG but both end up empty.

I have to restore the firewall asap. Help me figure this one out. (I 
still have the option to rollback to rh9)

p.s.
sys.net.ipv4.ip_forwarding is 1

