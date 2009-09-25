From: Thomas.Hluchnik@netcologne.de
Subject: NAT wont work for my OpenVPN
Date: Fri, 25 Sep 2009 15:40:09 +0200
Message-ID: <200909251540.21114.Thomas.Hluchnik@netcologne.de>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1301134.PnX9stbhso";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

--nextPart1301134.PnX9stbhso
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

I am a bit new to ipfilter stuff and didnt succeed in forwarding my OpenVPN traffic. Maybe someone is able to tell me the iptables commands.

Situation: I got a dedicated Rootserver with one network interface. Some days ago I setup a OpenVPN server (IP-Range 10.47.11.0/24) on that box which works for itself. At home I have a OpenVPN client connected to the server, which works, too. I can ping the tun Interface of the server, I can login through the VPN channel on the server and I can dig @tun-interface any-domain.

The routing table of my client shows the default gateway is VPN:

client:~ # netstat -rn
Kernel IP routing table
Ziel            Router          Genmask         Flags   MSS Fenster irtt Iface
10.47.11.1      10.47.11.5      255.255.255.255 UGH       0 0          0 tun0
61.169.136.161  192.168.1.64    255.255.255.255 UGH       0 0          0 eth2 # my DSL-Box internal IP
10.47.11.5      0.0.0.0         255.255.255.255 UH        0 0          0 tun0
192.168.128.0   0.0.0.0         255.255.255.0   U         0 0          0 eth2
192.168.1.0     0.0.0.0         255.255.255.0   U         0 0          0 eth2
169.254.0.0     0.0.0.0         255.255.0.0     U         0 0          0 eth2
127.0.0.0       0.0.0.0         255.0.0.0       U         0 0          0 lo
0.0.0.0         10.47.11.5      0.0.0.0         UG        0 0          0 tun0


My problem: at the server there has to be set a FORWARD rule to NAT all traffic and send it to the default gateway. I dont get this to work. Anybody out the who can explain my fault and tell me the right iptable commands? Thanks in advance for any help.

server:~ # netstat -rn
Kernel IP routing table
Destination     Gateway         Genmask         Flags   MSS Window  irtt Iface
10.47.11.2      0.0.0.0         255.255.255.255 UH        0 0          0 tun0
61.169.136.1    0.0.0.0         255.255.255.255 UH        0 0          0 eth0
10.47.11.0      10.47.11.2      255.255.255.0   UG        0 0          0 tun0
169.254.0.0     0.0.0.0         255.255.0.0     U         0 0          0 eth0
127.0.0.0       0.0.0.0         255.0.0.0       U         0 0          0 lo
0.0.0.0         61.169.136.1    0.0.0.0         UG        0 0          0 eth0

server:~ # ifconfig tun0
tun0      Link encap:UNSPEC  HWaddr 00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00
          inet addr:10.47.11.1  P-t-P:10.47.11.2  Mask:255.255.255.255
          UP POINTOPOINT RUNNING NOARP MULTICAST  MTU:1500  Metric:1
          RX packets:3601 errors:0 dropped:0 overruns:0 frame:0
          TX packets:3514 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:100
          RX bytes:163083 (159.2 Kb)  TX bytes:144786 (141.3 Kb)

server:~ # ifconfig eth0
eth0      Link encap:Ethernet  HWaddr 00:0E:A6:76:C4:36
          inet addr:61.169.136.161  Bcast:61.169.136.161  Mask:255.255.255.255
          inet6 addr: fe80::20e:a6ff:fe76:c436/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:2833852643 errors:0 dropped:0 overruns:0 frame:0
          TX packets:2928710841 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:1070053355 (1020.4 Mb)  TX bytes:1932364652 (1842.8 Mb)


The iptables output:

server:~ # iptables -L
Chain INPUT (policy DROP)
target     prot opt source               destination
ACCEPT     all  --  anywhere             anywhere            state RELATED,ESTABLISHED
REJECT     tcp  --  anywhere             anywhere            tcp flags:!FIN,SYN,RST,ACK/SYN reject-with tcp-reset
DROP       all  --  anywhere             anywhere            state INVALID
ACCEPT     all  --  anywhere             anywhere
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:pcsync-https
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:cddbp-alt
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:http
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:https
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:ftp
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:ssh
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:smtp
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:smtps
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:pop3
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:pop3s
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:imap
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:imaps
DROP       tcp  --  anywhere             anywhere            tcp dpt:poppassd
DROP       tcp  --  anywhere             anywhere            tcp dpt:mysql
DROP       tcp  --  anywhere             anywhere            tcp dpt:postgresql
DROP       tcp  --  anywhere             anywhere            tcp dpt:9008
DROP       tcp  --  anywhere             anywhere            tcp dpt:glrpc
DROP       udp  --  anywhere             anywhere            udp dpt:netbios-ns
DROP       udp  --  anywhere             anywhere            udp dpt:netbios-dgm
DROP       tcp  --  anywhere             anywhere            tcp dpt:netbios-ssn
DROP       tcp  --  anywhere             anywhere            tcp dpt:microsoft-ds
ACCEPT     udp  --  anywhere             anywhere            udp dpt:openvpn
ACCEPT     udp  --  anywhere             anywhere            udp dpt:domain
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:domain
ACCEPT     icmp --  anywhere             anywhere            icmp type 8 code 0
ACCEPT     all  --  anywhere             anywhere

Chain FORWARD (policy DROP)
target     prot opt source               destination
ACCEPT     all  --  anywhere             anywhere            state RELATED,ESTABLISHED
REJECT     tcp  --  anywhere             anywhere            tcp flags:!FIN,SYN,RST,ACK/SYN reject-with tcp-reset
DROP       all  --  anywhere             anywhere            state INVALID
ACCEPT     all  --  anywhere             anywhere
ACCEPT     udp  --  10.47.11.0/24        anywhere
ACCEPT     tcp  --  10.47.11.0/24        anywhere
DROP       all  --  anywhere             anywhere

Chain OUTPUT (policy DROP)
target     prot opt source               destination
ACCEPT     all  --  anywhere             anywhere            state RELATED,ESTABLISHED
REJECT     tcp  --  anywhere             anywhere            tcp flags:!FIN,SYN,RST,ACK/SYN reject-with tcp-reset
DROP       all  --  anywhere             anywhere            state INVALID
ACCEPT     all  --  anywhere             anywhere
ACCEPT     all  --  anywhere             anywhere

--nextPart1301134.PnX9stbhso
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)

iEYEABECAAYFAkq8yEUACgkQl7JJ9Rik84lByQCdEJastCrsgdlW21PsLt4NoN5i
pMMAn2yQvszdftdUTGUocDY8qiO46Zw4
=lwED
-----END PGP SIGNATURE-----

--nextPart1301134.PnX9stbhso--
