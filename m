From: Martin Zaharinov <micron10@gmail.com>
Subject: bug report and future request
Date: Mon, 21 Mar 2022 22:44:20 +0200
Message-ID: <AE6DAC96-EC3E-43C9-A95A-B230842DD7B1@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:content-transfer-encoding:mime-version:subject:message-id:date
         :to;
        bh=sCcxXQ3JXyyUY+QKQmyB4kqCuQx/Wl1tefqbMGnUfP4=;
        b=jrdmQ3vRDmw38RvQzgh1WAbGn7EPwhZpg3JALGChC/a9Sfp0cGAcZEC/JyoBq6RGdO
         sty92u8hLeox7ILLT7axeeSLHKgNj1YD0BQl0Fnk49pOPtkw0+iWPkSparthzkPAXJFg
         ByLkvULbFAOCEBwnR6O3qRw/N39FNLgFTIcH7IjGsjgIvsfNKdrakEsDjIRFCuPTnMyf
         8IDTJkz5GiZbmjYvUfg2++gi5eSMR4dZFc+x+b8B3UsEmhuApmEYWea48W+sAvUX6RXx
         5TeuYhyhOX+4SWbqBv8IJjTualHE4Zz79//m75h25MRm5St2VeUG/eKYJbsHtfISqcBf
         0b/A==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Florian Westphal <fw@strlen.de>, netfilter <netfilter@vger.kernel.org>, netfilter-devel@vger.kernel.org, pablo@netfilter.org

Hi Netfilter team

first is it posible to fix this:=20

You can delete the rule whose handle is 5 with the following command:
% nft delete rule filter output handle 5
Note: There are plans to support rule deletion by passing:
% nft delete rule filter output ip saddr 192.168.1.1 counter

but this is not yet implemented. So you'll have to use the handle to =
delete rules until that feature is implemented

This is from Docs:

=
https://wiki.nftables.org/wiki-nftables/index.php/Simple_rule_management#R=
emoving_rules


if have 1k rule

table inet nft-qos-static {
        chain upload {
                type filter hook postrouting priority filter; policy =
accept;
                ip saddr 10.0.0.9 limit rate over 12 mbytes/second burst =
50000 kbytes drop
.........
ip saddr 10.0.0.254 limit rate over 12 mbytes/second burst 50000 kbytes =
drop
        }


        chain download {
                type filter hook prerouting priority filter; policy =
accept;
                ip daddr 10.0.0.9 limit rate over 12 mbytes/second burst =
50000 kbytes drop
........
ip saddr 10.0.0.254 limit rate over 12 mbytes/second burst 50000 kbytes =
drop
        }
}

and problem is not easy to delete rule for ip 10.0.0.100 or othere in =
list .
if use handle and list all rule  for example 4k and parse handle on =
every 10-15 sec will load cpu with this.


and second:

is it posible in this rule ppp*

table inet filter {
        flowtable fastnat {
                hook ingress priority 0; devices =3D { eth0, ppp* };
        }

        chain forward {
                type filter hook forward priority 0; policy accept;
                ip protocol { tcp , udp } flow offload @fastnat;
        }
}


or vlan* , the problem is on system dynamic up vlan or ppp is auto up =
when user is connect


If there options to fix and add this options will be great,

thanks in advance

Martin.=
