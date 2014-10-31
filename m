From: Pietro Paolini <pulsarpietro@aol.com>
Subject: Re: recent module
Date: Fri, 31 Oct 2014 04:59:35 -0400
Message-ID: <8D1C30020A85581-7C0-2EBBC@webmail-vm135.sysops.aol.com>
References: <8D1C2445F7A6741-7C0-28755@webmail-vm135.sysops.aol.com> <CAKYdRA9cEw2LjsAsdcG+TaoG8U5JwG0D-TKdiirLrhL87nmu3A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAKYdRA9cEw2LjsAsdcG+TaoG8U5JwG0D-TKdiirLrhL87nmu3A@mail.gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mx.aol.com;
	s=20140625; t=1414745975;
	bh=UDF+ksp/mi+gro6J+g6jZ2crYEsvBfmU7CJr99SVLRM=;
	h=From:To:Subject:Message-Id:Date:MIME-Version:Content-Type;
	b=dLyY6k14UEqjw6xViG7rqQuyP5sqZHW2qxw9hCJzp4JQBYdpMDUYYESREIwdFgmau
	 TUmgOpX8CxOMVZig11CSICjOPitLtIa8tTfqDp16zIIeisTdo4FImeotkeTDnzJKkf
	 48u0mtt9QeNAj2jRknHD/nP2Z5CU7FfWg8MXa194=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: luke@osnz.co.nz
Cc: netfilter@vger.kernel.org

Thanks for your answer.=0D
=0D
Does not make any sense to me since rules drop packets .. I am puzzled =
=0D
=2E.=0D
=0D
The DROP rule takes effect only of the IP address is in the list, but =0D
in fact it is the other rule to put those IPs in the list therefore it =
=0D
cannot be the first packets.=0D
=0D
=0D
Another question pops up in my mind, what is the difference between =0D
state and conntrack ?=0D
=0D
>Chain INPUT (policy ACCEPT 44517 packets, 5130K bytes)=0D
> pkts bytes target     prot opt in     out     source               =0D
destination=0D
> 240 12948 LOG        tcp  --  *      *       0.0.0.0/0            =0D
0.0.0.0/0            state NEW tcp dpt:22 LOG flags 0 level 4=0D
> 106  5684 DROP       tcp  --  eth0   *       0.0.0.0/0            =0D
0.0.0.0/0            tcp dpt:22 state NEW recent: UPDATE seconds: 1800 =
=0D
hit_count: 5 name: ssh-defensive side: source=0D
> 134  7264            tcp  --  eth0   *       0.0.0.0/0            =0D
0.0.0.0/0            tcp dpt:22 state NEW recent: SET name: =0D
ssh-defensive side: source=0D
=0D
=0D
>You're matching state NEW, which (if I'm not mistaken) only matches =0D
the initial SYN packet of a transaction. Everything after that is =0D
ESTABLISHED or RELATED.=0D
=0D
=0D
On 30 October 2014 23:35, Pietro Paolini <pulsarpietro@aol.com> wrote:=0D
=0D
Hi all,=0D
=0D
=0D
=0D
I am trying to use the recent module to stop the slate of attacks I get=
=0D
everyday, but I am not sure my understanding of its logic it is correct=
=2E=0D
=0D
=0D
=0D
-A INPUT -i eth0 -p tcp -m tcp --dport 22 -m state --state NEW -m=C2=A0=
=0D
recent --update --seconds 1800 --hitcount 5 --name ssh-defensive=0D
--rsource -j DROP=0D
=0D
-A INPUT -i eth0 -p tcp -m tcp --dport 22 -m state --state NEW -m=0D
recent --set --name ssh-defensive --rsource=0D
=0D
=0D
=0D
I am testing this solution - which works as intended - but the packet=0D
counters do not make=C2=A0 sense to me, during my test=0D
=0D
I start the ssh client, I get the prompt asking for the password and I=0D
immediately check the iptables counters:=0D
=0D
=0D
=0D
Chain INPUT (policy ACCEPT 81 packets, 8996 bytes)=0D
=0D
=C2=A0pkts bytes target=C2=A0 =C2=A0 =C2=A0prot opt in=C2=A0 =C2=A0 =C2=
=A0out=C2=A0 =C2=A0 =C2=A0source=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0=0D
destination=0D
=0D
=C2=A0 =C2=A0 1=C2=A0 =C2=A0 52 LOG=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcp=C2=A0=
 --=C2=A0 *=C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A00.0.0.0/0=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=0D
0.0.0.0/0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 state NEW tcp dpt:22=
 LOG flags 0 level 4=0D
=0D
=C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A00 DROP=C2=A0 =C2=A0 =C2=A0 =C2=A0tcp=
=C2=A0 --=C2=A0 eth0=C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A00.0.0.0/0=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=0D
0.0.0.0/0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcp dpt:22 state NEW=
 recent: UPDATE seconds: 1800=0D
hit_count: 5 name: ssh-defensive side: source=0D
=0D
=C2=A0 =C2=A0 1=C2=A0 =C2=A0 52=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 tcp=C2=A0 --=C2=A0 eth0=C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A00.0.0.=
0/0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=0D
0.0.0.0/0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcp dpt:22 state NEW=
 recent: SET name:=0D
ssh-defensive side: source=0D
=0D
=0D
=0D
=0D
=0D
I expected to see more packets, what about the TCP handshake ?=0D
=0D
=0D
=0D
Thanks in advance,=0D
=0D
Pietro=0D
=0D
=0D
=0D
=0D
=0D
=0D
=0D
"And therefore never send to know for whom the bell tolls"=0D
=0D
pulsarpietro@aol.com=0D
=0D
=0D
=0D
=0D
=0D
=0D
--=0D
To unsubscribe from this list: send the line "unsubscribe netfilter" in=
=0D
the body of a message to majordomo@vger.kernel.org=0D
More majordomo info at=C2=A0 http://vger.kernel.org/majordomo-info.html=
=0D
=0D
=0D
=0D
=0D
=0D
=0D
--=0D
=0D
Luke Pascoe=0D
=0D
=0D
=0D
E luke@osnz.co.nz=0D
P +64 (9) 296 2961=0D
M +64 (27) 426 6649=0D
W www.osnz.co.nz=0D
=0D
24 Wellington St=0D
Papakura=0D
Auckland, 2110=0D
New Zealand=0D
=0D

