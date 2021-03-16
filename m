From: Martin Gignac <martin.gignac@gmail.com>
Subject: How to troubleshoot (suspected) flowtable lockups/packet drops?
Date: Tue, 16 Mar 2021 11:43:32 -0400
Message-ID: <CANf9dFO+CAuiugQjwKDZ+tOVYuB+HMKeJzDVqekY=vVFE-rxFw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=MWO0iwNin2iU/4xjEMRw1DhhQkcaI0DI5DYXrzcfKhk=;
        b=IObUN9FR/pTw+0t8u2MJVqnCXxpuoii4B69PBJR2yIcXo5HvTtqcpqPSHnZglhc3ht
         sbxrAfut9BUXgscMZ81994X5FFCtNL/MVa42aZjYrcXIBeRKQX5CJU680NMJdOg9AFl+
         sErVtoBjZ8EvG+EwJOkc77IZFe2PF9uyQDBofvMAwHebROMzlUsqTUQr0uaU4ttpa7nF
         ZylcMamTPSdyB56j7NKKnUlWGtrYWgc49IKCKLSiBIDg/C8BOLiTOQ3LHRu4IXIOPRql
         rxf89S8qyV8G3ykmD2LUIcXXJwBxWbjnJ4bZiPhtqHkhaoQQ0CAJPf0SPMjxZPCT0hhI
         br2Q==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

A while back I set up flowtables on my firewall, which is running
Fedora Server 33. I defined all of my network interfaces (physical and
virtual) as flowtable devices:

    flowtable f {
            hook ingress priority filter
            devices = { tun0, bond0, dummy0, bond1.999, bond1,
vrf-conntrackd, vrf-mgmt, enp66s0f1, enp66s0f0, enp5s0f1, enp5s0f0,
eno4, eno3, eno2, eno1 }
    }

I then configured the forward chain to offload all IPv4/IPv6 TCP and
UDP traffic to the flowtable:

    chain forward {
        type filter hook forward priority filter; policy drop;
        ip protocol { tcp, udp } flow offload @f
        ip6 nexthdr { tcp, udp } flow offload @f
        ct state established,related counter packets 0 bytes 0 accept
        ct state invalid drop
        [...] (various accept rules)
    }

This seemed to be working fine until yesterday, when an IPv6 SSH
session through an OpenVPN tunnel (terminating on the firewall)
between my home computer and a VM at work started locking up. I would
then start a new IPv6 SSH session to the same VM and it work fine for
a short while, and then it would lock up as well. The lock ups would
last a few seconds to a few minutes, and then resolve themselves
without me doing anything. It would work for a short while, then it
would lock up again, and so on. IPv4 sessions did not seem to be
affected.

I tcpdump'ed the incoming OpenVPN traffic on the tun0 interface while
simultaneously tcpdump'ing on the outgoing interface towards the VM,
and I noticed that when the lockups occurred, I would see incoming
traffic but no outgoing traffic. So at least I eliminated issues on
the Internet since traffic *was* coming in on the VPN.

I then added a rule in my trace chain to filter for IPv6 traffic
coming from my home computer with the source port of one of the SSH
connections I had that kept locking up:

    chain trace_chain {
        type filter hook prerouting priority -301;
        ip6 saddr 2682:272:9000:6::1:10 tcp sport 41000 meta nftrace set 1
    }

I ran 'nft monitor trace' and initially I didn't see anything, which I
assumed to be normal since the ASCII diagram at
https://wiki.nftables.org/wiki-nftables/index.php/Flowtable shows that
traffic gets shunted to the flowtable before the prerouting hook.
Then, the SSH session locked up again, and right before it resumed, I
suddenly saw an entry appear in the traces, matching this rule:

    ct state established,related

No other packet appeared UNTIL the SSH session locked up again, and
right before it resumed once more. Can something explain this
behavior? I don't know understand fully how flowtables work, but it
seems to me like suddenly there are no more hits for that specific
flow in the flowtable, and after a while the next packet in the
session no longer bypasses the classic forwarding path. That packet
then matches 'ct state established,related' and an established
conntrack entry, which then puts a new flow in the flow table, and the
subsequent packets then once again bypass the classic forwarding
path... until it locks up again.

I'm not sure where to look at this stage. I wanted to look at the
entry in the flow table, much like one can do for conntrack sessions,
but I couldn't find any info on the web regarding whether this is
actually possible or not.

Does anybody have any flowtable troubleshooting tips for me?

Thanks,
-Martin

P.S. The OS is Fedora Server 33 (kernel 5.10.17-200.fc33.x86_64) with
a manually compiled nftables (v0.9.8).
