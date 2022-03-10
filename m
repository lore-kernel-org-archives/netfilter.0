From: Marcin Kabiesz <marcin.kabiesz@smarthost.pl>
Subject: NAT translation problem - leakage of packets with original source
 address
Date: Thu, 10 Mar 2022 12:40:10 +0100
Message-ID: <0e142c6e43516aa01a9bcf6f6df9b31d@smarthost.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=smarthost.pl; s=default; h=Content-Transfer-Encoding:Content-Type:
        Message-ID:Subject:To:From:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=oF/OSFrXIEPHieHk1x/4zZ+TlaBx1qd5uFonMXXWXfM=; b=A2IQSwx0RO1R7rEbkgTF9sa8xe
        mJ6r9g8S1Pz8SRgZRaE426KUOWHz5SRFKrtYvjnPa8WrHC77Y0sX6IL2RFWkVuH2AntaGMebLdtYB
        ww4OrlPAX9apAmK3BRFSiw9MoJ0bPpfS2HUNYAsxzSEXFS9ra+QtXzCv9CR0UvceQvyfzCXa7WQlc
        b8UxBWSpFHGz9u7ytOXCYewcjdfD5JDy42dq/1kObS0330xy2z+DA8NlNNpcDSr7t9dwolSs0aRXY
        SqwkXylcbT4KdOStprInc0/V0yXOEbyNRhbtGy5GwX+oKu0bdsouJHWk+Pt4O1BCn8bnRL9uJntIk
        raUdXj 
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello,
is it possible that with the OpenVPN interface tun0 every now and then 
some packets with a private source address are visible and forwarded to 
the router? because either it is intentional and I do not know or I 
found an error in the NAT translation that skips some packet and I see 
it on the router where the packet should not be, i.e. the router is a 
public addressing router, so in order for the packet to get there, the 
machine that sent it must exit at public which a few packages don't do 
....
I also reported the problem to kernel.org, but I don't know if netfilter 
is the right place.

1. server source with openvpn server
Mar 10 11:30:09 server kernel: [26083675.795216] Forward-Out: IN=tun0 
OUT=eno1 MAC= SRC=192.168.5.10 DST=216.58.209.10 LEN=52 TOS=0x00 
PREC=0x00 TTL=63 ID=64660 DF PROTO=TCP SPT=42296 DPT=443 SEQ=443014968 
ACK=3344394422 WINDOW=501 RES=0x00 ACK FIN URGP=0 OPT 
(0101080AD162AFE7A0460968)

2. server/router with only public addresses - default gateway
11:30:09.745326 xx:xx:xx:xx:xx:xx > zz:zz:zz:zz:zz:zz, ethertype 802.1Q 
(0x8100), length 64: vlan 1234, p 0, ethertype IPv4 (0x0800), (tos 0x0, 
ttl 63, id 0, offset 0, flags [DF], proto TCP (6), length 40)
     192.168.5.10.42296 > 216.58.209.10.443: Flags [R], cksum 0xa055 
(correct), seq 443014968, win 0, length 0

3. NAT rule
Chain POSTROUTING (policy ACCEPT 65M packets, 5184M bytes)
  pkts bytes target     prot opt in     out     source               
destination
1905K  345M SNAT       all  --  *      eno1    192.168.5.0/24       
0.0.0.0/0            to:1.2.3.4 (my public IP)

4. why ?? passed or not ??

Regards

-- 
Marcin Kabiesz
Administrator Sieci IT
