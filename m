From: "Bruno Borges" <brunob@fortalnet.com.br>
Subject: Managing P2P Traffic and performance
Date: Thu, 28 Aug 2003 23:57:44 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <012f01c36e03$3b190ac0$090211ac@winxp>
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

Salutations Netfilter List,

I have a firewall doing filtering and bandwidth management with CBQ, its
mangle table follows:

-- MANGLE --

Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination
CONNMARK   all  --  anywhere             anywhere           CONNMARK restore
ACCEPT     all  --  anywhere             anywhere           MARK match !0x0
LIBERADO   all  --  192.168.2.50         anywhere
LIBERADO   all  --  192.168.2.78         anywhere
LIBERADO   all  --  192.168.2.110        anywhere
LIBERADO   all  --  192.168.1.6          anywhere
DROP       udp  --  anywhere             anywhere           udp dpt:1214
P2P        all  --  anywhere             anywhere           STRING match
X-Kazaa
P2P        tcp  --  anywhere             anywhere           tcp dpt:2234
CONNMARK   all  --  anywhere             anywhere           CONNMARK save

Chain INPUT (policy ACCEPT)
target     prot opt source               destination

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
LIBERADO   all  --  anywhere             192.168.2.50
LIBERADO   all  --  anywhere             192.168.2.78
LIBERADO   all  --  anywhere             192.168.2.110
LIBERADO   all  --  anywhere             192.168.1.6

Chain LIBERADO (8 references)
target     prot opt source               destination
MARK       all  --  anywhere             anywhere           MARK set 0x0
ACCEPT     all  --  anywhere             anywhere

Chain P2P (2 references)
target     prot opt source               destination
MARK       all  --  anywhere             anywhere            TIME from 20:0
to 23:59 on Mon,Tue,Wed,Thu,Fri MARK set 0x2
MARK       all  --  anywhere             anywhere            TIME from 7:0
to 20:0 on Mon,Tue,Wed,Thu,Fri MARK set 0x1
MARK       all  --  anywhere             anywhere            TIME from 7:0
to 14:0 on Sat MARK set 0x1

-- --

That's working pretty well. Let me try do explain this:

DROP       udp  --  anywhere             anywhere           udp dpt:1214
** DROP KAZAA UDP PROBES **

P2P        all  --  anywhere             anywhere           STRING match
X-Kazaa

** MATCH KAZAA TRAFFIC -- This is necessary because KaZaa uses port 80
sometimes (what makes it look like http traffic), and the string module can
match all the KaZaa packets, looking for a KaZaa header inside the packet **

P2P        tcp  --  anywhere             anywhere           tcp dpt:2234
** SOULSEEK TOO **

ACCEPT     all  --  anywhere             anywhere           MARK match !0x0
** This line is to not proccess already marked packets

Observations:

1-) The Chain P2P is used to set the mark 1 or 2 (depending on day and hour
of day). The mark 1 is sent to a 64Kbit class on CBQ and mark 2 to 256Kbit.
These time rules doesn't match all time of week causing the P2P traffic to
flow freely in the time that it is desirable.

2-) I have another Chain called 'LIBERADO' it's for ips that I allow to use
P2P without bandwidth limiting,every time.

3-) CONNMARK (Connection Mark) is used to ensure that not only the first
packet of a KaZaa connection will be matched, but the entire connection /
file transfer.


So, I'm seeking for optimizations for these rules, suggestions of how it can
be done efficiently, has anyone tried to do it in some another way ? Any
comments ? Improvements ? Something about other P2P programs ?

What about connection track limits ?

How can I see if the use of string module is sucking my CPU power ? 'top'
shows it ?

The traffic and the number of machines passing by this firewall are
increasing and I'm seeing no sign that the firewall is in someway
overloaded.

The Internet connection will be upgraded again in the next few days, and I
will reconfigure the bandwidth for the CBQ classes (maybe 128kbit /
512kbit).


Thanks a lot, (and sorry for my english skills)


Bruno Borges.


