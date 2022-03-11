From: Marcin Kabiesz <marcin.kabiesz@smarthost.pl>
Subject: Re: NAT translation problem - leakage of packets with original source
 address
Date: Fri, 11 Mar 2022 10:11:47 +0100
Message-ID: <039c7dc8fed7947df5a7e72ead9a9627@smarthost.pl>
References: <0e142c6e43516aa01a9bcf6f6df9b31d@smarthost.pl>
 <20220310120809.GD26501@breakpoint.cc>
 <613d3843bf5e37cdf890b64b416471f3@smarthost.pl>
 <20220310145331.GD13772@breakpoint.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=smarthost.pl; s=default; h=Content-Transfer-Encoding:Content-Type:
        Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=kL1MkR5rFSwq7serVSZRWgvhkhGuA7lGFIjtzUjQ7Fo=; b=1qCoNnfp3fjNX7hU9lMPzLjgYx
        OkHk3mbYjiDKYPtpbL+ziCWetGMZusqKVxmCPD8A+Zit+HQy51ifIdNNgpp0xpbJ6317SBSpCpB23
        AAG9hqGHXiC+4DMWBAhIjNJd2qcycVedrN99CVz+rlqFyGmsiHW8y2qXNeWWIxDRySkhQiWlKIKS4
        /JCFpgReB+4X7Iz83vNW/raDLDBf5O5W5hH5PoViCs+mFnQ9UFlw2yXe6jAebNOhsn96w7jEgHyxG
        Cj/us26salslD/3VPBtIlXy1wyS6ezZfB6sK1YzJ45ipfY6x8EKHwgO6Mqo59+Fsu6fydWLPRWmvs
        Bb+JHd 
In-Reply-To: <20220310145331.GD13772@breakpoint.cc>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org

W dniu 2022-03-10 15:53, Florian Westphal napisa=C5=82(a):
> Marcin Kabiesz <marcin.kabiesz@smarthost.pl> wrote:
>> My question is where do I create a rule for invalid packets? in NAT
>> POSTROUTING? or MANGLE POSTROUTING or other place leaving the server?=20
>> I am
>> waiting for your opinion.
>=20
> INVALID packets do not traverse NAT table, so NAT POSTROUTING won't
> work.
>=20
> I would suggest mangle postrouting or filter forward, depending on
> wheter you want to include locally generated packets or not.

Welcome,
I did as you wrote and even added the option to filter local networks=20
before entering NAT and still get traffic from the network for this=20
machine.

There is a 192.168.10.x / 24 network on this router and I can see its=20
packets as if NAT is running even though it is clearly told to replace=20
the source IP in the header. The POSTROUTING rule for INVALID does not=20
work because nothing gets caught in it.

This router NAT (not BGP - BGP is default Gateway)

Chain POSTROUTING (policy ACCEPT 1170K packets, 1616M bytes)
  pkts bytes target     prot opt in     out     source              =20
destination
84216 8212K ACCEPT     all  --  *      eth0.2  192.168.10.0/24     =20
0.0.0.0/0
  552K   46M ACCEPT     all  --  *      eth0.2  192.168.11.0/24     =20
0.0.0.0/0
     0     0 ACCEPT     all  --  *      eth0.2  192.168.12.0/24     =20
0.0.0.0/0
     0     0 DROP       all  --  *      eth0.2  192.168.0.0/16      =20
0.0.0.0/0
     0     0 DROP       tcp  --  *      eth0.2  0.0.0.0/0           =20
0.0.0.0/0            state INVALID

and

Chain POSTROUTING (policy ACCEPT 30780 packets, 2009K bytes)
  pkts bytes target     prot opt in     out     source              =20
destination
  117K   17M SNAT       all  --  *      eth0.2  192.168.10.0/24     =20
0.0.0.0/0            to:1.2.3.4
  558K   77M SNAT       all  --  *      eth0.2  192.168.11.0/24     =20
0.0.0.0/0            to:1.2.3.4
  1629  256K SNAT       all  --  *      eth0.2  192.168.12.0/24     =20
0.0.0.0/0            to:1.2.3.4

My Router (BGP router) packet: (I shouldn't have seen it and here I can=20
see ...)

10:09:28.879415 xx:xx:xx:xx:xx:xx > zz:zz:zz:zz:zz:zz, ethertype 802.1Q=20
(0x8100), length 64: vlan 1234, p 0, ethertype IPv4 (0x0800), (tos 0x0,=20
ttl 127, id 20066, offset 0, flags [DF], proto TCP (6), length 40)
     192.168.10.206.57808 > 108.177.14.189.443: Flags [R.], cksum 0x3ba1=20
(correct), seq 2045590905, ack 4040794494, win 0, length 0

Please help / hint.

--=20
Marcin Kabiesz
Administrator Sieci IT
