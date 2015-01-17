From: =?UTF-8?Q?St=C3=A9phane_Charette?= <stephanecharette@gmail.com>
Subject: netfilter queues only seeing IPv4/TCP traffic
Date: Fri, 16 Jan 2015 22:04:46 -0800
Message-ID: <CA+HxBU+RUU7NCTx3W1KeWaC-iDWs+JdicqmbVGmgDH4v7mENyA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=h9AMXSJI4poLjiZ88sDeuIPGy3axS2W//vTRpTrMoR0=;
        b=lP4DEQ4HbOTp9jbg3HIqHsSiOrMD1R9WeCpAJ5HUPm9YBAToC8pd19f4Yx3yI3fVQ3
         qqgtaJGq19V/MhsS1fLeys5/JDKKJ7f8T2DD20tMXhVfcjv8Kg9MKsHwqd3vB3UnB+I5
         geuJeRVSCeKBhNb2kkPDrnYrrXROszcruUgCsc5Ft3byF5IHuOHeWHF06tLj4QXSEIaJ
         akCbGqVT4yHrF1Q0UrJp2w1SrDVtzuW899eAxIbvbwrbpRVPhWr/RW4p4J5JbWsLy5jV
         BWArB4LvFxH6i+SfkFd7INW1BLNpLir198NqSh6bTkaQpFNVpMfqN2vGO5ncj3qWa/DT
         nrLg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: netfilter@vger.kernel.org

I have netfilter queues setup more-or-less like the Doxygen pages descr=
ibe:

nfq_open();
// nfq_bind_pf( h, AF_INET ); -- commented out
nfq_create_queue( ... );
nfq_set_mode( q, NFQNL_COPY_PACKET, 0xffff );
nfq_fd( h );
=2E..read from fd...
nfq_handle_packet( h, buffer, bytes_read );

And my callback is doing a hex dump of the payload and calling
nfq_set_verdict(...);

All is well, but I'm only seeing IPv4+TCP packets.  I have a few
related questions:

1) Is there another API I must call to see all traffic?
2) ...or are my iptable rules the likely culprit?
3) Some web pages say nfq_bind_pf() is ignored, is that true?

The rules I'm currently using to get traffic to flow to my queues:

iptables --table filter --new-chain MYQ
iptables --table filter --append MYQ --jump NFQUEUE \
    --queue-balance 0:3 --queue-bypass

iptables --table nat --append POSTROUTING \
    --source 10.0.1.0/24 --out-interface eth0 \
    --jump MASQUERADE

iptables --table filter --append FORWARD --jump MYQ

I had more elaborate rules, but I simplified it to these for testing.
I'm just trying to get all traffic forwarded by this device to go
through the netfilter queues.

Thanks for any pointers.

St=C3=A9phane
