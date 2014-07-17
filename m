From: Thomas Martin <tmartincpp@gmail.com>
Subject: ipset and hash:net,iface type
Date: Thu, 17 Jul 2014 09:35:32 +0200
Message-ID: <CAO1iXZ+-i+vQt64ZSwUEiwqGOeNs9=DkMg-Vptz5x3i=1k7_KA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=H2r3IsEknAk6JBHm4y8tHMk2cTk20RymRhRGt52q+zM=;
        b=R2xxKhsmcBPXjMZlkKMpZvZHVTtwtHsv+kr3IzeY6/gwe9arZuwAQrQIm4xQHhGgyV
         IptrjLLf5i28eSav1YCz/eP5TxLX6cx/aPMJjwHBX4P+XCCOwMf1COoXZ0p2GgbpE1Oq
         Pez+Hed3hHnzUNUX8WFmxZKb0j3ZxGQ+cgNh77XH/n/jo0qQ9AmXc5unZuqOr2ggdmHr
         wg0CSsjU8wRQTobC27fgPw9VTF8JfDthgS/4+P2G1hSVihPajM7xQWxrHGu4ocJo9E6J
         D3isoNeCLWmtW0mWH1fau5jbQgOz/l2EKkvFlRzVvMv0m+Ne4+tJYFgDFxe7xo/PfU4b
         RF9Q==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi all,

I'm not able to make ipset works with the "hash:net,iface" type.

I test it with 6.12 and 6.21 on a Debian Wheezy (kernel: 3.2,
iptables: 1.4.14-3.1).

The only real custom is that the interfaces are vlans interfaces and
they are renamed (with ifrename).
For example eth0.100 is vlan100


Here is my configuration (I know this rules are ugly, this is only to test):
# ipset list all_users_if
Name: all_users_if
Type: hash:net,iface
Revision: 0
Header: family inet hashsize 4096 maxelem 65536
Size in memory: 33600
References: 2
Members:
172.20.128.0/24,vlan10
172.20.130.0/24,vlan100


# iptables -L FORWARD -vn
Chain FORWARD (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination
    0     0 silentaccept  all  --  vlan10  *       172.20.128.0/24
  0.0.0.0/0            state NEW match-set all_users_if dst,dst
    0     0 silentaccept  all  --  vlan10  *       172.20.128.0/24
  0.0.0.0/0            state NEW match-set all_users_if dst
    7   420 statefull  all  --  *      *       0.0.0.0/0
0.0.0.0/0
    7   420 logdrop    all  --  *      *       0.0.0.0/0
0.0.0.0/0            state NEW


Finally here is the log (doing a simple telnet on port 22 from
172.20.128.41 to 172.20.130.200):
drop: IN=vlan10 OUT=vlan100 MAC=blablabla SRC=172.20.128.41
DST=172.20.130.200 LEN=60 TOS=0x10 PREC=0x00 TTL=63 ID=26887 DF
PROTO=TCP SPT=50617 DPT=22 WINDOW=14600 RES=0x00 SYN URGP=0


Please note that this is working with this rules (without ipset):
Chain FORWARD (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination
    5   324 silentaccept  all  --  vlan10  vlan100  172.20.128.0/24
   172.20.130.0/24       state NEW
    0     0 statefull  all  --  *      *       0.0.0.0/0
0.0.0.0/0
    0     0 logdrop    all  --  *      *       0.0.0.0/0
0.0.0.0/0            state NEW



I really don't understand what I'm missing...

Thanks.
