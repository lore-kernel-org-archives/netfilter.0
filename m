From: Peter Hudec <peter@home.hudecof.net>
Subject: nft add element .. too many fiules opened
Date: Thu, 28 Apr 2022 14:53:21 +0200
Message-ID: <1ECEF323-1FB2-4332-A5BF-81B5D4B9D394@home.hudecof.net>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=home.hudecof.net;
        s=2020; t=1651150402;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=MlY1xFt7IhAYUXQh5qdCEwgvSq+StmzrlGC8zNyamv4=;
        b=OLqhXFFg8r2sOYeOjJ9WlNhtVGp3QffheLiy5w7uH9oIe26OaOLbiDuZvDUa6TFQvz9R4Q
        4IXkN2uDhG9bS2X47c+P/aH0Q+q4uZiFxyLgrZpsc+1UywUcohuubcu0uwaNosZL9dVypH
        Yf+KKUyfy2uOUollpl58r6v8pRFK87UIVe82kyF3C8QqpOMkl76FSzPYtGC9A9c5QOeQvF
        lrZgS5JY/N3wyqGCBO4Aq44nszBNk8ECL22PsVQDe/tgFw92LTFI4hNolUiLPQdolHLMQA
        rO5ydcIa2ftlFq9xnxPUIvTTS7PHmBoC/hDBYU3aRBQS7KiP50VeWbY6afseYQ==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hi there,

we have very strange problem with the nftables.
Our firewall is using heavly the sets and the update of the sets from =
the path.

First see part of the firewall, ignore the elemtns in the sets, I just =
keep few as a sample. Normaly there is about up to 600 records.
The firewall acts as captive, the elemnts are added externaly by script =
after user/ip authentification.

The problem is, that after some time I have got =E2=80=9CToo many files =
opened =E2=80=9C on captive_keepalive set. The update from the path also =
stoped working.

#  /usr/sbin/nft add element ip captive captive_keepalive { =
10.148.128.168 };
Error: Could not process rule: Too many open files in system
add element ip captive captive_keepalive { 10.148.128.168 }
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

os: rocky linux 8.4
# uname -a
Linux captive-fw02.pssfo5g.local 4.18.0-305.25.1.el8_4.x86_64 #1 SMP Tue =
Nov 2 10:32:37 UTC 2021 x86_64 x86_64 x86_64 GNU/Linux
# rpm -qa | grep nft
python3-nftables-0.9.3-18.el8.x86_64
libnftnl-1.1.5-4.el8.x86_64
nftables-0.9.3-18.el8.x86_64

The captive_keepalive is for tramking user activity, in 1m timescale, =
there us nf queue to send log to userspace.
The captive_alive is for user inactivity, if the user is not passing the =
traffic for 1h the user/ip is disconnected.
The captive_active is hardlimit, disnonnect user for 12h even if is =
working.

Anu idea what=E2=80=99s wrong? Seems to be some big in kernel ;(
]

table ip captive {
        set captive_keepalive {
                type ipv4_addr
                size 65535
                timeout 1m
        }

        set captive_alive {
                type ipv4_addr
                size 65535
                timeout 1h
                elements =3D { 10.148.128.2 expires 9h58m10s216ms, =
10.148.128.3 expires 5h47m42s813ms,
                             10.148.129.67 expires 27m35s526ms }
        }

        set captive_active {
                type ipv4_addr
                timeout 12h
                elements =3D { 10.148.128.2 expires 9h58m10s216ms, =
10.148.128.3 expires 5h47m42s813ms,
                             10.148.128.5 expires 5h39m47s568ms, =
10.148.128.6 expires 9h5m55s457ms,
                        =20
                             10.148.129.63 expires 8h28m25s802ms, =
10.148.129.67 expires 8h39m29s138ms }
        }

        set captive_clients {
                type ipv4_addr
                flags interval
                elements =3D { 10.148.128.0/20, 10.148.253.0/24 }
        }

 =20
        chain forward {
                type filter hook forward priority filter; policy drop;
                iifname !=3D { "eno1" } ct state established,related =
accept

                iifname { "eno1" } ip saddr !=3D @captive_alive reject =
with icmp type admin-prohibited
                iifname { "eno1" } ip saddr !=3D @captive_active reject =
with icmp type admin-prohibited
                iifname { "eno1" } ip saddr @captive_alive jump =
update_alive
                iifname { "eno1" } reject with icmp type =
admin-prohibited
                iifname { "eno2" } reject with icmp type =
admin-prohibited
        }

        chain update_alive {
                ip saddr !=3D @captive_keepalive jump update_keepalive
                accept
        }

        chain update_keepalive {
                update @captive_alive { ip saddr }
                update @captive_keepalive { ip saddr }
                log prefix "client keepalive update: " group 1 accept
        }

}

	regards
		Peter

