From: =?UTF-8?Q?Paw_M=C3=B8ller?= <pawsen@gmail.com>
Subject: Nftables: masquerade and forwarding firewall together
Date: Wed, 23 Nov 2016 15:54:27 +0100
Message-ID: <CAP6xULG5=xFQQLnq+T_=snwHA0TNTW2mE9SswV4DD3cjf-AgCA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to;
        bh=W4zp8dB2VqiYr7GgiMlNFdlT1Qg89SKfxR/4RTBkoX0=;
        b=WQPvXGU7SW0z62xgmhH+XTAu3ICj7Aohkzi167WqFcpDi3o4amLlq+hWxIPwQ2QAqJ
         233VpNDP1Jq4B+5YV8lwj12rElFaMQVHcwdtbJM4zkMC7r5ii6uExOrcUN+KYF/K3W+b
         +taKsDJSdnHFXBClyb7p/Sn6pOcUQUdpxOZMixq2A9yUcqKpW9YRDXKUNgrf7O/xmPSj
         JPsowXuf72e/TKTjNY1sH1UQZSirr5I1OxLEWDLfxglyZPyydWZCDQeq7JdyjYth8ng1
         TLbemAEVAwgFmWZZpVJkF4SgVq3EVE2ViMPNtCvHNfIEFlralgxWNqMxr5LEY3IRZdQY
         qiDA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org, holger borum <holger.stadel.borum@gmail.com>

Dear all,

I have a firewall, doing NAT using masquerade for my internal network (I live at
a dormitory). This works well. however we have a small pool of fixed
external IPs,
which some of the people here would like to use.

But I do not understand how I get nftables to do masquerade for the internal net
while only forwarding the traffic from VLAN50 with external ip(see below [2]).

I have copied a small example of how I am trying to do the config.
I have:
  iif $dmz_if oif $ext_if accept
before masquerade in the nat postrouting chain. This does not work.
How should I do it? Something with a goto somewhere?


Another question:
Can I flush a table depending on whether the table exists? Eg like:
if (table ip) exist
   flush table ip filter
The reason for this is that I use fail2ban and have the following

$ cat nftables.conf
  flush ruleset
  include "/etc/firewall.d/fail2ban.conf"
  include "/etc/firewall.d/firewall.conf"

So that I can reload only the firewall by doing
$ nft -f /etc/firewall.d/firewall.conf

I hope someone can help. I use systemd-network.[1]
Best regards,


--
Paw

[1]
eth0 is the Interface connected to the "internet". eht1 contains all the VLANS.
$ cat /etc/systemd/network/eth0.network
  [Match]
  Name=eth0

  [Network]
  Gateway=130.226.aaa.xxx
  DNS=8.8.8.8
  IPForward=ipv4
  IPForward=ipv6

  [Address]
  Address=130.226.aaa.bbb/26

VLAN50 has the following
$ cat /etc/systemd/network/vlan50.net*
  [NetDev]
  Name=vlan50
  Kind=vlan

  [VLAN]
  Id=50
  [Match]
  Name=vlan50

  [Network]
  Address=130.226.aaa.bb1/27
  IPForward=ipv4


[2]
# Outgoing interface
define ext_if  = eth0
define ext_ip  = 130.226.aaa.bbb
define int_net = 10.42.0.0/16

# VLAN with external IPs. Don't masquerade
define dmz_if = vlan50
define dmz_net = 130.226.aaa.bb0/27

# internal VLANS. Do masquerade
define cosmos_if = vlan11
define cosmos_net = 10.42.11.0/24

define all_ifs =  { $cosmos_if, ...}
define all_nets = { $cosmos_net, ...}

table ip filter {
  chain input {
    type filter hook input priority 0;

    ct state established,related accept
    ct state invalid drop

    iifname lo accept
    iif $dmz_if oif $ext_if counter accept

    tcp dport 22 limit rate 15/minute accept
    ip saddr $all_nets tcp dport ssh accept

    iif $ext_if counter drop
    udp dport { 137, 138, 5353 } drop    # NetBIOS, Avahi
    udp sport 17500 udp dport 17500 drop # Dropbox LANsync

  }
  chain forward {
    type filter hook forward priority 0;
    ct state established,related accept
    ct state invalid drop

    # allow local traffic
    iif $all_ifs  ip saddr $all_nets  accept
  }
  chain output {
    type filter hook output priority 0;
    ct state {established, related} accept
    ct state invalid drop
    oifname lo accept
  }
}

table ip nat {
  chain portforward {
  }
  chain prerouting {
    type nat hook prerouting priority -150;
    goto portforward
  }
  chain output {
    type nat hook output priority -150;
    goto portforward
  }
  chain input {
    type nat hook input priority -150;
    # this chain is needed to make dnat from the output chain work
  }
  chain postrouting {
    type nat hook postrouting priority -150;
    # accept dmz_if as it is and do masquerade on the rest
    iif $dmz_if oif $ext_if accept
    oif $ext_if masquerade
  }
}
