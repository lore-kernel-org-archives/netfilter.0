From: <bmcdowell@coxhealthplans.com>
Subject: RE: How to NAT inside a LAN over a single Interface
Date: Fri, 19 Dec 2003 12:06:12 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7A3B4AA360FDEF448F3390421FC8D731012C667B@coxhpexg.coxhp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


I don't know if anyone else has pointed this out yet, but you can
probably use their network wires to do this.  Unless the switches are
locked down, you can run your NAT network over a different IP scheme on
the same wires.  So, you might try:

1)  Add a NIC to a machine that's allowed to access the internet.
2)  Set it up to do NAT.  Use say 10.10.10.x/24 for the 'internal' IP
scheme.
3)  Pipe that new NIC via a hub right back into their network.
4)  Supply any restricted clients with a second IP on the 10.x scheme.
5)  Tweak the routing on those clients so that the 10.x NAT box is the
gateway to the internet.

I once did something very similar to bypass a little bureaucracy.  It
took them four months to discover it.  When they did, I had a strong
case for physically separating our networks...  Oh, the memories...


Bob


-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Jeffrey Laramie
Sent: Friday, December 19, 2003 11:26 AM
To: netfilter@lists.netfilter.org
Subject: Re: How to NAT inside a LAN over a single Interface


Dietmar Hofer wrote:

I haven't found anythink clearing my problem doing some research in this
list, nevertheless I'm sorry if you find my question annoying 'cos I'm
quite new to this issue.=20

I'm in a class B LAN and would make a Machine work as Gateway for
another, both in the same network. This because the Internet Gateway
accepts only requests of registered Interfaces (MAC-based).=20
The Machine which I want to let do this has only one eth-Interface. what
in theory should be enough.=20
I set up NAT with "iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE"
and changed the route on the source machine to use the other as gateway.

When pinging from the source machine, "/var/log/syslog" on the gateway
shows me this requests:=20

Dec 18 22:42:44 hogwart kernel: IN=3Deth0 OUT=3Deth0 SRC=3D192.168.2.201
DST=3D192.168.2.150 LEN=3D8=20
4 TOS=3D0x00 PREC=3D0x00 TTL=3D63 ID=3D0 DF PROTO=3DICMP TYPE=3D8 =
CODE=3D0 ID=3D7294
SEQ=3D1=20

But I don't get an answer on the source machine, (while naturally i can
ping the given IP from the gateway itself).=20
In a HOWTO I found the hint that doing NAT with only 1 Interface for
input and output may not work with this config 'cos since kernel 2.4
some sort of ICMP redirections doesn't work or so...=20

What I want to know is just what I've to do to use this machine as
gateway with only one interface.=20
Hope you can help=20


I'm afraid I've never heard of a configuration where you use the same
NIC for both input and output. I doubt this would work for numerous
reasons, but even if it did, why bother? A NIC is $19.95 and a patch
cable is a few bucks. Wouldn't it be much easier to install another NIC
and avoid all the routing headaches?

Jeff

