From: "Omar Garcia" <omar.garcia@fractalia.biz>
Subject: Connlimit problems and others
Date: Thu, 10 Feb 2005 09:41:19 +0100
Message-ID: <003b01c50f4c$4aecef20$910010ac@coco>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hi list,

I have problems with connlimit module. I am trying to limit the total =
connections established and other limit above to p2p connections.
My machine is working as a transparent bridge with QoS as follow:


                LAN =
------------------------eth1[Bridge]eth0-----------------------------rout=
er -------------------------INTERNET

Kernel 2.6.8-1 with POMng , wrr and imq pathed.=20
The iptables and kernel modules load perfectly, or it seems.
I have HTB queue to incomming traffic from internet and an imq queue to =
outgoing traffic.

I HAVE A FEW QUESTIONS.
    ( In SHAPER-IN and SHAPER-OUT i have put a few rules for intercept =
the traffic)

    1- Is correct to put HTB queue to outgoing traffic and an imq queue =
to outgoing or it=B4s the oppsite.??????
   =20
    2- I have put to main rules to intercept the incomming and outgoing =
traffic.
               For Incomming traffic i put in PREROUTING in mangle chain
                $IPTABLES -t mangle -I PREROUTING -m physdev =
--physdev-in eth0 -j SHAPER-IN=20
       =20
                For outgoing traffic i put in POSTROUTING in mangle =
chain
                $IPTABLES -t mangle -I POSTROUTING  -m physdev =
--physdev-out eth0 -j IMQ --todev 0
                $IPTABLES -t mangle -I POSTROUTING -m physdev =
--physdev-out eth0 -j SHAPER-OUT

                ( I don=B4t know why i have to redirect to IMQ and =
SHAPER-OUT )

        Is correct to put these two main rules there?????????????


    3- The connlimit module doesn=B4t work with ipp2p module althoug =
this rule get correctly
        $IPTABLES -I FORWARD -t mangle -p tcp -m state --state =
ESTABLISHED,RELATED -m connlimit --connlimit-above 100 -j DROP

        I am not very happy with this rule because the machines can =
established a few connections more than i put.=20
        I can see over 200 connections cross the bridge in =
/proc/net/ip_conntrack.=20
        Its true that it get a moment that nobody can established a =
connection, but I donn=B4t want that, I only want to limit p2p =
connections and a global limit, but with a high limit to always permit =
normal traffic.

        And this rule got me an error:

        $IPTABLES -I FORWARD -t mangle -p tcp -m ipp2p --ipp2p -m =
connlimit --connlimit-above 100 -j DROP
        ( I have put other rules like this but with mark module instead =
connlimit, and it load correctly).

        Is there someone that had configured a machine like this?
   =20


    Thanks a lot, i promise to upload a How-to when i finished this long =
challenge.
    Here are my rules, if someone wants to read them.


     =20
hain PREROUTING (policy ACCEPT)
target     prot opt source               destination        =20
SHAPER-IN  all  --  anywhere             anywhere            PHYSDEV =
match --physdev-in eth0=20

Chain INPUT (policy ACCEPT)
target     prot opt source               destination        =20

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination        =20
DROP       tcp  --  anywhere             anywhere            state =
RELATED,ESTABLISHED #conn/32 > 100=20

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination        =20

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination        =20
SHAPER-OUT  all  --  anywhere             anywhere            PHYSDEV =
match --physdev-out eth0=20
IMQ        all  --  anywhere             anywhere            PHYSDEV =
match --physdev-out eth0 [4 bytes of unknown target data]=20

Chain SHAPER-IN (1 references)
target     prot opt source               destination        =20
RETURN     all  --  172.16.0.0/24        anywhere           =20
MARK       udp  --  anywhere             anywhere            MARK set =
0x1e=20
MARK       udp  --  anywhere             anywhere            MARK set =
0x1e=20
MARK       icmp --  anywhere             anywhere            MARK set =
0x1e=20
MARK       tcp  --  anywhere             anywhere            tcp =
flags:!SYN,RST,ACK/ACK MARK set 0x1e=20
MARK       tcp  --  anywhere             anywhere            tcp =
flags:SYN,RST,ACK/ACK length 0:128 TOS match !Normal-Service MARK set =
0x1e=20
MARK       tcp  --  anywhere             anywhere            TOS match =
Minimize-Delay MARK match 0x0 MARK set 0x1e=20
MARK       tcp  --  anywhere             anywhere            tcp =
spts:ssh:telnet MARK set 0x1e=20
MARK       tcp  --  anywhere             anywhere            tcp =
dpts:ssh:telnet MARK set 0x1e=20
MARK       tcp  --  anywhere             anywhere            TOS match =
!Minimize-Delay tcp spt:ssh MARK set 0x1f=20
MARK       tcp  --  anywhere             anywhere            TOS match =
!Minimize-Delay tcp dpt:ssh MARK set 0x1f=20
CONNMARK   tcp  --  anywhere             anywhere            CONNMARK =
match 0x1f CONNMARK restore=20
CONNMARK   tcp  --  anywhere             anywhere            ipp2p =
v0.7.1 --ipp2p CONNMARK set 0x1f=20
CONNMARK   tcp  --  anywhere             anywhere            ipp2p =
v0.7.1 --ipp2p-data CONNMARK set 0x1f=20
MARK       all  --  anywhere             anywhere            MARK match =
0x0 MARK set 0x1f=20

Chain SHAPER-OUT (1 references)
target     prot opt source               destination        =20
RETURN     all  --  anywhere             172.16.0.0/24      =20
MARK       icmp --  anywhere             anywhere            MARK set =
0x15=20
MARK       tcp  --  anywhere             anywhere            tcp =
flags:!SYN,RST,ACK/ACK MARK set 0x15=20
MARK       tcp  --  anywhere             anywhere            tcp =
flags:SYN,RST,ACK/ACK length 0:128 TOS match !Normal-Service MARK set =
0x15=20
MARK       tcp  --  anywhere             anywhere            tcp =
flags:SYN,RST,ACK/ACK length 128:65535 MARK set 0x1d=20
MARK       udp  --  anywhere             anywhere            MARK set =
0x18=20
MARK       tcp  --  anywhere             anywhere            TOS match =
Minimize-Delay MARK match 0x0 MARK set 0x17=20
MARK       tcp  --  anywhere             anywhere            tcp =
spts:ssh:telnet MARK set 0x16=20
MARK       tcp  --  anywhere             anywhere            tcp =
dpts:ssh:telnet MARK set 0x16=20
MARK       tcp  --  anywhere             anywhere            tcp spt:www =
MARK set 0x1a=20
MARK       tcp  --  anywhere             anywhere            tcp dpt:www =
MARK set 0x1a=20
MARK       tcp  --  anywhere             anywhere            tcp =
spt:smtp MARK set 0x1b=20
MARK       tcp  --  anywhere             anywhere            tcp =
dpt:smtp MARK set 0x1b=20
MARK       tcp  --  anywhere             anywhere            TOS match =
Maximize-Throughput MARK set 0x1c=20
MARK       tcp  --  anywhere             anywhere            TOS match =
Minimize-Cost MARK set 0x1c=20
CONNMARK   tcp  --  anywhere             anywhere            CONNMARK =
match 0x1d CONNMARK restore=20
CONNMARK   tcp  --  anywhere             anywhere            ipp2p =
v0.7.1 --ipp2p CONNMARK set 0x1d=20
CONNMARK   tcp  --  anywhere             anywhere            ipp2p =
v0.7.1 --ipp2p-data CONNMARK set 0x1d=20
CONNMARK   udp  --  anywhere             anywhere            CONNMARK =
match 0x1d CONNMARK restore=20
CONNMARK   udp  --  anywhere             anywhere            ipp2p =
v0.7.1 --ipp2p CONNMARK set 0x1d=20
CONNMARK   udp  --  anywhere             anywhere            ipp2p =
v0.7.1 --ipp2p-data CONNMARK set 0x1d=20
MARK       tcp  --  anywhere             anywhere            TOS match =
!Minimize-Delay tcp spt:ssh MARK set 0x1c=20
MARK       tcp  --  anywhere             anywhere            TOS match =
!Minimize-Delay tcp dpt:ssh MARK set 0x1c=20
MARK       all  --  anywhere             anywhere            MARK match =
0x0 MARK set 0x1b=20



