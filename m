From: "Jesse Gordon" <jesseg@nikola.com>
Subject: Strange need to reboot to clear iptables of ESP rule or lack
	thereof?
Date: Tue, 11 Apr 2006 22:46:29 -0700
Message-ID: <096b01c65df4$720d5e80$5e00800a@printserver>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter <netfilter@lists.netfilter.org>

I have a Cisco PIX 501 vpn endpoint appliance sitting behind a natting 
(linux 2.4.26) iptables (v1.3.3) and I have two remote offices happily 
connecting to my PIX vpn endpoint.

I just forward the correct UDP ports in, and it all works.

Today I tried to add a third, but found that instead of forwarding packets 
like before, my iptables box would just reply to the remote office with 
this:

icmp 104: Jesse's_Public_Ip protocol 50 unreachable (According to TCPDUMP on 
a separate host running as a packet analyzer on a "hub".)(Span on a fancy 
switch, actually.)

I found that in addition to forwarding UDP ports 50,500, and a few others, 
in order to make this third VPN client work, I had to also forward ESP:

iptables -t nat -A PREROUTING -p ESP -i eth1 -d Iptables_Box_Public_IP -j 
DNAT --to 10.x.x.4

Then the packets are correctly forwarded.

But here's what I don't understand:

My firewall script is just a simple bash script -- really a list of iptables 
commands like the one shown above. It is started from /etc/rc.d/rc.local (A 
bash script which gets run as root once on every startup.)

If I put the above mentioned ESP rule in my firewall script and reboot, then 
it takes effect and works. But if I just type the rule at the command line 
as root, it enters into iptables without error -- but the packets are still 
refused with "protocol 50 unreachable."

And if I boot with the ESP rule in my startup script, then the packets are 
forwarded, and manually removing the ESP rule doesn't seem to stop the 
packages from being forwarded.

I did this experiment with the ESP rule as the last command in the script.
I cannot understand why it makes a difference whether the ESP rule is added 
as the last rule in my bootup script, or a few seconds later by my keying it 
in on the console.


In other words, if the ESP rule was in the script at boot, then the system 
works as it should regardless of whether I leave or remove the rule from the 
running iptables.

But if the rule is not in the script at bootup, then the packets are 
rejected with "protocol 50 unreachable" regardless of whether the ESP rule 
is manually added to the running iptables or not.

I seem to have to reboot to change it.

My firewall script does flush everything empty before setting up any rules:

iptables -F
iptables -Z
iptables -X
iptables -F -t nat
iptables -Z -t nat
iptables -X -t nat
iptables -F -t mangle
iptables -Z -t mangle
iptables -X -t mangle

And after those commands, iptables-save shows it as having no rules at all.


I would be most grateful for any comments on the topic!

Thanks very much,

Jesse Gordon


Nikola Engineering Inc.
224 W. Washington St.
Suite 104
Sequim, WA 98382-3371
Tel  (360)582-1051
Fax (360)582-1104




