From: "William L. Thomson Jr." <support@obsidian-studios.com>
Subject: Translation from ipchains to iptables
Date: 09 Apr 2003 14:59:16 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1049914757.1360.10.camel@wlt.obsidian-studios.com>
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
To: netfilter <netfilter@lists.netfilter.org>

If someone would be so kind as to help me translate the following
ipchains commands to iptables, that would be great.

Basically I need DNAT, or PAT, what ever you want to call it.
However the tricky part is that each internal IP will have at least two
external IP's. So depending upon which interface the traffic is
traversing I need it's internal IP changed to one on that interfaces
network. Confused yet?

Here are my current working ipchains commands

ip addr add 127.0.0.1/8 brd 127.0.0.255 dev lo
ip addr add 192.168.1.250/24 brd 192.168.1.255 dev eth0
ip addr add 10.1.0.2/16 brd 10.1.255.255 dev eth1
ip addr add 10.1.0.99/16 brd 10.1.255.255 dev eth1
ip addr add 10.2.0.2/16 brd 10.2.255.255 dev eth2
ip addr add 10.2.0.59/16 brd 10.2.255.255 dev eth2

ipmasqadm portfw -a -P tcp -L 10.1.0.99   443 -R 192.168.1.1    443
ipmasqadm portfw -a -P tcp -L 10.1.0.99   143 -R 192.168.1.1    143
ipmasqadm portfw -a -P tcp -L 10.1.0.99   110 -R 192.168.1.1    110
ipmasqadm portfw -a -P tcp -L 10.1.0.99    81 -R 192.168.1.1     81
ipmasqadm portfw -a -P tcp -L 10.1.0.99    80 -R 192.168.1.1     80
ipmasqadm portfw -a -P tcp -L 10.1.0.99    25 -R 192.168.1.1     25
ipmasqadm portfw -a -P tcp -L 10.1.0.99    22 -R 192.168.1.1     22
ipmasqadm portfw -a -P tcp -L 10.1.0.99    21 -R 192.168.1.1     21

ipmasqadm portfw -a -P tcp -L 10.2.0.59   443 -R 192.168.1.1    443
ipmasqadm portfw -a -P tcp -L 10.2.0.59   143 -R 192.168.1.1    143
ipmasqadm portfw -a -P tcp -L 10.2.0.59   110 -R 192.168.1.1    110
ipmasqadm portfw -a -P tcp -L 10.2.0.59    81 -R 192.168.1.1     81
ipmasqadm portfw -a -P tcp -L 10.2.0.59    80 -R 192.168.1.1     80
ipmasqadm portfw -a -P tcp -L 10.2.0.59    25 -R 192.168.1.1     25
ipmasqadm portfw -a -P tcp -L 10.2.0.59    22 -R 192.168.1.1     22
ipmasqadm portfw -a -P tcp -L 10.2.0.59    21 -R 192.168.1.1     21

ipchains -A forward -s 192.168.1.0/24 -j MASQ

I have researched this some time ago, but never came up with a solution.
I did some brief research today, but most DNAT examples I come across
are dealing with a single ip. Where as stated above for each internal
machine, I have at least two external IP's

Any help or comments is greatly appreciated.

Thank you

-- 
Sincerely,
William L. Thomson Jr.
Support Group
Obsidian-Studios, Inc.
3548 Jamestown Ln.
Jacksonville, FL 32223
Phone/Fax  904.260.2445
http://www.obsidian-studios.com


