From: Asher Awelan <asherawelan@gmail.com>
Subject: BROUTING VLANS
Date: Mon, 15 Nov 2010 11:02:50 +0000
Message-ID: <0619127E-C439-4A2D-A720-30C5B1FD25FA@gmail.com>
Mime-Version: 1.0 (Apple Message framework v1081)
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:content-type
         :content-transfer-encoding:subject:date:message-id:to:mime-version
         :x-mailer;
        bh=MUoU1NfHezjxlqkd7YUuw43nCjyivRFbvRDTT0OX2QM=;
        b=Wlkv64v2belZEkGhZtOiHukWpLjTRs5dSj+R4p0roVBw4HldGEf8Bj1BB/XerNqJ7m
         sqTp2QlQkm1dqICtdYs0PHDPtFD+Eg8kmhL6gcTQHi7F01pnwtQc64eWmMDmFq/bsCmp
         t7HvJx8+yIeTrHE29raGQi0OiSWsFZ3QWDZ/A=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

SCENARIO:
I have inherited a hospitality solution which uses 802.11q tagging on it's switched network for the purpose of room identification, i.e. one port per room.
My current handling of this is working but not stable and is memory heavy.
Currently I have the 250 (I know!) VLANs on eth1.x as interfaces and have bridged them on br0.
I am using ebtables to log which mac addresses are using which vlan tag and then doing some cron processing to charge data use to the rooms.
However, this is pretty intensive on the network/ifconfig management.

QUESTION:
Is there a way to broute the vlans to the eth1 interface and not have to create every interface and register every vlan... or perhaps strip the vlan id (after logging of course)...

Further clarification can be given of course.
I know this is a ridiculous scenario, however these are my parameters within which to work.

Thank you kindly,