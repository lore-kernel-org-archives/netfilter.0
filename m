From: "Neal P. Murphy" <neal.p.murphy@alum.wpi.edu>
Subject: Re: How to check why HTTP proxy is not accessible from outside?
Date: Sun, 11 Feb 2018 17:20:51 -0500
Message-ID: <20180211172051.53d60163@playground>
References: <CABrM6wn4tJCx7XVfku=vn4Rm=rSa-gQxyCAYfkse+iFhicJhJQ@mail.gmail.com>
        <f095e07f58414b00b4dddc3776f0f64e@CCDEX023.corp.corpcommon.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 MAIL1.WPI.EDU w1BMKsY0002318
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=wpi.edu; s=_dkim;
        t=1518387654; i=@wpi.edu;
        bh=zspzix65R1VfvRV0MgpVVLiO8Nn6ImJtN3pM98TlPF8=;
        h=Date:From:Cc:Subject:In-Reply-To:References;
        b=qIzsIEO13fvzoi4Da/B9H9z/jJjGtBPTNWYzsSDs0X8X6iGEIb0qLwyf/W7ISxhmY
         oaRQTByQANQYB12ghPl0hx1l2n7KO472j9pKoPueK4E/FldM2RK5KB5A9kHF2XNgiu
         WZkAgN8Xylp5TBPM98QLntuSz/rDZSOtrmdz7x3k=
In-Reply-To: <f095e07f58414b00b4dddc3776f0f64e@CCDEX023.corp.corpcommon.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: 
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

[send it to the list this time]


The group of ACCEPTs allows packets to ports 5900-5907 from localhost to lo=
calhost because this is the INPUT chain. The group of REJECTs blocks packet=
s to ports 5900-5907, smtp, http, imap2 and imaps from anywhere to localhos=
t).

He didn't say how he is accessing his proxy. Which port? HTTP or HTTPS? Do =
his proxies have public addresses? Is there a NAT firewall between his two =
servers and the internet? If so, does that firewall allow traffic to server=
2?

If these are all the rules, I don't see any netfilter-related reason why se=
rver1 does not work while server does work.

N


On Sun, 11 Feb 2018 21:03:04 +0000
Andr=C3=A9 Paulsberg-Csibi (IBM Consultant)         <Andre.Paulsberg-Csibi@=
evry.com> wrote:

> Hi ,
>=20
> Even if you have not explained how this is setup , it seems very unlikely=
 the issue with server1 could be the iptables FW ...
> ... I can only GUESS here since there is not enough data to be 100% sure .
> However there are not really any relevant difference in the rules for ser=
ver1 and server2 , and the ruleset is not setup in what I would call best p=
ractice .
> In essence both rules allow for everything , except SMTP , HTTP , IMAP2 a=
nd IMAPS
> Unless your SQUID PROXY setup is using one of the 4 ports associated with=
 the 4 services ( and normally it would not ) it should not be blocked .
