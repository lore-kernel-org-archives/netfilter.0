From: Cliff Stanford <cliff@may.be>
Subject: NAT problem with iptables
Date: Sun, 07 Oct 2007 19:19:55 +0200
Message-ID: <4709153B.8060309@may.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

I have just built a Linux (Fedora 7) box to act as an ADSL router and
NAT for two private (10.0.0.0) networks.

The problem I have is that I have a PBX running Asterisk behind the
router which must connect using iax2 to a box outside of the network.
Similarly, the remote switchboard must be able to connect using iax2 to
my nat'ed PBX.

My entire iptables setup at he moment looks like this:

[root@gw ~]# iptables -L --line-numbers
Chain INPUT (policy ACCEPT)
num  target     prot opt source               destination
1    LOG        udp  --  anywhere             anywhere            udp
dpt:iax state NEW LOG level warning prefix `INPUT (NEW): '
2    REJECT     udp  --  anywhere             anywhere            udp
dpt:iax state NEW reject-with icmp-port-unreachable
3    LOG        udp  --  anywhere             anywhere            udp
dpt:iax LOG level warning prefix `INPUT: '

Chain FORWARD (policy ACCEPT)
num  target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
num  target     prot opt source               destination
[root@gw ~]# iptables -t nat -L --line-numbers
Chain PREROUTING (policy ACCEPT)
num  target     prot opt source               destination
1    LOG        udp  --  anywhere             anywhere            udp
dpt:iax LOG level warning prefix `NAT: '
2    DNAT       udp  --  anywhere             anywhere            udp
dpt:iax to:10.20.30.14
3    DNAT       tcp  --  anywhere             anywhere            tcp
dpt:http to:10.20.30.33
4    DNAT       tcp  --  anywhere             anywhere            tcp
dpt:ms-wbt-server to:10.20.30.74
5    DNAT       tcp  --  anywhere             anywhere            tcp
dpt:printer to:10.20.30.63
6    DNAT       tcp  --  anywhere             anywhere            tcp
dpt:x11 to:10.20.30.74

Chain POSTROUTING (policy ACCEPT)
num  target     prot opt source               destination
1    SNAT       all  --  anywhere             anywhere
to:217.125.3.73

Chain OUTPUT (policy ACCEPT)
num  target     prot opt source               destination
[root@gw ~]#

I would expect all NEW UDP packets coming in on port 4569 (iax) to be
redirected to 10.20.30.14 after being logged as NAT: and subsequent
packets to be redirected via conntrack but not to be logged.

In practice, I am getting a continual stream of the INPUT: log messages:

Oct  7 18:48:35 gw kernel: INPUT (NEW): IN=atm0 OUT=
MAC=aa:aa:03:00:00:00:08:00 SRC=194.70.36.201 DST=217.125.3.73 LEN=40
TOS=0x00 PREC=0x00 TTL=53 ID=0 DF PROTO=UDP SPT=4569 DPT=4569 LEN=20
Oct  7 18:49:15 gw last message repeated 4 times
Oct  7 18:50:16 gw last message repeated 7 times
Oct  7 18:51:35 gw last message repeated 7 times

The output from conntrack is:

[root@gw ~]# conntrack -L -s 194.70.36.201
udp      17 23 src=194.70.36.201 dst=217.125.3.73 sport=4569 dport=4569
packets=1332 bytes=53280 [UNREPLIED] src=217.125.3.73 dst=194.70.36.201
sport=4569 dport=4569 packets=0 bytes=0 mark=0 use=1
[root@gw ~]# conntrack -L -d 194.70.36.201 -s 10.20.30.14
udp      17 122 src=10.20.30.14 dst=194.70.36.201 sport=4569 dport=4569
packets=701 bytes=36932 src=194.70.36.201 dst=217.125.3.73 sport=4569
dport=1024 packets=491 bytes=28742 [ASSURED] mark=0 use=1

The second row is the outbound IAX which is working fine.  So it
definitely seems that this rule is not working:

iptables -A PREROUTING -p udp -m udp --dport 4569 -j DNAT
- --to-destination 10.20.30.14

I assume I'm missing something and hope someone on this list can see
what it is.  I'd be very grateful.

Apologies for the long lines and thanks in anticipation.

Cliff.
- --
Cliff Stanford
Might Limited                           +44 845 0045 666 (Office)
Suite 67, Dorset House                  +44 7973 616 666 (Mobile)
Duke Street, Chelmsford, CM1 1TB
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFHCRU7fNTx9pWyKfwRAjCEAKCzJhGCBo6S0nihOnGXfHYOZm2qlgCdEE1m
5qSLGOpzFu8d/xBi0QaLDBE=
=mKh0
-----END PGP SIGNATURE-----

