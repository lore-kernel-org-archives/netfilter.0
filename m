From: y c <nuynehc@gmail.com>
Subject: Re: Using IPTables to route both dynamic local address and static 
	addresses provided by ISP?
Date: Tue, 8 Sep 2009 00:30:27 +0800
Message-ID: <ce2e34750909070930w4f6e1d66v5c768fd1629dac7c@mail.gmail.com>
References: <2b4d96e00909061414v270d580i56e1613d75886f4@mail.gmail.com>
	 <4AA4D2EC.4030801@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=OflCEJexfpwGS20Su90dc9XLfA+qRHxdi7G5hC6Dczg=;
        b=v5iy5Ojm2YMqAJZTdRDZE3qy31KjAil5B7vSU9o0+/nroLTFA+Ns3hQuwYaOujFc6k
         TMRPAHPlfsNnU6UmPQi5DwwCmdPEip777jl14dBYmwgN8s5SsE3/t98Gm9IBxD+gx5cN
         Km2tzrr6GoFSwqMnhXNdcdCHmj2T7wmzk4/lI=
In-Reply-To: <4AA4D2EC.4030801@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: Gregory Ray <gregr@seekmobileinteractive.com>, netfilter@vger.kernel.org

Here is an idea using brctl & ebtables, not iptables. Looks like you
need your box runs as a router and switch. It's very common use on DSL
routers called "Triple Play", or port based VLAN. I assume your
topology as: eth0(Internet), eth1(Server), eth2, eth3(private LAN).
1) Create a bridge for eth2 & eth3 with "brctl". Call it br0.
2) Dial out with eth0, you will get ppp0 for Internet.
3) Create a bridge for eth0 & eth1 with "brctl". Call it br1.
4) Set up rules with "ebtables", INPUT chain to DROP packets from eth1.
I didn't try it on my box, but I suppose it works.
Any feed back is appreciated.
Thanks

2009/9/7, Pascal Hambourg <pascal.mail@plouf.fr.eu.org>:
> Hello,
>
> Gregory Ray a =C3=A9crit :
>> I am running iptables as a dhcp router from a pppoe connection
>
> Iptables is neither a router nor a DHCP server. Do you mean "I am
> running a Linux box working as a DHCP server and as a router" ?
>
>> can I have it route the standard local ips to the
>> workstations but also have my other servers utilize the static ips
>> available in the block from my isp?
>
> Sure. I suppose that the privante addresses are masqueraded with the
> PPPoE public address. For the public static block, you have two optio=
ns.
>
> 1) Assign private addresses to the servers and use DNAT+SNAT to creat=
e
> 1:1 mapppings with public addresses from the static block.
>
> 2) Assign public addresses from the static block to the servers.
>
> Are the servers and workstations on the same LAN ?
> What is the size of the public static block and how many public serve=
rs
> do you have ?
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


--=20
BRs
nuynehc@gmail.com
