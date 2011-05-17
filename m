From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: assuming valid ESTABLISHED connections without conntrack on firewall
 active/pasive HA cluster
Date: Wed, 18 May 2011 00:47:29 +0200
Message-ID: <4DD2FB01.9080709@netfilter.org>
References: <BANLkTinsDigkLBwM+FFrWev-6WRvsVe4GQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BANLkTinsDigkLBwM+FFrWev-6WRvsVe4GQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: CeR <cer.inet@linuxmail.org>
Cc: netfilter@vger.kernel.org

Hi,

On 12/05/11 19:15, CeR wrote:
> Hi there.
> I'm working on a active/pasive HA cluster with corosync/pacemaker.
> For testing purposes, i did these test:
>=20
> CASE A: One of that test do the next:
>=20
> 1) Initialisation of a connection with a big file transfer with SCP
> across the cluster.
> 2) "halt" the primary node. All resources (pacemaker) moves to anothe=
r
> node. That's ok.
> 3) The file transfer still working. Transparent to the end user.
>=20
> CASE B: I want to be sure that the failback/failover is thanks to
> conntrackd flow's-state-replication, so
>=20
> 1) Stop the conntrackd resource. All go fine. Conntrack is not workin=
g any more.
> 2) Start the file transfer across the cluster.
> 3) Failover the node that has the IPVs. All resources moves to anothe=
r
> node (pacemaker).
> 4) The file transfer still working. Transparent to the end user.
> =BF=BF=BF=BF=BF=BF?????? WTF

That's completely possible in several cases:

* your rule-set is not stateful.
* your stateful rule-set is malformed.
* you forget to enable strict tracking.

Your testcases A and B are a good idea indeed, because you can really
test if you configured conntrackd correctly.

> In the CASE B, without the conntrackd running, I supposed that the ne=
w
> node being owner of IPVs will not have any knowlege about the state o=
f
> the flow (you know, NEW, ESTABLISHED,etc..). And this mean the
> firewall has to block the transference.
> But still transfering and the iptables rule being aplied as it where
> an ESTABLISHED connection:
>=20
> Chain FORWARD (policy DROP 42 packets, 3336 bytes)
>  pkts bytes target     prot opt in     out     source
> destination
>  741K 1075M ACCEPT     tcp  --  eth0   eth2    10.0.0.128
> 192.168.100.100     tcp spts:1024:65535 dpt:22 state NEW,ESTABLISHED
> 37498 2400K ACCEPT     tcp  --  eth2   eth0    192.168.100.100
> 10.0.0.128          tcp spt:22 dpts:1024:65535 state ESTABLISHED
>=20
> Any idea? Is this the standard behaviour of netfilter tools?
>=20
> In the IRC channel, i got this:
> [18:32] <fw> sysctl net.netfilter.nf_conntrack_tcp_loose
> [18:33] <fw> its probably one.  it must be 0 to disable pickup of
> established connections.

Yes, this is indeed a good clue.

> But in fact, i haven' t "net.netfilter.nf_conntrack_tcp_loose" nor
> "net.ipv4.netfilter.ip_conntrack_tcp_loose"

What kernel version are you using? If it's too old you may find
net.ipv4.netfilter.ip_conntrack_loose instead.

Here it is:

# ls /proc/sys/net/netfilter/nf_conntrack_tcp_loose
/proc/sys/net/netfilter/nf_conntrack_tcp_loose
# uname -a
Linux 2.6.39-rc2-09922-g0f08190 #58 SMP PREEMPT Sun May 15 17:35:57 CES=
T
2011 i686 GNU/Linux
# lsmod | grep nf_conntrack
nf_conntrack_netlink    13579  0
nfnetlink               2086  7 nfnetlink_log,nf_conntrack_netlink
nf_conntrack_ipv4       8841  0
nf_conntrack           45970  2 nf_conntrack_netlink,nf_conntrack_ipv4
nf_defrag_ipv4           867  1 nf_conntrack_ipv4

Please, take the time to read the documentation:

http://conntrack-tools.netfilter.org/testcase.html
http://conntrack-tools.netfilter.org/manual.html

Thanks.
