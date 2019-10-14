From: "Jonathan Rudenberg" <jonathan@titanous.com>
Subject: flowtable breaks masquerade for dnat flows
Date: Sun, 13 Oct 2019 20:47:57 -0400
Message-ID: <66954409-3fcc-4319-a691-d65e80e2648f@www.fastmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=titanous.com; h=
        mime-version:message-id:date:from:to:subject:content-type; s=
        fm1; bh=3O1y8jZyS+oEUQmxwI8FyNbm9+OIg6g6nljYCZbT9YE=; b=i3IPUHI8
        SjI6eVB14zRs2BEiFOwaAIjTXYkj2CzU7mNV2t+OxjfU5Fyy34EvrLVcRZbpUvxI
        dbUeVGFCkWOQdao3W/S7Xhcrz5ZHR53uq3zc14rU82no4wieW+/YPZWAfcPCBOjX
        K1Fr63VByt1Vwj8M/A2SzuCDLKeENViN5s5b3UlvWqkpyLp4T2DBgIDP8c8TbzlA
        VZjlqS4vQJCe/iBvxAl//ZK9YB4UodE9eaQI4ir1vM1db7mRLPmVQIKgTGEqc8bv
        nwFLR4bmaGQmbX413Tl4fSpS/z/LG8p9OiL49ucLOiJl0wpVDDDiuhFW359weOiL
        isMHAg240/cXqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-type:date:from:message-id
        :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm1; bh=3O1y8jZyS+oEUQmxwI8FyNbm9+OIg
        6g6nljYCZbT9YE=; b=P4BFO+M9wLMt0SBFadTmEdiDEZU9YN2I4nfA4MuAeoOvM
        P+5RYxMCKOkXAyjAWaUmepaaJN82k+SSz1S7dGUqDEMohML7ZtlASKjBD611z/uF
        /aPsaAyfzFFvO7pwcdfdg5zgD1tQ0d40JBuCbHazMJjb/HqcbOdx1w/3KR0xSSGh
        JBBmuKVnVvhg5VD/fTa1y2kDQuYng+X02PP26hyvp/zKBB3ZURMQ8+KoOxl7npzD
        K3+thb6LOmXnySzREuMRISv4KTJ10EUEqY6Pufil/K8U5WRNwzpJQZ+QT6bj9Tok
        2Ytf9ERSKJ3Rn/zDfbWUWzLrnhHXmLqc2XacUMYNA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I'm on kernel 5.3.5 with nftables v0.9.2 using I211-AT NICs.

I set up a very basic routing/NAT setup with masquerade SNAT and DNAT for a single port. With no flowtable, everything works as expected. When the flowtable is enabled, the egress packets for flows associated with the DNAT port (source 172.17.2.128:32400 in the example config below) do not have their source address rewritten by the masquerade rule and are emitted onto enp1s0 with the IP 172.17.2.128 instead of the IP of enp1s0. Regular SNAT/masquerade flows work fine with the flowtable on.

A minimized example is below, let me know if there's any other information I can provide.

Jonathan

table inet filter {
  chain input {
    type filter hook input priority 0; policy drop;
    ct state {established, related} accept
    tcp dport 32400 accept
  }

  chain output {
    type filter hook output priority 0; policy accept;
  }

  flowtable ft {
    hook ingress priority 0; devices = {enp1s0, enp2s0};
  }

  chain forward {
    type filter hook forward priority 0; policy accept;
    ip protocol flow add @ft
  }
}

table inet nat {
  chain prerouting {
    type nat hook prerouting priority 0;
    iif enp1s0 tcp dport 32400 dnat ip to 172.17.2.128
  }

  chain postrouting {
    type nat hook postrouting priority 100;
    oif enp1s0 masquerade
  }
}
