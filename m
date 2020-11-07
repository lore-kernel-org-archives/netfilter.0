From: Ameen Al-Azzawi <ameen.azzawi@gmail.com>
Subject: IP MASQUERADE isn't being applied on all outgoing packets.
Date: Sat, 7 Nov 2020 10:07:20 +0100
Message-ID: <CABcvXqJJg7gv5fFy3dk6qQ1fay-Vq3cFA-GCvwGpcTDuHARo3Q@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=PzJbbbT6uxCYrVb1rdMihO5D/iMjkwDGhJmWN83/8B4=;
        b=mDIL//7ZW3pnufL+Ffrfy9r/lxAUvpuy5h31CVKy917edBMPnxrXSKYFBn4jis4iqu
         MkwWYaam5Rpj5kMhdt2ZkrRLRnqmvY4vf+OXdImLE0tj3w/ss2zgSmJ73SF1AAuKDuv6
         n6yR9zc4YeTmdrYeiCHLgivh0yBRdUmYNeGnKOlihFvwpLUvcF4Z6q5E5s7/hPu1wW5/
         2T3B4TwcrMuwRuiRzuRtA6SOSXjrZdzi6hLIVXq3ItE9zR28VhdM0ayTI0UFqw+oVqn8
         XPJhrwPqJXrE0/he6I1fVnX4+usNdGBvm/LimEyW1nmg5/zXtlHpNmAWNJk0k/FBB7yD
         ckRQ==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hello,

I am doing my research in IPv6 transition technologies, right now I am
building a test-bed with Debian-based virtual machines, for testing
purposes.
There is this topology called 464XLAT, of IPv6-IPv4 transition.

On VM-3, I am implementing iptables with (-j masquerading) argument.
Packets leaving from eth2 (of VM-3) have to have the new src address
(198.51.100.1) on their way out toward VM-4.

|  VM-1  |eth1             |  VM-2  |              |  VM-3  | eth2
            eth1 |  VM-4  |

VM-1 eth1 : 10.0.0.2
VM-3  eth2 : 198.51.100.1
VM-4 eth1 : 198.51.100.2

I am flooding (VM-4) with SYN packets using the hping3 command (from
VM-1 toward VM-4).

hping3 -S  -p 80 198.51.100.2 --flood

The iptables rule is implemented on (VM-3).

iptables -t nat -A POSTROUTING -o eth2 -j MASQUERADE

VM-3 is actually using TAYGA software (ipv6-ipv4 translator).

The masquerading isn=E2=80=99t working for some packets and the source IP
isn=E2=80=99t changing.
The below tshark results (for some packets) show the original source
IP address (10.0.0.2) coming out of VM3-eth2.

 root@PLAT:~# tshark -i eth2 -T fields -e ip.src -e tcp.srcport -e
ip.dst -e tcp.dstport -e ip.proto
Capturing on 'eth2'
198.51.100.1    5000    198.51.100.2    80      6
198.51.100.2    80      198.51.100.1    5000    6
10.0.0.2        5000    198.51.100.2    80      6
10.0.0.2        5000    198.51.100.2    80      6

To sum up, the rule is working for most of the packets and doesn=E2=80=99t =
for others.

Is this a familiar thing? Or I am missing something here?
Any feedback would be really appreciated.

Kind Regards
Ameen
