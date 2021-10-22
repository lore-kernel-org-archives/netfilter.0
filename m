From: Benno <b.ohnsorg@freenet.de>
Subject: nft numeric output translates tcp flags rule so it cannot be loaded
 again
Date: Fri, 22 Oct 2021 15:51:04 +0200
Message-ID: <b02e9c0a-281d-02d1-d876-b0b997b6d8c2@freenet.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=freenet.de;
         s=mjaymdexmjqk; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:
        Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=tCG1FbWvfUDjqhEs8uVCyUVHSzZ3pfUc6p7GGEhn6K0=; b=QoFlTNjGhRmdWkO/jMv8WvX7k4
        lHtV2ted7u3N1JRLISMuyA5ANTtRxoy/HmOUUrYLeMsZ78Zy68sAwtqnEt8Wuah3k8oz3Ke24Ux1Y
        tkKIpjIPdFd/X5L9PLObtnm9Ls4lflCCxlY9N4aTOTNT3X9Eu9Og1K9nzB8proGlgzc77md0kwDjI
        iQYcI5Zw/oJQAP3Jtb1zs7JOfrP7Ars2vj0zs/IPIrX9Wf5Q22Ts6XlMTL39/AMs0O7TrHqFpK3tc
        2zl6jxCZHqYrh1ZXzse+AoCLBTdFcz2H2D0OvfXifI4BxxuCvfELQ2D+1aJfAjuzhyWVPfS0x//mE
        W6 
Content-Language: de-DE
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

the following ruleset was written manually:

#!/sbin/nft -f
flush ruleset
table inet firewall {

  chain inbound {
    type filter hook input priority 0; policy drop;
    ct state vmap { 0x1 : drop, 0x2 : accept, 0x4 : accept }
    tcp flags & (fin|syn|rst|ack) != syn ct state new counter drop
    iifname "lo" accept
    meta protocol vmap { 0x0800 : jump inbound_ipv4, 0x86dd : jump
inbound_ipv6 }
    tcp dport { 22, 80, 443 } accept
    udp dport 1900 meta pkttype 2 limit rate 4/second burst 20 packets
accept comment "Accept UPnP IGD port mapping reply"

    log prefix "[nftables] Inbound Denied: " counter packets 0 bytes 0 drop
  }
}

The ruleset should drop anything except it is allowed. Loading this
through nft -f <file> does exactly what it should. Adding or removing
for example more ports for dport rule does exactly what it should:
provide access to more or less services, e.g. 631 for CUPS or 8883 to a
TLS-wrapped mosquitto/ MQTT broker.

The last line flawlessly controls logging. Without port 631 but
connection attempts to CUPS print the messages accordingly. Adding port
631 again makes CUPS work again and no messages anymore.

The operating system stores this to a file when shutting down and uses
option -n for numeric output. This translates all the rules and the tcp
flags rule turns into this:

tcp flags 0x2 / 0x1,0x2,0x4,0x10 ct state 0x8 counter packets 0 bytes 0 drop

When the rules saved like this are re-loaded TCP port rules are broken.
For example connections to sshd on port 22 is not possible anymore.
There are also no logs about the dropped traffic.

I can fix this by replacing the numeric variant with the verbose tcp
flags rule. When reverting this change to the numeric variant connection
attempts are fruitless again. Logging never returns correctly. With the
numeric variant and connection attempts causing only timeouts no
messages show up that it was denied.

1) Should I re-write this rule so the numeric variant also changes to
something working?
2) Is the translation to the numeric variant broken and should this
become a bug report?
3) Is -n a bad idea to save current rule set to restore it later?
4) None of the above but something with a funny twist?

Thanks in advance.
