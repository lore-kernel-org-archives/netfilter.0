From: "Bo Jacobsen" <subs@systemhouse.dk>
Subject: Fw: iptables-save/restore question
Date: Tue, 17 Sep 2002 12:09:50 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <006b01c25e32$5ede5500$6307a8c0@net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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

HI,  I have tried the following:

I run some iptables commands then run iptables -L -n > testfile1 to save =
the setup.
Then I run iptables-restore testfile1 and than run iptables-save again:
iptables -L -n > testfile2

When I run diff on the two files (testfile1, testfile2) I can see that =
they are NOT the same.
In the following is an example of what diff finds different:

104,105c104,105
< ACCEPT     tcp  --  192.168.7.0/24       0.0.0.0/0          state =
NEW,ESTABLISHED tcp spts:1024:65535 dpt:53
< ACCEPT     tcp  --  0.0.0.0/0            192.168.7.0/24     state =
ESTABLISHED tcp spt:53 dpts:1024:65535
---
> ACCEPT     tcp  --  192.168.7.0/24       0.0.0.0/0          tcp =
spts:1024:65535 dpt:53 state NEW,ESTABLISHED
> ACCEPT     tcp  --  0.0.0.0/0            192.168.7.0/24     tcp spt:53 =
dpts:1024:65535 state ESTABLISHED

The first two lines are after running the iptables commands directly.
The result of the two command semantics are of course the same, but why =
is this happening.

The reason we want to make this test is that we need to be sure that the =
rules generated directly by
the iptables commands, are EXATLY the same as what the =
iptables-save/restore command pair does.

One thing is to test that the iptable commands works, another is to =
blindly trust that our 300 iptable rules
are correctly saved and restored by iptables-save/restore (a firewall =
with 4 different local lans).
If there is another way of confirming iptables-save/restore results, I =
would appreciate some info.


Thanks in advance
Bo Jacobsen




