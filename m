From: sreejith menon <sreejithjmenon@gmail.com>
Subject: Re: Iptables Drop rule - strange behaviour
Date: Sat, 16 Jun 2012 17:52:18 +0530
Message-ID: <CACJKonoaTzoo-ppEOKcxgQ-3kQ7FpcVgyZ4NTr5EZcaZRgxikA@mail.gmail.com>
References: <CACJKonoWuj1=He00eD7e9YENHXvwEY1Hmg6_Cjq5GeYT6DchoQ@mail.gmail.com>
	<CACJKonpcSF2X2PPBZzg_ZuEO6FNvPQ6AQEH4nSQWf4natD36=w@mail.gmail.com>
	<CACJKonp5yY9Gt8s+9Zc4wXHhbGdamJF257OhbV4hktSA5E3V1w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type:content-transfer-encoding;
        bh=7ljg7C5gRx59zsKbfyN0OikbF0qEfxIPQAOgfib/FZw=;
        b=zKYAGdZG9kZqF66UdojzFPIGTTznvn7tPhUevWIU+6g3UyC9hT+BMfhl81pmnfdfgq
         PpIE0yKQB/STnOoJrlDGTAO8+AQoAaw9OadxnZyUG4Khl2pPnPQ8fZ9Ww4q0ZUocC6h4
         Q6tBVAHX+l1WaMSkOATbNwvPlIwwSRP9nDhvF/ge+STbyGHB7M7QEnqQF4whPAg/+2Ws
         65eMfw6G71K3K7cwecIiMW9RsfILtR7NNGAUxsZX9SXk5NL9Ilzmu4CLTTXnXm7A6xNa
         ptM7huLx6/cJlIwlQHZ6KpPHEXTzqIl9oQx+QnCQA0FyNRjF50yjUlbvsKgB7URYsh2Z
         PeuQ==
In-Reply-To: <CACJKonp5yY9Gt8s+9Zc4wXHhbGdamJF257OhbV4hktSA5E3V1w@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

On Sat, Jun 16, 2012 at 1:20 PM, sreejith menon
<sreejithjmenon@gmail.com> wrote:
> Hi,
>
>> This is not correct syntax but should illustrate the pieces needed f=
or the
>> single rule you want:
>> -A FORWARD -i eth0 \
>> =A0 =A0 =A0 =A0 =A0-source range 172.31.114.1-172.31.114.254 \
>> =A0 =A0 =A0 =A0 =A0 -dest range 10.2.2.1-10.2.2.254 \
>> =A0 =A0 =A0 =A0 =A0-protocol tcp \
>> =A0 =A0 =A0 =A0 =A0 =A0 -destport 22 \
>> =A0 =A0 =A0 =A0 =A0 =A0 -m state --state NEW \
>> =A0 =A0 =A0 =A0 =A0 -j DROP
>
>


I have further narrowed down the problem. I added a single rule in
=46ORWARD Chain to reject ssh packets from 172.31.114.239 to 10.2.2.5 t=
o
REJECT instead of DROP

 iptables -nvL
Chain INPUT (policy ACCEPT 15 packets, 1260 bytes)
 pkts bytes target     prot opt in     out     source               des=
tination

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               des=
tination
    0     0 REJECT     tcp  --  *      *       172.31.114.239
10.2.2.5            tcp dpt:22 reject-with icmp-port-unreachable

Chain OUTPUT (policy ACCEPT 13 packets, 1316 bytes)
 pkts bytes target     prot opt in     out     source               des=
tination


Observation
-----------------
1) ssh from 172.31.114.239 to 10.2.2.5 -  ssh rejected with icmp port
unreachable once. Counter increased by 1.
2) Again ssh from 172.31.114.239 to 10.2.2.5 - ssh dropped but no icmp
port unreachable received. Counter not increased.
3) ftp  from 172.31.114.239 to 10.2.2.5 - ftp dropped and no  Counter
got increased.


Another test scenario
--------------------------------

Instead of forwarding i decided to apply the same scenario to the INPUT=
 rule

 iptables -nvL
Chain INPUT (policy ACCEPT 23 packets, 1820 bytes)
 pkts bytes target     prot opt in     out     source               des=
tination
    0     0 REJECT     tcp  --  *      *       172.31.114.239
172.31.114.253      tcp dpt:22 reject-with icmp-port-unreachable

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               des=
tination

Chain OUTPUT (policy ACCEPT 17 packets, 2116 bytes)
 pkts bytes target     prot opt in     out     source               des=
tination

Observation
------------------
1. ssh packets from 172.31.114.239 to 172.31.114.253 always rejected.
Counter always increased.
2. No problem with the ftp packets ie always allowed.


Summary of Observation
------------------------------------
There seems to be some drop problem with different ports in Forward
Chain. Input chain works fine.
Since the DROP counter are not increased for tcp packets, i feel like
all tcp packets are getting dropped once the drop rule is hit.

If either source or destination ip changes ie ssh/ftp to a different
machine with the same set of rules in FORWARD chain, it is allowed.

thanks and regards
sreejith
