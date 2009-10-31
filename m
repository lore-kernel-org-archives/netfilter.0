From: Ludovico Cavedon <ludovico.cavedon@gmail.com>
Subject: Need POSTROUTING traversed twice or at least later
Date: Sat, 31 Oct 2009 15:38:41 -0700
Message-ID: <4AECBC71.3050909@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:x-enigmail-version:content-type
         :content-transfer-encoding;
        bh=dWPZ9y+5iuzMH0M15CRAIN2++uLyVgokliv1jiaEdCU=;
        b=nwiebpoJ3xKKw0BfHIvgDGkN7meJaEaT5h8tN+lXkuxBofpQDjcpqxaCUdnCX7oBGj
         pnZxzlpPg1qZAyZ0B1Q3ViOR3gH+lQfBe4QYpsJX+KA/MxqgLYwP+9LS4fHGrRvNeHq3
         vPMLN1pzG/EcFUI8oNKpxsjB9RlX0LMYzB9Ds=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I have a particular bridge & NAT configuration, running on a
2.6.26-2-xen-686 dom0 kernel from Debian stable.

Public interfece: eth0
Virtual interface for virtual machine 0: vif245.0
Virtual interface for virtual machine 0: vif246.0
Pair of veth: veth0 -- brveth0

I created a bridge:
br0		8000.563d6ac1b6b0	no		brveth0
							vif245.0
							vif246.0
Virtual machines have addresses 10.0.0.2 and 10.0.0.102.
I gave IP address 10.0.0.1/24 to veth0, which is the default gateway for
the virtual machines.
The interfaces in the bridge and the br0 interface have no ip address.

I have ip forwarding enables and I have a SNAT rules
iptables -t nat -A POSTROUTING -o eth0 -s 10.0.0.0/8 -j SNAT --to-source
 <IP-of-eth0>

The problem is that, in this case the packet traverses the POSTROUTING
chain only once and before the routing decision is made.

FWD IN=br0 OUT=br0 PHYSIN=vif245.0 PHYSOUT=vif246.0 SRC=10.0.0.102
DST=128.111.xx.xx LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=22143 DF PROTO=TCP
SPT=33933 DPT=80 WINDOW=5840 RES=0x00 SYN URGP=0

POST IN= OUT=br0 PHYSIN=vif245.0 PHYSOUT=vif246.0 SRC=10.0.0.102
DST=128.111.xx.xx LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=22143 DF PROTO=TCP
SPT=33933 DPT=80 WINDOW=5840 RES=0x00 SYN URGP=0

FWD IN=br0 OUT=br0 PHYSIN=vif245.0 PHYSOUT=brveth0 SRC=10.0.0.102
DST=128.111.xx.xx LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=22143 DF PROTO=TCP
SPT=33933 DPT=80 WINDOW=5840 RES=0x00 SYN URGP=0

FWD IN=veth0 OUT=eth0 SRC=10.0.0.102 DST=128.111.xx.xx LEN=60 TOS=0x00
PREC=0x00 TTL=63 ID=22143 DF PROTO=TCP SPT=33933 DPT=80 WINDOW=5840
RES=0x00 SYN URGP=0

*No POSTROUTING is evaluated here*

I then seen the packet going out of eth0 without the IP src address
being rewritten:

00:16:3e:6b:49:fd > 8a:bf:8a:db:97:67, ethertype IPv4 (0x0800), length
74: 10.0.0.102.33933 > 128.111.xx.xx: S 3785303754:3785303754(0) win
5840 <mss 1460,sackOK,timestamp 226211 0,nop,wscale 2>


I am not even sure:
-why does the packet goes thought ip netfilter when is traversing the
bridge? I would expect it to be forwarded at link level from vif246.0 to
brveth0. Than I would expect it to come out from eth0 and go thought
netfilter.

Is there avoid to avoid the first evaluation of POSTROUTING, or at least
have it evaluated also after forwarding from veth0 to eth0?

Solution that I tried, but are not ok:
-do SNAT on the first POSTROUTING evaluation, but then I loose the
internal IP src address I use for routing decisions. Moreover veth0
received a packet whose IP address is assigned to eth0, so does not
forward it (btw: can I change this behaviour?)

-delete veth0-brveth0 and assign 10.0.0.1 to br0. This solves that SNAT
issue, but I need the IP address 10.0.0.1 (the default gw for the VMs)
to be assigned to an interfece *not* in the bridge. I need this so I can
set up the bridge with maxageing to 0 and have it behave like a hub.
This is the reason I created the veth0-brveth0 pair.

Any hints/ideas?

Thanks for reading the long email!
Cheers,
Ludovico
