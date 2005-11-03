From: "Derick Anderson" <danderson@vikus.com>
Subject: RE: Troubleshooting Netfilter Firewall (performance issues)
Date: Thu, 3 Nov 2005 12:55:27 -0500
Message-ID: <FAC4E024BF776842876169173CE2F013292A@mailbox.vikus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="us-ascii"
To: "Harrison, James" <james.harrison@americancolor.com>, netfilter@lists.netfilter.org

Inline...=20

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org=20
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of=20
> Harrison, James
> Sent: Thursday, November 03, 2005 12:28 PM
> To: netfilter@lists.netfilter.org
> Subject: Troubleshooting Netfilter Firewall (performance issues)
>=20
> List,
>=20
> I am currently troubleshooting performance issues on a=20
> network that seem to indicate an issue with the firewall.
>=20
> I've been using a netfilter configuration for almost 2 years=20
> without issue, but we have been suffering through lost=20
> connections(tcp resets) when transferring files through the=20
> firewall via scp, ftp, http, and smb.
>=20
> All interfaces on the firewall and on the switches connected=20
> to the firewall appear clean.
>=20
> Can someone help me troubleshoot this to determine what might=20
> be going on?  I've used fwbuilder to build the ruleset and up=20
> until ~10/7/2005 we were not experiencing any issues whatsoever.

If you can post the output of iptables-save that might help. What kind
of NICs are you using? Are they Gigabit? What kernel? What distro?
(assuming RedHat from the sig) Have you done anything to the kernel
settings? What have you done so far to troubleshoot the problem?

> The current box is a dual processor(1400Mhz) Dell 1650:
>=20
> top says:
> top - 11:26:42 up 9 days, 10:21,  3 users,  load average:=20
> 0.05, 0.06, 0.06
> Tasks:  51 total,   1 running,  50 sleeping,   0 stopped,   0 zombie
> Cpu(s):   0.0% user,   1.0% system,   0.0% nice,  99.0% idle
> Mem:   1032992k total,   124124k used,   908868k free,    =20
> 9744k buffers
> Swap:        0k total,        0k used,        0k free,   =20
> 28660k cached

So memory isn't the issue, and I wouldn't think CPU... The firewall I
administer runs with a quarter of that RAM on a fairly busy 3mbit
(duplex) line, although it has a faster CPU.

> netstat -s says:
>=20
> Ip:
>     803083052 total packets received
>     797709786 forwarded
>     0 incoming packets discarded
>     1206740 incoming packets delivered
>     2326772 requests sent out
>     1008 outgoing packets dropped
>     11 fragments dropped after timeout
>     222078 reassemblies required
>     11467 packets reassembled ok
>     11 packet reassembles failed
>     11184 fragments received ok
>     221228 fragments created
> Icmp:
>     45 ICMP messages received
>     10 input ICMP message failed.
>     ICMP input histogram:
>         destination unreachable: 2
>         echo requests: 33
>     13281 ICMP messages sent
>     0 ICMP messages failed
>     ICMP output histogram:
>         destination unreachable: 1610
>         time exceeded: 11671
> Tcp:
>     4 active connections openings
>     114 passive connection openings
>     2 failed connection attempts
>     12 connection resets received
>     3 connections established
>     382150 segments received
>     834405 segments send out
>     10239 segments retransmited
>     0 bad segments received.
>     330 resets sent
> Udp:
>     819564 packets received
>     319 packets to unknown port received.
>     0 packet receive errors
>     1479565 packets sent
> TcpExt:
>     58 invalid SYN cookies received
>     29 TCP sockets finished time wait in fast timer
>     7 packets rejects in established connections because of timestamp
>     576 delayed acks sent
>     27 delayed acks further delayed because of locked socket
>     Quick ack mode was activated 58 times
>     181 packets directly queued to recvmsg prequeue.
>     193 of bytes directly received from prequeue
>     10144 packet headers predicted
>     4 packets header predicted and directly queued to user
>     56472 acknowledgments not containing data received
>     302400 predicted acknowledgments
>     170 times recovered from packet loss due to SACK data
>     Detected reordering 6 times using time stamp
>     4 congestion windows fully recovered
>     82 congestion windows partially recovered using Hoe heuristic
>     TCPDSACKUndo: 1
>     1035 congestion windows recovered after partial ack
>     88 TCP data loss events
>     27 timeouts after SACK recovery
>     374 fast retransmits
>     29 forward retransmits
>     8106 retransmits in slow start
>     1610 other TCP timeouts
>     5 sack retransmits failed
>     58 DSACKs sent for old packets
>     3003 DSACKs received
>     5 DSACKs for out of order packets received
>     6 connections aborted due to timeout

I looked at my output for netstat -s and see similar outputs except when
it comes to fragments and resets...

> Thanks
> --
> James Harrison RHCE
> Manager, Information Security
> AIM: harrijh1

If I were you I would monitor top during a large transfer and maybe do
an ethereal dump as well. If your two endpoint machines are both on Gbit
LAN and your firewall is 100Mbit (on a 100/1000 switch) then perhaps
your firewall NICs are getting overloaded. Every night at my company all
the servers (Gbit) back up to a local machine (100Mbit). They each have
their time window for backing up but it's common for Nagios to report an
"UNKNOWN" status for the backup server in the early morning hours. Of
course that could simply be the poor little backup server not having the
time to reply...

Derick Anderson

