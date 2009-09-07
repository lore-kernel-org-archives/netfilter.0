From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Using IPTables to route both dynamic local address and static
 addresses provided by ISP?
Date: Mon, 07 Sep 2009 11:31:24 +0200
Message-ID: <4AA4D2EC.4030801@plouf.fr.eu.org>
References: <2b4d96e00909061414v270d580i56e1613d75886f4@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <2b4d96e00909061414v270d580i56e1613d75886f4@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Gregory Ray <gregr@seekmobileinteractive.com>
Cc: netfilter@vger.kernel.org

Hello,

Gregory Ray a =E9crit :
> I am running iptables as a dhcp router from a pppoe connection

Iptables is neither a router nor a DHCP server. Do you mean "I am
running a Linux box working as a DHCP server and as a router" ?

> can I have it route the standard local ips to the
> workstations but also have my other servers utilize the static ips
> available in the block from my isp?

Sure. I suppose that the privante addresses are masqueraded with the
PPPoE public address. For the public static block, you have two options=
=2E

1) Assign private addresses to the servers and use DNAT+SNAT to create
1:1 mapppings with public addresses from the static block.

2) Assign public addresses from the static block to the servers.

Are the servers and workstations on the same LAN ?
What is the size of the public static block and how many public servers
do you have ?
