From: Jacek Tomasiak <jtomasiak@arista.com>
Subject: Matching on protocols inside IPv6 IPSec AH (legacy vs nft)
Date: Thu, 22 Jun 2023 15:25:44 +0200
Message-ID: <CAPEBPyMNe5dPTC9Dwp888M5RR-2ThC7ZtuaQPxNG+5VqbJinsQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1687440355; x=1690032355;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WhPjw545Ihkp/pKrkm4t0rzMp8dJ/tFpD47YlNq2r5s=;
        b=h2EJOze8aiQ5tm0TUq1la8OWBqge+Ddo+eAuNVAiE/klB2cUB+AVf/6JtO6VwOMkeE
         Li1J+ug6QiIUwJ+bjIQGhc9NdISzNVmxPWNOZVzrPiJQtr3eNrV5RvQt67F6oAvUxVf0
         JC9/6uCeMYEeKHTWUo3OWug9NVoMu7BiZjcKy0NP6wdv/baYC67IfME4yB/VszmP9DkY
         9Vwbc+xKeGjV4GK30GCqOQuCzhCciURl+w4fPxaL4LkBP/lGsGodUiJrvtle/3yNnAcX
         X5MP1//hUnj97YSceLlc7LHSNeSBO4gZJ+q80nNzWY/tU4U9bnqXZriq91j0UJdQxpKn
         7haA==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

I'm working on migrating from legacy iptables to iptables-nft and I encountered
a change in behaviour in handling the IPSec AH protocol.

With following two ipv6 rules:
-A INPUT -p ipv6-icmp --icmpv6-type echo-request -j ACCEPT
-A INPUT -m ipv6header --header ah --soft -j ACCEPT

After sending packets with following scapy code:
# ping6 without AH
pck = IPv6()/ICMPv6EchoRequest()
send(pck)
# ping6 with AH
sa = SecurityAssociation(AH, spi=0)
apck = sa.encrypt(pck)
send(apck)

I get this from ip6tables-nft -vS:
-P INPUT ACCEPT -c 0 0
-P FORWARD ACCEPT -c 0 0
-P OUTPUT ACCEPT -c 0 0
-A INPUT -p ipv6-icmp -m icmp6 --icmpv6-type 128 -c 1 48 -j ACCEPT
-A INPUT -m ipv6header --header ah --soft -c 1 64 -j ACCEPT

Hovewer, with ip6tables-legacy -vS:
-P INPUT ACCEPT -c 1 48
-P FORWARD ACCEPT -c 0 0
-P OUTPUT ACCEPT -c 1 48
-A INPUT -p ipv6-icmp -m icmp6 --icmpv6-type 128 -c 2 112 -j ACCEPT
-A INPUT -m ipv6header --header ah --soft -c 0 0 -j ACCEPT

My main concern is that in the nft version the AH rule matches one of the ICMP
packets even though the ICMP rule is higher up on the list.

I tried to debug this and it seems to be related to this change:
https://github.com/torvalds/linux/commit/568af6de058cb2b0c5b98d98ffcf37cdc6bc38a7
IIUC, this "stop ipv6_find_hdr on AH" is not a regression but intended behavior.

Now the question: is there some way to define rules which will match
the same way
as it works in iptables-legacy? That is, look at the inner protocol
and not stop on
AH?

Best Regards,
Jacek Tomasiak
