From: Martin Zaharinov <micron10@gmail.com>
Subject: Re: bug report and future request
Date: Thu, 24 Mar 2022 09:52:33 +0200
Message-ID: <FE0EEED5-48C9-412F-81BA-0028818C2EE8@gmail.com>
References: <AE6DAC96-EC3E-43C9-A95A-B230842DD7B1@gmail.com>
 <20220321212750.GB24574@breakpoint.cc>
 <4B0C8933-C7D8-49BA-B7F2-29625B0865C1@gmail.com>
 <20220322103203.GD24574@breakpoint.cc>
 <04C4931B-553E-4FEA-85D4-B3E186520EE5@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=KLLeo4LszK5mKM9gvwQ86fwffJ82iNHFXheNCrZ6MPg=;
        b=Sel29aJsin6ZEl/540tmDB3k1Byhb+vLDP1FQ1yHxDmY4x0JKE34Kp8a35oNkCnDKe
         MrM705EirsIJGb6Odikxl2znuQ9y9ZK0Df4BaIpj+fGiKPrRXm+pls/CmVCqXtdSVM1H
         sw1upCwo/6burE1iFsf1RYSwy+LevH7IDZkNM99dGHn3I7jSl2/z71ITZ3dQ4/Y2g/ta
         +tIz3jvGED5FudInLIpKq8hoB0FDQN5gWqlWJg2lFya2skDLqguVGA+moTdvAKFXdoor
         NNlYODkDIHQI0wqWmfESr6qJcDuNZoO9U/eML4Du84eRvYufIfbBvWPsb57tVrNfIyXN
         yLnw==
In-Reply-To: <04C4931B-553E-4FEA-85D4-B3E186520EE5@gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Florian Westphal <fw@strlen.de>
Cc: netfilter <netfilter@vger.kernel.org>, netfilter-devel@vger.kernel.org, pablo@netfilter.org

HI all

One more after switch to all rule and use only nft (remove qdisc from =
kernel config, and remove all iptables tables) in perf top see =
nft_do_chain is up to 3-4% on all core and if isolate with perf top -C X =
i see on one core is up to 10-15% :

  31.26%  [pppoe]                  [k] pppoe_rcv
     3.19%  [nf_tables]              [k] nft_do_chain
     2.46%  [kernel]                 [k] =
__netif_receive_skb_core.constprop.0
     2.18%  [kernel]                 [k] fib_table_lookup
     2.07%  [i40e]                   [k] i40e_clean_rx_irq
     1.51%  [kernel]                 [k] __dev_queue_xmit
     1.23%  [kernel]                 [k] dev_queue_xmit_nit
     1.23%  [nf_conntrack]           [k] __nf_conntrack_find_get.isra.0
     1.20%  [kernel]                 [k] __copy_skb_header
     1.19%  [kernel]                 [k] kmem_cache_free
     1.17%  [kernel]                 [k] skb_release_data
     1.06%  [nf_tables]              [k] nft_rhash_lookup=20


Is have options to optimize work of nft rule set.

and for second question is it posible to make work this limiter in flow =
table rule set :=20

#table inet filter {
#        flowtable fastnat {
#                hook ingress priority 0; devices =3D { eth0, eth1 };
#        }
#
#        chain forward {
#                type filter hook forward priority 0; policy accept;
#                ip protocol { tcp , udp } flow offload @fastnat;
#        }
#}

Like this and if have options to make devices list dynamic to add device =
automatic or to add device with *=20
If limiter work in flow table will make offload traffic and reduce cpu =
load

Martin

> On 23 Mar 2022, at 0:55, Martin Zaharinov <micron10@gmail.com> wrote:
>=20
> Hi Florian
>=20
> yes now work perfect
> i will test with 1-4k ips to see performance vs qdisc or iptables.
>=20
> for second offload question:
>=20
> is it possible to make limiter work in offload mode and ia it posible =
to add dynamic interface like ppp* or vlan* or other type.
>=20
>=20
>=20
> P.S.
>=20
> thanks for fast reply for first part!
>=20
> P.S.2=20
>=20
> resend mail to netfilter group
>=20
> Martin
>=20
>> On 22 Mar 2022, at 12:32, Florian Westphal <fw@strlen.de> wrote:
>>=20
>> Martin Zaharinov <micron10@gmail.com> wrote:
>>> Hi Florian
>>>=20
>>> Look good this config but not work after set user not limit by =
speed.
>>=20
>> Works for me.  Before:
>> [ ID] Interval           Transfer     Bitrate         Retr
>> [  5]   0.00-10.00  sec  5.09 GBytes  4.37 Gbits/sec    0 sender
>> [  5]   0.00-10.00  sec  5.08 GBytes  4.36 Gbits/sec receiver
>>=20
>> After:
>> [  5]   0.00-10.00  sec  62.9 MBytes  52.7 Mbits/sec    0 sender
>> [  5]   0.00-10.00  sec  59.8 MBytes  50.1 Mbits/sec receiver
>>=20
>>> table inet nft-qos-static {
>>>       set limit_ul {
>>>               typeof ip saddr
>>>               flags dynamic
>>>               elements =3D { 10.0.0.1 limit rate over 5 =
mbytes/second burst 6000 kbytes, 10.0.0.254 limit rate over 12 =
mbytes/second burst 6000 kbytes }
>>>       }
>>> 		set limit_dl {
>>>               typeof ip saddr
>>>               flags dynamic
>>>               elements =3D { 10.0.0.1 limit rate over 5 =
mbytes/second burst 6000 kbytes, 10.0.0.254 limit rate over 12 =
mbytes/second burst 6000 kbytes }
>>>      }
>>>=20
>>>       chain upload {
>>> 			type filter hook postrouting priority filter; =
policy accept;
>>> 			ip saddr @limit_ul drop
>>>       }
>>> 		chain download {
>>> 			type filter hook prerouting priority filter; =
policy accept;
>>> 			ip saddr @limit_dl drop
>>> 		}
>>=20
>> daddr?
>>=20
>>> With this config user with ip 10.0.0.1 not limited to 5 mbytes ,=20
>>=20
>>> When back to this config :
>>>=20
>>> table inet nft-qos-static {
>>> 	chain upload {
>>> 		type filter hook postrouting priority filter; policy =
accept;
>>> 		ip saddr 10.0.0.1 limit rate over 5 mbytes/second burst =
6000 kbytes drop
>>> 	}
>>>=20
>>> 	chain download {
>>> 		type filter hook prerouting priority filter; policy =
accept;
>>> 		ip daddr 10.0.0.1 limit rate over 5 mbytes/second burst =
6000 kbytes drop
>> 	           ~~~~~
>=20

