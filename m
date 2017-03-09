From: Sun Paul <paulrbk@gmail.com>
Subject: Problem on traffics after removing rule in nftables
Date: Thu, 9 Mar 2017 10:54:08 +0800
Message-ID: <CAFXGftKeBF7yeOse-GNby2qc-Jw3KRbSZY3OMgmsqaH=v=QzAw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=v+tbfWWIrLGoPRkteWzpYJhJQYG7TJ+x1eFJigFs7Ps=;
        b=AO1DikW6odh2t7yg2jvvKd3H+HL9seDBBIyA+G3BHKLIHYgouMrUf/wGC+kCaN8Rt2
         41XXSrKkxUdn1mLoyxqFQI91Q3dQ3cnDnAmNaRt5AYNuuQmAFJ9k0FTjbnUNe9pBxOo4
         4hynxvpLjXNs2NvE2TYmeNqMbA8T1g2vvb8BFkidnqk4RhRaZPtNQC+IETP4zMI7G63n
         7+6wk0s14KEhQ02RSYIsfMSSwpSmA3GIIRjrnfbQuT08+VZhV7bDNnsJ3aRE/DvKy6Ej
         hP1pDR2NK6Pt28nDie73VFR7DUi1MKnZJpp//8xQLV0PkqDVXwzXuV2KGKixvGSd3esk
         vXmw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi

we are testing the NAT in nftables.

we are running SCTP traffics with below rules originally.

table ip nat {
        chain prerouting {
                type nat hook prerouting priority 0; policy accept;
                sctp dport diameter ip saddr 10.0.1.51 ip daddr
10.0.1.46 dnat 10.1.1.47
                sctp dport diameter ip saddr 20.0.1.51 ip daddr
20.0.1.46 dnat 20.1.1.47
        }

        chain POSTROUTING {
                type nat hook postrouting priority 0; policy accept;
                ip daddr 10.0.1.51 snat 10.0.1.46
                ip daddr 20.0.1.51 snat 20.0.1.46
        }

        chain postrouting {
                type nat hook postrouting priority -150; policy accept;
        }
}

the SCTP traffics be be NATed.

then we remove the rule "sctp dport diameter ip saddr 10.0.1.51 ip
daddr 10.0.1.46 dnat 10.1.1.47", but we still see the traffics is go
through.

is there any command needed to refresh the nftable? or we need to
delete the state using conntrack tools?
