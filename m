From: "Joe de Vera Jr." <jhoedv@we-amuse.com>
Subject: Re: Iptables Problem on DNS Server
Date: Sat, 22 Jun 2002 21:01:26 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <001201c21a6a$a6f45080$6500a8c0@systemsadmin>
References: <20020622003205.C81D44808@lists.samba.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

here's my ruleset in my machine... seen anything wrong or lacking here?

just to remind you guys my problem is that.. when my firewall is running my
DNS don't work... thanks!

Chain INPUT (policy DROP)
target     prot opt source               destination
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0          state
RELATED,ESTABLISHED
ACCEPT     tcp  --  216.138.0.0/16       0.0.0.0/0          tcp dpt:21
ACCEPT     tcp  --  216.138.0.0/16       0.0.0.0/0          tcp dpt:22
ACCEPT     tcp  --  216.138.0.0/16       0.0.0.0/0          tcp dpt:110
ACCEPT     tcp  --  216.208.0.0/16       0.0.0.0/0          tcp dpt:21
ACCEPT     tcp  --  216.208.0.0/16       0.0.0.0/0          tcp dpt:22
ACCEPT     tcp  --  216.208.0.0/16       0.0.0.0/0          tcp dpt:110
ACCEPT     tcp  --  196.40.0.0/16        0.0.0.0/0          tcp dpt:21
ACCEPT     tcp  --  196.40.0.0/16        0.0.0.0/0          tcp dpt:22
ACCEPT     tcp  --  196.40.0.0/16        0.0.0.0/0          tcp dpt:110
ACCEPT     tcp  --  203.87.0.0/16        0.0.0.0/0          tcp dpt:21
ACCEPT     tcp  --  203.87.0.0/16        0.0.0.0/0          tcp dpt:22
ACCEPT     tcp  --  203.87.0.0/16        0.0.0.0/0          tcp dpt:110
ACCEPT     tcp  --  24.100.0.0/16        0.0.0.0/0          tcp dpt:21
ACCEPT     tcp  --  24.100.0.0/16        0.0.0.0/0          tcp dpt:22
ACCEPT     tcp  --  24.100.0.0/16        0.0.0.0/0          tcp dpt:110
DROP       tcp  --  0.0.0.0/0            0.0.0.0/0          tcp dpt:21
DROP       tcp  --  0.0.0.0/0            0.0.0.0/0          tcp dpt:22
DROP       tcp  --  0.0.0.0/0            0.0.0.0/0          tcp dpt:110
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0          tcp dpt:80 state
NEW
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0          tcp dpt:21 state
NEW
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0          tcp dpt:25 state
NEW
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0          tcp dpt:22 state
NEW
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0          tcp dpt:53 state
NEW
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0          tcp dpt:3306
state NEW
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0          tcp dpt:110
state NEW
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0          tcp dpt:1127
state NEW
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0          tcp dpt:2047
state NEW
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0          tcp dpt:5012
state NEW
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0          tcp dpt:6563
state NEW
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0          tcp dpt:6564
state NEW
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0          tcp dpt:7012
state NEW
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0          tcp dpt:7017
state NEW
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0          tcp dpt:7019
state NEW
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0          tcp dpt:7021
state NEW
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0          tcp dpt:8000
state NEW
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0          tcp dpt:8007
state NEW
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0          tcp dpt:8010
state NEW
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0          tcp dpt:8080
state NEW
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0          tcp dpt:10000
state NEW
REJECT     tcp  --  0.0.0.0/0            0.0.0.0/0          reject-with
tcp-reset
REJECT     udp  --  0.0.0.0/0            0.0.0.0/0          reject-with
icmp-port-unreachable

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination


