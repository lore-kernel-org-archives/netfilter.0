From: Bird Chen <bird_chen@hp.com>
Subject: strange about netmeeting via iptables?
Date: Wed, 18 Sep 2002 01:37:21 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D876851.FD4EEB10@hp.com>
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

Hi,
  I am new to this list. But I have been searching for solution on this
issue over and over. I have a linux running iptables between my intranet
and ISP through ADSL link. And my client which is running win2k try to
netmeeting the internet people. But when the connection was established,
peer can hear what I am saying but I can't hear the peer's voice.
  Here is the output of my iptables -L,

root@srv1:/proc/net# iptables -L
Chain INPUT (policy ACCEPT)
target     prot opt source               destination
DROP       tcp  --  anywhere             anywhere           tcp
flags:FIN,SYN,RS
T,PSH,ACK,URG/FIN,SYN,RST,PSH,ACK,URG
DROP       tcp  --  anywhere             anywhere           tcp
flags:FIN,SYN,RS
T,PSH,ACK,URG/NONE
DROP       tcp  --  anywhere             anywhere           tcp
dpt:telnet
ACCEPT     tcp  --  10.1.1.0/24          anywhere           tcp dpt:ssh
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:ssh
LOG        tcp  --  anywhere             anywhere           tcp dpt:www
LOG leve
l warning prefix `HTTP tried to access.'
LOG        udp  --  anywhere             anywhere           udp dpt:www
LOG leve
l warning prefix `HTTP tried to access.'
Chain FORWARD (policy ACCEPT)
target     prot opt source               destination
DROP       tcp  --  anywhere             anywhere           tcp
flags:FIN,SYN,RS
T,PSH,ACK,URG/FIN,SYN,RST,PSH,ACK,URG
DROP       tcp  --  anywhere             anywhere           tcp
flags:FIN,SYN,RS
T,PSH,ACK,URG/NONE
DROP       all  -- !10.1.1.0/24          anywhere
DROP       all  --  192.168.0.0/16       anywhere
DROP       all  --  172.16.0.0/12        anywhere
DROP       all  --  10.0.0.0/8           anywhere
LOG        tcp  --  anywhere             anywhere           tcp
spts:netbios-ns:
netbios-ssn LOG level warning prefix `SMB tried to cross.'
LOG        udp  --  anywhere             anywhere           udp
spts:netbios-ns:
netbios-ssn LOG level warning prefix `SMB tried to cross.'
DROP       tcp  --  anywhere             anywhere           tcp
spts:netbios-ns:
netbios-ssn
DROP       udp  --  anywhere             anywhere           udp
spts:netbios-ns:
netbios-ssn
DROP       tcp  --  anywhere             anywhere           tcp spt:635
DROP       udp  --  anywhere             anywhere           udp spt:635
DROP       tcp  --  anywhere             anywhere           tcp spt:2049

DROP       udp  --  anywhere             anywhere           udp spt:2049

DROP       tcp  --  anywhere             anywhere           tcp
spt:sunrpc
DROP       udp  --  anywhere             anywhere           udp
spt:sunrpc
DROP       udp  --  anywhere             anywhere           udp
dpt:syslog
DROP       tcp  --  anywhere             anywhere           tcp
dpt:printer
DROP       tcp  --  anywhere             anywhere           tcp
dpt:shell
DROP       tcp  --  anywhere             anywhere           tcp dpt:exec

ACCEPT     all  --  10.1.1.0/24          anywhere           state NEW
ACCEPT     all  -- !10.1.1.0/24          anywhere           state
RELATED,ESTABL
ISHED

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination


  Any idea? I have compiled the modules for h323 support which I grab
the source from internet. And my patched kernel now is
2.4.19-Newnat16-v2.
  Thanks for help.

Best regards,

--
Bird Chen
Personal Key:0BAD AC36 4C98 9495 3A2E  126A 0925 EA4C 702C CEFC