>=20
> REJECT     tcp  --  anywhere             anywhere             tcp dpt:smt=
p reject-with icmp-port-unreachable
> REJECT     tcp  --  anywhere             anywhere             tcp dpt:htt=
p reject-with icmp-port-unreachable
> REJECT     tcp  --  anywhere             anywhere             tcp dpt:ima=
p2 reject-with icmp-port-unreachable
> REJECT     tcp  --  anywhere             anywhere             tcp dpt:ima=
ps reject-with icmp-port-unreachable
>=20
> From what I can understand all other rules are not needed / since they ar=
e covered by a DEFAULT ACCEPT in this "SETUP"
>=20
> You can normally verify this if you use the syntax
>=20
> "sudo iptables -nvL"
> This will show you hit counters statistics
> If you then try from outside "telnet server1 3128" ( you may need to chan=
ge the port 3128 with whatever port your squid setup uses , but 3128 is nor=
mally the default )
>=20
> Then when you another "sudo iptables -nvL" right after and none of the co=
unters have increase for any DROP / REJECT rule
>=20
>=20
>=20
> Best regards
> Andr=C3=A9 Paulsberg-Csibi
> Senior Network Engineer=20
> IBM Services AS
>=20
> -----Opprinnelig melding-----
> Fra: netfilter-owner@vger.kernel.org [mailto:netfilter-owner@vger.kernel.=
org] P=C3=A5 vegne av Peng Yu
> Sendt: l=C3=B8rdag 10. februar 2018 06.28
> Til: netfilter@vger.kernel.org
> Emne: How to check why HTTP proxy is not accessible from outside?
>=20
> Hi,
>=20
> I have squid HTTP proxy running on both of the following servers
> (server 1 and 2). But the proxy service on server1 can not be accessed
> from outside.
>=20
> I am not familiar with the output of iptables. Could the difference
> explain why proxy on server1 is not accessible? Thanks.
>=20
> server1:~$ sudo iptables -L
> Chain INPUT (policy ACCEPT)
> target     prot opt source               destination
> REJECT     tcp  --  anywhere             anywhere             tcp
> dpt:smtp reject-with icmp-port-unreachable
> REJECT     tcp  --  anywhere             anywhere             tcp
> dpt:http reject-with icmp-port-unreachable
> ACCEPT     tcp  --  localhost            anywhere             tcp dpt:5900
> ACCEPT     tcp  --  localhost            anywhere             tcp dpt:5901
> ACCEPT     tcp  --  localhost            anywhere             tcp dpt:5902
> ACCEPT     tcp  --  localhost            anywhere             tcp dpt:5903
> ACCEPT     tcp  --  localhost            anywhere             tcp dpt:5904
> ACCEPT     tcp  --  localhost            anywhere             tcp dpt:5905
> ACCEPT     tcp  --  localhost            anywhere             tcp dpt:5906
> ACCEPT     tcp  --  localhost            anywhere             tcp dpt:5907
> REJECT     tcp  --  anywhere             anywhere             tcp
> dpt:5900 reject-with icmp-port-unreachable
> REJECT     tcp  --  anywhere             anywhere             tcp
> dpt:5901 reject-with icmp-port-unreachable
> REJECT     tcp  --  anywhere             anywhere             tcp
> dpt:5902 reject-with icmp-port-unreachable
> REJECT     tcp  --  anywhere             anywhere             tcp
> dpt:5903 reject-with icmp-port-unreachable
> REJECT     tcp  --  anywhere             anywhere             tcp
> dpt:5904 reject-with icmp-port-unreachable
> REJECT     tcp  --  anywhere             anywhere             tcp
> dpt:5905 reject-with icmp-port-unreachable
> REJECT     tcp  --  anywhere             anywhere             tcp
> dpt:5906 reject-with icmp-port-unreachable
> REJECT     tcp  --  anywhere             anywhere             tcp
> dpt:5907 reject-with icmp-port-unreachable
> REJECT     tcp  --  anywhere             anywhere             tcp
> dpt:imap2 reject-with icmp-port-unreachable
> REJECT     tcp  --  anywhere             anywhere             tcp
> dpt:imaps reject-with icmp-port-unreachable
>=20
> Chain FORWARD (policy ACCEPT)
> target     prot opt source               destination
>=20
> Chain OUTPUT (policy ACCEPT)
> target     prot opt source               destination
> server2:~$  sudo iptables -L
> Chain INPUT (policy ACCEPT)
> target     prot opt source               destination
> ACCEPT     tcp  --  localhost            anywhere             tcp dpt:5900
> ACCEPT     tcp  --  localhost            anywhere             tcp dpt:5901
> ACCEPT     tcp  --  localhost            anywhere             tcp dpt:5902
> ACCEPT     tcp  --  localhost            anywhere             tcp dpt:5903
> ACCEPT     tcp  --  localhost            anywhere             tcp dpt:5904
> ACCEPT     tcp  --  localhost            anywhere             tcp dpt:5905
> ACCEPT     tcp  --  localhost            anywhere             tcp dpt:5906
> ACCEPT     tcp  --  localhost            anywhere             tcp dpt:5907
> REJECT     tcp  --  anywhere             anywhere             tcp
> dpt:5900 reject-with icmp-port-unreachable
> REJECT     tcp  --  anywhere             anywhere             tcp
> dpt:5901 reject-with icmp-port-unreachable
> REJECT     tcp  --  anywhere             anywhere             tcp
> dpt:5902 reject-with icmp-port-unreachable
> REJECT     tcp  --  anywhere             anywhere             tcp
> dpt:5903 reject-with icmp-port-unreachable
> REJECT     tcp  --  anywhere             anywhere             tcp
> dpt:5904 reject-with icmp-port-unreachable
> REJECT     tcp  --  anywhere             anywhere             tcp
> dpt:5905 reject-with icmp-port-unreachable
> REJECT     tcp  --  anywhere             anywhere             tcp
> dpt:5906 reject-with icmp-port-unreachable
> REJECT     tcp  --  anywhere             anywhere             tcp
> dpt:5907 reject-with icmp-port-unreachable
> REJECT     tcp  --  anywhere             anywhere             tcp
> dpt:smtp reject-with icmp-port-unreachable
> REJECT     tcp  --  anywhere             anywhere             tcp
> dpt:http reject-with icmp-port-unreachable
> REJECT     tcp  --  anywhere             anywhere             tcp
> dpt:imap2 reject-with icmp-port-unreachable
> REJECT     tcp  --  anywhere             anywhere             tcp
> dpt:imaps reject-with icmp-port-unreachable
>=20
> Chain FORWARD (policy ACCEPT)
> target     prot opt source               destination
>=20
> Chain OUTPUT (policy ACCEPT)
> target     prot opt source               destination
>=20

