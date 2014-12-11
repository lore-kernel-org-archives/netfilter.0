From: leroy christophe <christophe.leroy@c-s.fr>
Subject: Re: Problem setting up nftables dnat : dport set to 0 instead of
 requested value (22)
Date: Thu, 11 Dec 2014 14:12:46 +0100
Message-ID: <5489984E.2050601@c-s.fr>
References: <54885B08.1010700@c-s.fr> <20141210182244.GA5622@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20141210182244.GA5622@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>, arturo.borrero.glez@gmail.com
Cc: netfilter@vger.kernel.org, GUITTON Alex <alex.guitton@c-s.fr>


Le 10/12/2014 19:22, Pablo Neira Ayuso a =E9crit :
> On Wed, Dec 10, 2014 at 03:39:04PM +0100, leroy christophe wrote:
>> Hi,
>>
>> I'm trying to redirect incoming tcp connections for port 222 to
>> local port 22 (because I will dnat incoming connections for port 22
>> to another destination).
> Then you have to use "redirect" instead of "dnat". "redirect" will be
> available since the upcoming 3.19-rc.
>
> Cc'ing Arturo, he has worked on the redirect support.
>
> @Arturo: Could you add documentation for your 'redirect' support to ?
>
> http://wiki.nftables.org/wiki-nftables/index.php/Performing_Network_A=
ddress_Translation_%28NAT%29
>
> Thanks.
>
Thanks for the information.

I have now applied patches 8d13edd, 9de920e and e9105f1 on my 3.18=20
kernel, so now the redirect rule is accepted, but I still get the same=20
issue: dport gets value 0 instead of 22 after the redirect, see below

Is there any other patch to apply ?

Christophe


[  932.304106] redir IN=3Deth0 OUT=3D=20
MAC=3D08:00:51:20:44:5b:08:00:27:fe:42:1e:08:00 SRC=3D172.25.231.37=20
DST=3D172.25.231.5 LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D22863 =
DF PROTO=3DTCP=20
SPT=3D55116 DPT=3D222 WINDOW=3D14600 RES=3D0x00 SYN URGP=3D0
[  932.304523] rejected IN=3Deth0 OUT=3D=20
MAC=3D08:00:51:20:44:5b:08:00:27:fe:42:1e:08:00 SRC=3D172.25.231.37=20
DST=3D172.25.231.5 LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D22863 =
DF PROTO=3DTCP=20
SPT=3D55116 DPT=3D0 WINDOW=3D14600 RES=3D0x00 SYN URGP=3D0


# nft list ruleset -nn
table ip filter {
         chain input {
                  type filter hook input priority 0;
                  oifname "lo" accept
                  ct state established,related accept
                  ct state new tcp dport 22 log prefix "ssh " accept
                  ip protocol icmp accept
                  udp dport { 631, 137, 68, 67, 1534, 17500, 138} drop
                  log prefix "rejected " reject with icmp type=20
host-prohibited
         }
}
table ip nat {
         chain prerouting {
                  type nat hook prerouting priority 0;
                  tcp dport 222 counter packets 1 bytes 60 log prefix=20
"redir " redirect :22
         }

         chain postrouting {
                  type nat hook postrouting priority 0;
                  ip saddr 192.168.0.3 oif eth1 masquerade
         }
}


