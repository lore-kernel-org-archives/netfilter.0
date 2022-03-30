From: dynexbeats <dynexbeats@protonmail.com>
Subject: Re: SNAT not translating all iperf3 packets
Date: Wed, 30 Mar 2022 13:18:27 +0000
Message-ID: <yEcGLqhHskgVY7wumhBKGM9S6kNRnQ8-pHagTg0vXtJ_HKEOZoxHGoLE4khkcDvmFh2BKQJS_OWJiii978vjPncBxQ1PbRg61EjfwlIClL0=@protonmail.com>
References: <jj26twKvrI-lipy4OQOUOoSWPTixiZ6deMQSMefpuvI5yOBJ6GTguGkgAWONg-p8M1kihbGah28aZRYlXVtzqtLjCpNPci9CXpGwK3fhB8s=@protonmail.com>
Reply-To: dynexbeats <dynexbeats@protonmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1648646317;
        bh=TVuUtna9XUZUxzZ2YzXFZCAHGX3DBxQzc+wxo6h1OJM=;
        h=Date:To:From:Reply-To:Subject:Message-ID:In-Reply-To:References:
         From:To:Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID;
        b=OnABi2dANzRsY/70XH8c6Ks8ZvgL1ld1gJukRKlzosVKxBquKOnBSnpRscW6hYl0l
         soQM9BHQhgqprp2sxlSutn1LuqF2p8EGOxIrKFvG6/u4M049M7eLjnah8gPfxk2V2F
         NY1zvtMpXguggFOV5sdUsAAhnfVyrJK7FXIMKA3OtLIT47QUCDCo8HH8G+YkpFAYiv
         7nF8grEuDzeFLM+Nbl5Jcvp2jQxQFyhqeN7OgGQq4PjaurSNj9VSrXW2qG9bPxADdR
         C2R3Qv8R7gKPDD6I0DzsmwazZ0eLSmaKvhnj1WzsRy395E6nm5DFLEbLmaorNHhzTA
         ZF082Eyk+uSUA==
In-Reply-To: <jj26twKvrI-lipy4OQOUOoSWPTixiZ6deMQSMefpuvI5yOBJ6GTguGkgAWONg-p8M1kihbGah28aZRYlXVtzqtLjCpNPci9CXpGwK3fhB8s=@protonmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hello,

Just a follow up, after some further testing, I no longer see the symptoms =
of traffic flows not being SNAT'ted after implementing the following kernel=
 parameter on the host performing the SNAT (reboot was needed, not enough t=
o do ' sysctl -p '):

net.netfilter.nf_conntrack_tcp_be_liberal=3D1

Hope this helps others noticing these symptoms.

Take care.

------- Original Message -------

On Tuesday, March 29th, 2022 at 11:20 AM, dynexbeats <dynexbeats@protonmail=
.com> wrote:

> Hello,
>
> I am doing testing with iperf3 (multiple connections) through a Linux nod=
e that is performing SNAT on all IP traffic to a pool of IPs, and I am noti=
cing that a few iperf3 packets are not being SNAT'ted at all:
>
> snip of iperf3 server output
>
> [ 85] local 2.2.2.110 port 5201 connected to 3.3.3.4 port 37646
>
> [ 87] local 2.2.2.110 port 5201 connected to 3.3.3.4 port 37648
>
> [ 89] local 2.2.2.110 port 5201 connected to 3.3.3.4 port 37650
>
> [ 91] local 2.2.2.110 port 5201 connected to 192.168.20.20 port 37652
>
> [ 93] local 2.2.2.110 port 5201 connected to 3.3.3.4 port 37654
>
> [ 95] local 2.2.2.110 port 5201 connected to 3.3.3.4 port 37656
>
> /snip
>
> I noticed a few threads in this mailing list mentioning that conntrack pa=
ckets/flows that are viewed as INVALID will not be SNAT'ted, however I am n=
ot understanding how that can be with the traffic I am generating with iper=
f3. It appears that all the connections iperf3 is generating are essentiall=
y the same with the exception of the source port (look to be increments of =
2).
>
> The session does appear to be normal (or valid) as per the " conntrack -L=
 " output:
>
> snip of ' conntrack -L ' output
>
> tcp 6 282 ESTABLISHED src=3D192.168.20.20 dst=3D2.2.2.110 sport=3D37646 d=
port=3D5201 src=3D2.2.2.110 dst=3D3.3.3.4 sport=3D5201 dport=3D37646 [ASSUR=
ED] mark=3D0 use=3D1
>
> tcp 6 282 ESTABLISHED src=3D192.168.20.20 dst=3D2.2.2.110 sport=3D37648 d=
port=3D5201 src=3D2.2.2.110 dst=3D3.3.3.4 sport=3D5201 dport=3D37648 [ASSUR=
ED] mark=3D0 use=3D1
>
> tcp 6 282 ESTABLISHED src=3D192.168.20.20 dst=3D2.2.2.110 sport=3D37650 d=
port=3D5201 src=3D2.2.2.110 dst=3D3.3.3.4 sport=3D5201 dport=3D37650 [ASSUR=
ED] mark=3D0 use=3D1
>
> tcp 6 282 ESTABLISHED src=3D192.168.20.20 dst=3D2.2.2.110 sport=3D37652 d=
port=3D5201 src=3D2.2.2.110 dst=3D192.168.20.20 sport=3D5201 dport=3D37652 =
[ASSURED] mark=3D0 use=3D1
>
> tcp 6 431982 ESTABLISHED src=3D192.168.20.20 dst=3D2.2.2.110 sport=3D3765=
4 dport=3D5201 src=3D2.2.2.110 dst=3D3.3.3.4 sport=3D5201 dport=3D37654 [AS=
SURED] mark=3D0 use=3D1
>
> tcp 6 282 ESTABLISHED src=3D192.168.20.20 dst=3D2.2.2.110 sport=3D37656 d=
port=3D5201 src=3D2.2.2.110 dst=3D3.3.3.4 sport=3D5201 dport=3D37656 [ASSUR=
ED] mark=3D0 use=3D1
>
> /snip
>
> Is there anything that I am missing or not taking into consideration??
>
> Here is the iperf3 (client side) command I am using:
>
> iperf3 -Z -t 300 -P 37 --connect-timeout 2000 -c 2.2.2.110
>
> -Z =3D zerocopy /// -t =3D duration in seconds (5min) /// -P =3D parallel=
 connections or streams
>
> Here is the nftables ruleset for the forwarding and SNAT function:
>
> table inet testing {
>
> chain forward {
>
> type filter hook forward priority 0; policy drop;
>
> ct state { established,related } limit rate 200 mbytes/second burst 64 kb=
ytes counter accept;
>
> ct state { new } counter accept;
>
> }
>
> chain postrouting {
>
> type nat hook postrouting priority srcnat;
>
> ip protocol {tcp,udp,icmp} oif vlan2001 snat to 3.3.3.3-3.3.3.4;
>
> }
>
> }
>
> Linux node performing SNAT is running 5.13.0-27 kernel.
