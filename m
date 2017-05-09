From: xiegaofeng@grandcloud.cn
Subject: Multicast does not work on ebtables
Date: Tue, 09 May 2017 16:46:45 +0800
Message-ID: <4289f9ef5464dbbcdaee38396ae06e5b@grandcloud.cn>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
dkim-signature: v=1; a=rsa-sha256; d=grandcloud.cn; s=mail;
        c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:MIME-Version:Content-Type:Content-Transfer-Encoding;
        bh=DIoXQJYmZZhEz+TJ2/UySwX6EL8J5YDjPTqs2IaVt3c=;
        b=BDCsksHryV6RIIZ+Y8rKl99ueWJFeUj2/PDBeyaNjwmfUlGQr3NWMrceLKd/ROxlZZjh8fVE0ZsfjaC8//C/QuKI9FfCA8OOSHsVEI8XytuhV3GHJHm3yCic7kvGzVJ+/jshNjhFPbVuRX1QDEQ3TDJ8Yx5y7UOZ7p2vrmamWJE=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

My host has three virtual machines: VM1 VM2, and VM3. Their interfaces 
in the
physical host respectively are tap1, tap2, and tap3; and their IPs are
     10.200.10.101(52:54:0:1:6c:c1),
     10.200.10.102(52:54:0:1:6c:c2),
     10.200.10.103(52:54:0:1:6c:c3).
tap1, tap2 and tap3 are bound on a same linux bridge.

I hope that tap1 and tap2 can communicate with each other, not tap3.

The ebtables rules are as follow.

# For tap1
ebtalbes -N tap1_IC
ebtables -P tap1_IC DROP
ebtables -A tap1_IC --among-src ! 52:54:0:1:6c:c1=10.200.10.101 -j DROP
ebtables -A tap1_IC --among-dst 52:54:0:1:6c:c2=10.200.10.102 -j ACCEPT
ebtables -A tap1_IC -d Broadcast -j ACCEPT
ebtalbes -A tap1_IC -d Multicast -j ACCEPT

ebtalbes -N tap1_MI
ebtables -P tap1_MI DROP
ebtables -A tap1_MI --among-dst 52:54:0:1:6c:c1=10.200.10.101 -j RETURN
ebtables -A tap1_MI -d Broadcast -j RETURN
ebtalbes -A tap1_MI -d Multicast -j RETURN

ebtables -N tap1_OC
ebtables -P tap1_OC DROP
ebtables -A tap1_OC -j tap1_MI
ebtables -A tap1_OC --among-src 52:54:0:1:6c:c2=10.200.10.102 -j ACCEPT

ebtables -A FORWARD -i tap1 -j tap1_IC
ebtables -A FORWARD -o tap1 -j tap1_OC

# For tap2
ebtalbes -N tap2_IC
ebtables -P tap2_IC DROP
ebtables -A tap2_IC --among-src ! 52:54:0:1:6c:c2=10.200.10.102 -j DROP
ebtables -A tap2_IC --among-dst 52:54:0:1:6c:c1=10.200.10.101 -j ACCEPT
ebtables -A tap2_IC -d Broadcast -j ACCEPT
ebtalbes -A tap2_IC -d Multicast -j ACCEPT

ebtalbes -N tap2_MI
ebtables -P tap2_MI DROP
ebtables -A tap2_MI --among-dst 52:54:0:1:6c:c2=10.200.10.102 -j RETURN
ebtables -A tap2_MI -d Broadcast -j RETURN
ebtalbes -A tap2_MI -d Multicast -j RETURN

ebtables -N tap2_OC
ebtables -P tap2_OC DROP
ebtables -A tap2_OC -j tap2_MI
ebtables -p tap2_OC --among-src 52:54:0:1:6c:c1=10.200.10.101 -j ACCEPT

ebtables -A FORWARD -i tap2 -j tap1_IC
ebtables -A FORWARD -o tap2 -j tap1_OC

# For tap3
ebtalbes -N tap3_IC
ebtables -P tap3_IC DROP
ebtables -A tap3_IC --among-src ! 52:54:0:1:6c:c3=10.200.10.103 -j DROP
ebtables -A tap3_IC -d Broadcast -j ACCEPT
ebtalbes -A tap3_IC -d Multicast -j ACCEPT

ebtalbes -N tap3_MI
ebtables -P tap3_MI DROP
ebtables -A tap3_MI --among-dst 52:54:0:1:6c:c3=10.200.10.103 -j RETURN
ebtables -A tap3_MI -d Broadcast -j RETURN
ebtalbes -A tap3_MI -d Multicast -j RETURN

ebtables -N tap3_OC
ebtables -P tap3_OC DROP
ebtables -A tap3_OC -j tap3_MI

ebtables -A FORWARD -i tap3 -j tap1_IC
ebtables -A FORWARD -o tap3 -j tap1_OC

For TCP, UDP or BROADCAST, it works as expected. But for Multicast, it's 
not.

When VM1 sends a Multicast packet, VM2 can receive it and it's OK, but 
VM3 will
also receive it. It's not right, because the chain tap3_OC does not have 
the
matched rule and will DROP it by default. I do not known why VM3 can 
receive
this Multicast packet. I'm not sure whether it is a bug.

Thanks,
Aaron

