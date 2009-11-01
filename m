From: Jari Laurila <jari.laurila@gmail.com>
Subject: SNAT with ipsec => return packets not de-natted
Date: Sun, 1 Nov 2009 20:50:52 +0200
Message-ID: <a906663d0911011050w59ae675dmc70ee93132cf6990@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=dNqYon3vegqRefhivR6abPiKuMELP9ACePUVo0BjQC4=;
        b=ClJ/cA8EnOt1m8deateqFDBpBdlmbpJDDhK3KgjO1ksagseZCgtXbwwFt2Pm0oqtrT
         PZBERgb6sNW7ldfvFm6NykFRMXD4tij0bJxd1xuvnNqGzLKZ9rBaGIVYaa706CVj5r82
         fen3uP1OerA/liXx0xhFutVNUJ8EUhNL1zYTk=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I'm trying to do SNAT with ipsec tunnel mode connection, but can't get
it working.
I'm trying to accomplish the following:

1. Local server li sends packet with its internal ip to remote server re.
2. Local vpn gateway lg receives packet and SNATs it to external ip le.
3. lg sends packet through vpn tunnel between lg and rg
5. re responds through vpn tunnel between rg and lg
6. lg de-nats packet (le=>li) and sends packet to li

My setup currently fails at point 6. (Packet doesn't get de-natted)
Am I missing something?  I understood that Patrick McHardy added necessary hooks
to kernel few years ago, so this should work.

I'm using kernel 2.6.30.5 and iptables 1.4.5.

I attached some packet dumps and iptables output below.

le.le.le.le == local server external ip
li.li.li.li == local server internal ip
lg.lg.lg.lg == local vpn gw ip
re.re.re.re == remote server ip
rg.rg.rg.rg == remote vpn gw ip

# iptables -t nat -vnL | grep le.le.le.le
    0     0 DNAT       all  --  *      *       re.re.re.re
le.le.le.le       to:li.li.li.li
    6   288 SNAT       all  --  *      *       li.li.li.li
re.re.re.re       to:le.le.le.le

# Connection attemp seen from internal interface	
# tcpdump -ni int0.1 'host re.re.re.re'
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on int0.1, link-type EN10MB (Ethernet), capture size 96 bytes
19:53:06.925200 IP li.li.li.li.2921 > re.re.re.re.21: S
3229210479:3229210479(0) win 64240 <mss 1460,nop,nop,sackOK>
19:53:09.838539 IP li.li.li.li.2921 > re.re.re.re.21: S
3229210479:3229210479(0) win 64240 <mss 1460,nop,nop,sackOK>
19:53:15.873102 IP li.li.li.li.2921 > re.re.re.re.21: S
3229210479:3229210479(0) win 64240 <mss 1460,nop,nop,sackOK>

# Connection attempt seen from external interface
# tcpdump -ni ext1 'host rg.rg.rg.rg or host re.re.re.re'
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on ext1, link-type EN10MB (Ethernet), capture size 96 bytes

## Encrypted syn packet from local server to remote server
19:53:06.925295 IP lg.lg.lg.lg > rg.rg.rg.rg:
ESP(spi=0xb4e85134,seq=0x3), length 84
## Encrypted synack packet from remote server to local server
19:53:06.943724 IP rg.rg.rg.rg > lg.lg.lg.lg:
ESP(spi=0x06525201,seq=0x8), length 76
## Decrypted synack packet from remote server goes to external interface
## because de-natting does not work (le.le.le.le should be translated
back to li.li.li.li)
19:53:06.943724 IP re.re.re.re.21 > le.le.le.le.2921: S
400270854:400270854(0) ack 3229210480 win 65535 <mss 1400>
19:53:09.507623 IP rg.rg.rg.rg > lg.lg.lg.lg:
ESP(spi=0x06525201,seq=0x9), length 76
19:53:09.507623 IP re.re.re.re.21 > le.le.le.le.2921: S
400270854:400270854(0) ack 3229210480 win 65535 <mss 1400>

## Local server tries again
19:53:09.838590 IP lg.lg.lg.lg > rg.rg.rg.rg:
ESP(spi=0xb4e85134,seq=0x4), length 84
19:53:09.844910 IP rg.rg.rg.rg > lg.lg.lg.lg:
ESP(spi=0x06525201,seq=0xa), length 76
19:53:09.844910 IP re.re.re.re.21 > le.le.le.le.2921: S
400270854:400270854(0) ack 3229210480 win 65535 <mss 1400>
19:53:15.526342 IP rg.rg.rg.rg > lg.lg.lg.lg:
ESP(spi=0x06525201,seq=0xb), length 76
19:53:15.526342 IP re.re.re.re.21 > le.le.le.le.2921: S
400270854:400270854(0) ack 3229210480 win 65535 <mss 1400>

## ...And again
19:53:15.873146 IP lg.lg.lg.lg > rg.rg.rg.rg:
ESP(spi=0xb4e85134,seq=0x5), length 84
19:53:15.880125 IP rg.rg.rg.rg > lg.lg.lg.lg:
ESP(spi=0x06525201,seq=0xc), length 76
19:53:15.880125 IP re.re.re.re.21 > le.le.le.le.2921: S
400270854:400270854(0) ack 3229210480 win 65535 <mss 1400>
19:53:27.746678 IP rg.rg.rg.rg > lg.lg.lg.lg:
ESP(spi=0x06525201,seq=0xd), length 76
19:53:27.746678 IP re.re.re.re.21 > le.le.le.le.2921: S
400270854:400270854(0) ack 3229210480 win 65535 <mss 1400>
19:53:51.926765 IP rg.rg.rg.rg > lg.lg.lg.lg:
ESP(spi=0x06525201,seq=0xe), length 76
19:53:51.926765 IP re.re.re.re.21 > le.le.le.le.2921: S
400270854:400270854(0) ack 3229210480 win 65535 <mss 1460>
## Remote server gives up
19:54:31.256860 IP rg.rg.rg.rg > lg.lg.lg.lg:
ESP(spi=0x06525201,seq=0xf), length 76
19:54:31.256860 IP re.re.re.re.21 > le.le.le.le.2921: R 1:1(0) ack 1 win 65535


# iptables -t nat -vnL | grep le.le.le.le
    0     0 DNAT       all  --  *      *       re.re.re.re
le.le.le.le       to:li.li.li.li
    7   336 SNAT       all  --  *      *       li.li.li.li
re.re.re.re       to:le.le.le.le
	
SNAT rule counter has increased by one so the connection to re has
been source natted correctly
I even tried to add explicit rule to nat connections back to li, but
the rule doesn't seem to match at all
