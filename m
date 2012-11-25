From: pawa@tormail.org
Subject: Blocking incoming non-localhost traffic, *except* for certain gid
Date: Sun, 25 Nov 2012 04:01:55 +0000
Message-ID: <1TcTOh-000KTd-Fd@internal.tormail.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tormail.org; s=tm;
	h=Message-Id:X-TorMail-User:Content-Type:MIME-Version:Subject:To:From:Date; bh=LHpalzSn08D+QPU+buHe3/HucD54/VRWoRwoXk+OajY=;
	b=QkstFmXibkP+DKWa4ncAxoBkFjD6qJyIpBdgb8DX9lST0nbvk3AO0an9G4jvtqi9szPKczivoDHGcxIs+aPEse6+2l0+EMRiUUvU1kVsCkDoCpRdrtipVPOGKOxvuty4rx6RpuZLrdfhmW1Rjyf7jd3NdDB0kco7vMIp36czgU8=;
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I'm trying to block all non-localhost IPv4 traffic, outgoing and
incoming, on my computer, except for processes with gid 1111 which
should be able to interact with my LAN (and the Internet through a
gateway in it). Here's what generates my ruleset (iptables-save shows
nothing beyond that):

    FILTER='iptables -A OUTPUT'
       LOG='LOG --log-uid --log-prefix'

    $FILTER -o lo -j $LOG accept_lo:
    $FILTER -o lo -j ACCEPT

    $FILTER -d 127.0.0.1 -j $LOG accept_127.0.0.1:
    $FILTER -d 127.0.0.1 -j ACCEPT

    $FILTER -m owner --gid-owner 1111 -j $LOG accept_gid1111:
    $FILTER -m owner --gid-owner 1111 -j ACCEPT

    $FILTER -j $LOG reject:
    $FILTER -j REJECT --reject-with icmp-net-prohibited

It works for outgoing connections, but incoming connections somehow
get blocked regardless of which group they are in. My PC runs kernel
kernel 3.6.7 + iptables 1.4.16.3. It is at 192.168.1.1, for testing I
let netcat listen:

    nc -v -n -l -p 1234

And connect from another computer (192.168.1.2):

    nc -v -n 192.168.1.1 1234

That gives me these kind of kernel log entries, no matter what gid
the listening process has:

    reject:IN= OUT=eth0 SRC=192.168.1.1 DST=192.168.1.2 LEN=60
    TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=TCP SPT=1234 DPT=64079
    WINDOW=14480 RES=0x00 ACK SYN URGP=0
    accept_lo:IN= OUT=lo SRC=192.168.1.1 DST=192.168.1.1 LEN=88
    TOS=0x00 PREC=0xC0 TTL=64 ID=20114 PROTO=ICMP TYPE=3 CODE=9
    [SRC=192.168.1.1 DST=192.168.1.2 LEN=60 TOS=0x00 PREC=0x00 TTL=64
    ID=0 DF PROTO=TCP SPT=1234 DPT=64079 WINDOW=14480 RES=0x00 ACK SYN
    URGP=0 ]
    ... and those two repeated (except for the ICMP packet's ID
    incrementing) as the connecting netcat retries ...

So I suppose the incoming SYN is accepted but not important enough
to be logged? (Any way to get complete logging?)
But why does the SYN-ACK get rejected?
And how can I get it to work?

Cheers
