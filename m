From: Maximilian Wilhelm <max@rfc2324.org>
Subject: Unexpected (ct)state matching behaviour
Date: Tue, 7 Jun 2011 22:14:48 +0200
Message-ID: <20110607201448.GF7067@principal.rfc2324.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hi!

I'm running a netfilter firewall on a KVM hosting system which also
is the router for the IP networks. Like this:



                   ,--------------------------.
                   |                          |
internet <-- eth0 -|                          |
                   | - br0 192.168.42.1/24    |
		   `--------------------------=C2=B4

Most VMs ar connected to th bridge.

The bridge-nf-hooks are disabled via sysctl:

net.bridge.bridge-nf-call-arptables =3D 0
net.bridge.bridge-nf-call-iptables =3D 0
net.bridge.bridge-nf-call-ip6tables =3D 0


What I'm now doing is filtering the traffic to the service VMs with the=
 following ruleset:
Where 192.168.42.53 being a DNS, .25 being a MX and .70 being a monitor=
ing (Nagios, ..) machine.
(All machines have public IPs, but I mapped them to this network here.)

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               des=
tination
    0     0 ACCEPT     icmp --  *      *       0.0.0.0/0            0.0=
=2E0.0/0
    0     0 ACCEPT     all  --  *      *       0.0.0.0/0            0.0=
=2E0.0/0           ctstate RELATED,ESTABLISHED
    0     0 ACCEPT     all  --  *      eth0    192.168.42.0/24       0.=
0.0.0/0
    0     0 ACCEPT     tcp  --  *      *       192.168.42.70          0=
=2E0.0.0/0           tcp dpt:4949
    0     0 ACCEPT     tcp  --  *      *       192.168.42.70          0=
=2E0.0.0/0           tcp dpt:5666
    0     0 ACCEPT     tcp  --  *      *       192.168.42.70          0=
=2E0.0.0/0           tcp dpt:22
    0     0 services   all  --  *      *       0.0.0.0/0            0.0=
=2E0.0/0
    0     0 LOG        all  --  *      *       0.0.0.0/0            0.0=
=2E0.0/0           limit: avg 2/sec burst 5 LOG flags 0 level 4 prefix =
`forward reject: '
    0     0 REJECT     all  --  *      *       0.0.0.0/0            0.0=
=2E0.0/0           reject-with icmp-admin-prohibited

Chain services (1 references)
 pkts bytes target     prot opt in     out     source               des=
tination
    0     0 ACCEPT     udp  --  *      *       0.0.0.0/0            192=
=2E168.42.53         udp dpt:53
    0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0            192=
=2E168.42.53         tcp dpt:53
    0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0            192=
=2E168.42.25         tcp dpt:25
    0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0            192=
=2E168.42.25         tcp dpt:26
    0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0            192=
=2E168.42.25         tcp dpt:80
    0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0            192=
=2E168.42.25         tcp dpt:143
[...]

This works great in general but since the Nagios is checking the servic=
es I get some
rejected packets and I have no idea why:

=46irst, some DNS answers to queries from the MX get rejected:

forward reject: IN=3Dbr0 OUT=3Dbr0 SRC=3D192.168.42.53 DST=3D192.168.42=
=2E25 LEN=3D238 TOS=3D0x00 PREC=3D0x00 TTL=3D63 ID=3D64971 PROTO=3DUDP =
SPT=3D53 DPT=3D37743 LEN=3D218
forward reject: IN=3Dbr0 OUT=3Dbr0 SRC=3D192.168.42.53 DST=3D192.168.42=
=2E25 LEN=3D238 TOS=3D0x00 PREC=3D0x00 TTL=3D63 ID=3D64972 PROTO=3DUDP =
SPT=3D53 DPT=3D37743 LEN=3D218
forward reject: IN=3Dbr0 OUT=3Dbr0 SRC=3D192.168.42.53 DST=3D192.168.42=
=2E25 LEN=3D238 TOS=3D0x00 PREC=3D0x00 TTL=3D63 ID=3D64973 PROTO=3DUDP =
SPT=3D53 DPT=3D37743 LEN=3D218
forward reject: IN=3Dbr0 OUT=3Dbr0 SRC=3D192.168.42.53 DST=3D192.168.42=
=2E25 LEN=3D238 TOS=3D0x00 PREC=3D0x00 TTL=3D63 ID=3D64974 PROTO=3DUDP =
SPT=3D53 DPT=3D57656 LEN=3D218

And some Nagios test fail.

forward reject: IN=3Dbr0 OUT=3Dbr0 SRC=3D192.168.42.53 DST=3D192.168.42=
=2E70 LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D63 ID=3D0 DF PROTO=3DTCP SP=
T=3D4949 DPT=3D45244 WINDOW=3D5792 RES=3D0x00 ACK SYN URGP=3D0
forward reject: IN=3Dbr0 OUT=3Dbr0 SRC=3D192.168.42.25 DST=3D192.168.42=
=2E70 LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D63 ID=3D0 DF PROTO=3DTCP SP=
T=3D143 DPT=3D54878 WINDOW=3D5792 RES=3D0x00 ACK SYN URGP=3D0
forward reject: IN=3Dbr0 OUT=3Dbr0 SRC=3D192.168.42.53 DST=3D192.168.42=
=2E70 LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D63 ID=3D0 DF PROTO=3DTCP SP=
T=3D4949 DPT=3D36041 WINDOW=3D5792 RES=3D0x00 ACK SYN URGP=3D0
forward reject: IN=3Dbr0 OUT=3Dbr0 SRC=3D192.168.42.25 DST=3D192.168.42=
=2E70 LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D63 ID=3D0 DF PROTO=3DTCP SP=
T=3D143 DPT=3D47685 WINDOW=3D5792 RES=3D0x00 ACK SYN URGP=3D0
forward reject: IN=3Dbr0 OUT=3Dbr0 SRC=3D192.168.42.53 DST=3D192.168.42=
=2E70 LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D63 ID=3D0 DF PROTO=3DTCP SP=
T=3D4949 DPT=3D57860 WINDOW=3D5792 RES=3D0x00 ACK SYN URGP=3D0
forward reject: IN=3Dbr0 OUT=3Dbr0 SRC=3D192.168.42.25 DST=3D192.168.42=
=2E70 LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D63 ID=3D0 DF PROTO=3DTCP SP=
T=3D143 DPT=3D45284 WINDOW=3D5792 RES=3D0x00 ACK SYN URGP=3D0

The really confusing thing is that this only happens sometimes while th=
e rest
of the day everything works as expected. No other services running in
different VMs on the same hosts show any problems.

Any ideas what might go wrong here?

Thanks
Ciao
Max
--=20
=46ortschritt bedeutet, einen Schritt so zu machen,
da=C3=9F man den n=C3=A4chsten auch noch machen kann.
