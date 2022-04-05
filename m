From: "Boyd, Patrick" <Patrick.Boyd@dell.com>
Subject: Redirect rule directly dropping packet
Date: Tue, 5 Apr 2022 14:41:21 +0000
Message-ID: <MW3PR19MB4186C2664AAB13CC233EE7C88DE49@MW3PR19MB4186.namprd19.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=from : to : subject :
 date : message-id : content-type : content-transfer-encoding :
 mime-version; s=smtpout1; bh=qDvUgHE51KG3kBqyUdosi+chVEF1t1Id+VWg8Ssy874=;
 b=pnuRasJRY/HnS7kqRSg5ipjJ5SAx/KV/IKKbLIdISp2eCcOTmEmrHT12TxTtipwqCnM9
 mwGkS+5DmAsaO/gz70+vV7B9tvMTVk4xJdRdLMYAO4DPA/Xz37eo6imbbpEfaUr8Ob3y
 jfpRqXqNdx7MtSE5NpNxkiwG9Tigq1UXAzvioP7K6138ZKPazwhga4iPUA3WVG9lBGiG
 SQI/8JlCJRzWA8kEsTGRnitv1KxUNzRJ9G5fKR6SFmeaMoyk+VJ29P1RzsdxKkrwBFkT
 IuCUtOQtmIEMsC+2lje+REiL9K1IgMz+HmvSOQscOy3fdgiEukzyndq2N68W2tiqTxZL Tw== 
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

I have a system that we recently updated from CentOS to Suse. As part of th=
at firewalld switched from iptables to nftables. Most everything works grea=
t and isn't presenting any problems, except redirect rules.

For firewalld we have a couple of simple rich rules:
rich rules:
        rule family=3D"ipv6" forward-port port=3D"8080" protocol=3D"tcp" to=
-port=3D"443"
        rule family=3D"ipv4" forward-port port=3D"8080" protocol=3D"tcp" to=
-port=3D"443"

These are correctly translating to nftables as:
chain nat_PRE_customer_allow { # handle 54
                tcp dport 8080 redirect to :443 # handle 61
}

However, despite that rule looking correct the packets are still getting dr=
opped. I added a meta trace rule in raw and get the following trace:
trace id ba82f3e9 inet firewalld raw_PREROUTING packet: iif "internalpub" e=
ther saddr 00:01:e8:8b:47:dd ether daddr 18:66:da:b1:17:57 ip saddr 100.71.=
132.102 ip daddr 100.69.124.209 ip dscp cs0 ip ecn not-ect ip ttl 61 ip id =
24586 ip protocol tcp ip length 60 tcp sport 54004 tcp dport 8080 tcp flags=
 =3D=3D syn tcp window 29200
trace id ba82f3e9 inet firewalld raw_PREROUTING rule tcp dport 8080 meta nf=
trace set 1 (verdict continue)
trace id ba82f3e9 inet firewalld raw_PREROUTING verdict continue
trace id ba82f3e9 inet firewalld raw_PREROUTING policy accept
trace id ba82f3e9 inet firewalld mangle_PREROUTING packet: iif "internalpub=
" ether saddr 00:01:e8:8b:47:dd ether daddr 18:66:da:b1:17:57 ip saddr 100.=
71.132.102 ip daddr 100.69.124.209 ip dscp cs0 ip ecn not-ect ip ttl 61 ip =
id 24586 ip protocol tcp ip length 60 tcp sport 54004 tcp dport 8080 tcp fl=
ags =3D=3D syn tcp window 29200
trace id ba82f3e9 inet firewalld mangle_PREROUTING rule jump mangle_PREROUT=
ING_POLICIES_pre (verdict jump mangle_PREROUTING_POLICIES_pre)
trace id ba82f3e9 inet firewalld mangle_PREROUTING_POLICIES_pre rule jump m=
angle_PRE_policy_allow-host-ipv6 (verdict jump mangle_PRE_policy_allow-host=
-ipv6)
trace id ba82f3e9 inet firewalld mangle_PRE_policy_allow-host-ipv6 rule jum=
p mangle_PRE_policy_allow-host-ipv6_pre (verdict jump mangle_PRE_policy_all=
ow-host-ipv6_pre)
trace id ba82f3e9 inet firewalld mangle_PRE_policy_allow-host-ipv6_pre verd=
ict continue
trace id ba82f3e9 inet firewalld mangle_PRE_policy_allow-host-ipv6 rule jum=
p mangle_PRE_policy_allow-host-ipv6_log (verdict jump mangle_PRE_policy_all=
ow-host-ipv6_log)
trace id ba82f3e9 inet firewalld mangle_PRE_policy_allow-host-ipv6_log verd=
ict continue
trace id ba82f3e9 inet firewalld mangle_PRE_policy_allow-host-ipv6 rule jum=
p mangle_PRE_policy_allow-host-ipv6_deny (verdict jump mangle_PRE_policy_al=
low-host-ipv6_deny)
trace id ba82f3e9 inet firewalld mangle_PRE_policy_allow-host-ipv6_deny ver=
dict continue
trace id ba82f3e9 inet firewalld mangle_PRE_policy_allow-host-ipv6 rule jum=
p mangle_PRE_policy_allow-host-ipv6_allow (verdict jump mangle_PRE_policy_a=
llow-host-ipv6_allow)
trace id ba82f3e9 inet firewalld mangle_PRE_policy_allow-host-ipv6_allow ve=
rdict continue
trace id ba82f3e9 inet firewalld mangle_PRE_policy_allow-host-ipv6 rule jum=
p mangle_PRE_policy_allow-host-ipv6_post (verdict jump mangle_PRE_policy_al=
low-host-ipv6_post)
trace id ba82f3e9 inet firewalld mangle_PRE_policy_allow-host-ipv6_post ver=
dict continue
trace id ba82f3e9 inet firewalld mangle_PRE_policy_allow-host-ipv6 verdict =
continue
trace id ba82f3e9 inet firewalld mangle_PREROUTING_POLICIES_pre verdict con=
tinue
trace id ba82f3e9 inet firewalld mangle_PREROUTING rule jump mangle_PREROUT=
ING_ZONES (verdict jump mangle_PREROUTING_ZONES)
trace id ba82f3e9 inet firewalld mangle_PREROUTING_ZONES rule iifname "inte=
rnalpub" goto mangle_PRE_customer (verdict goto mangle_PRE_customer)
trace id ba82f3e9 inet firewalld mangle_PRE_customer rule jump mangle_PRE_c=
ustomer_pre (verdict jump mangle_PRE_customer_pre)
trace id ba82f3e9 inet firewalld mangle_PRE_customer_pre verdict continue
trace id ba82f3e9 inet firewalld mangle_PRE_customer rule jump mangle_PRE_c=
ustomer_log (verdict jump mangle_PRE_customer_log)
trace id ba82f3e9 inet firewalld mangle_PRE_customer_log verdict continue
trace id ba82f3e9 inet firewalld mangle_PRE_customer rule jump mangle_PRE_c=
ustomer_deny (verdict jump mangle_PRE_customer_deny)
trace id ba82f3e9 inet firewalld mangle_PRE_customer_deny verdict continue
trace id ba82f3e9 inet firewalld mangle_PRE_customer rule jump mangle_PRE_c=
ustomer_allow (verdict jump mangle_PRE_customer_allow)
trace id ba82f3e9 inet firewalld mangle_PRE_customer_allow verdict continue
trace id ba82f3e9 inet firewalld mangle_PRE_customer rule jump mangle_PRE_c=
ustomer_post (verdict jump mangle_PRE_customer_post)
trace id ba82f3e9 inet firewalld mangle_PRE_customer_post verdict continue
trace id ba82f3e9 inet firewalld mangle_PRE_customer verdict continue
trace id ba82f3e9 inet firewalld mangle_PREROUTING rule jump mangle_PREROUT=
ING_POLICIES_post (verdict jump mangle_PREROUTING_POLICIES_post)
trace id ba82f3e9 inet firewalld mangle_PREROUTING_POLICIES_post verdict co=
ntinue
trace id ba82f3e9 inet firewalld mangle_PREROUTING verdict continue
trace id ba82f3e9 inet firewalld mangle_PREROUTING policy accept
trace id ba82f3e9 ip firewalld nat_PREROUTING packet: iif "internalpub" eth=
er saddr 00:01:e8:8b:47:dd ether daddr 18:66:da:b1:17:57 ip saddr 100.71.13=
2.102 ip daddr 100.69.124.209 ip dscp cs0 ip ecn not-ect ip ttl 61 ip id 24=
586 ip length 60 tcp sport 54004 tcp dport 8080 tcp flags =3D=3D syn tcp wi=
ndow 29200
trace id ba82f3e9 ip firewalld nat_PREROUTING rule jump nat_PREROUTING_POLI=
CIES_pre (verdict jump nat_PREROUTING_POLICIES_pre)
trace id ba82f3e9 ip firewalld nat_PREROUTING_POLICIES_pre rule jump nat_PR=
E_policy_allow-host-ipv6 (verdict jump nat_PRE_policy_allow-host-ipv6)
trace id ba82f3e9 ip firewalld nat_PRE_policy_allow-host-ipv6 rule jump nat=
_PRE_policy_allow-host-ipv6_pre (verdict jump nat_PRE_policy_allow-host-ipv=
6_pre)
trace id ba82f3e9 ip firewalld nat_PRE_policy_allow-host-ipv6_pre verdict c=
ontinue
trace id ba82f3e9 ip firewalld nat_PRE_policy_allow-host-ipv6 rule jump nat=
_PRE_policy_allow-host-ipv6_log (verdict jump nat_PRE_policy_allow-host-ipv=
6_log)
trace id ba82f3e9 ip firewalld nat_PRE_policy_allow-host-ipv6_log verdict c=
ontinue
trace id ba82f3e9 ip firewalld nat_PRE_policy_allow-host-ipv6 rule jump nat=
_PRE_policy_allow-host-ipv6_deny (verdict jump nat_PRE_policy_allow-host-ip=
v6_deny)
trace id ba82f3e9 ip firewalld nat_PRE_policy_allow-host-ipv6_deny verdict =
continue
trace id ba82f3e9 ip firewalld nat_PRE_policy_allow-host-ipv6 rule jump nat=
_PRE_policy_allow-host-ipv6_allow (verdict jump nat_PRE_policy_allow-host-i=
pv6_allow)
trace id ba82f3e9 ip firewalld nat_PRE_policy_allow-host-ipv6_allow verdict=
 continue
trace id ba82f3e9 ip firewalld nat_PRE_policy_allow-host-ipv6 rule jump nat=
_PRE_policy_allow-host-ipv6_post (verdict jump nat_PRE_policy_allow-host-ip=
v6_post)
trace id ba82f3e9 ip firewalld nat_PRE_policy_allow-host-ipv6_post verdict =
continue
trace id ba82f3e9 ip firewalld nat_PRE_policy_allow-host-ipv6 verdict conti=
nue
trace id ba82f3e9 ip firewalld nat_PREROUTING_POLICIES_pre verdict continue
trace id ba82f3e9 ip firewalld nat_PREROUTING rule jump nat_PREROUTING_ZONE=
S (verdict jump nat_PREROUTING_ZONES)
trace id ba82f3e9 ip firewalld nat_PREROUTING_ZONES rule iifname "internalp=
ub" goto nat_PRE_customer (verdict goto nat_PRE_customer)
trace id ba82f3e9 ip firewalld nat_PRE_customer rule jump nat_PRE_customer_=
pre (verdict jump nat_PRE_customer_pre)
trace id ba82f3e9 ip firewalld nat_PRE_customer_pre verdict continue
trace id ba82f3e9 ip firewalld nat_PRE_customer rule jump nat_PRE_customer_=
log (verdict jump nat_PRE_customer_log)
trace id ba82f3e9 ip firewalld nat_PRE_customer_log verdict continue
trace id ba82f3e9 ip firewalld nat_PRE_customer rule jump nat_PRE_customer_=
deny (verdict jump nat_PRE_customer_deny)
trace id ba82f3e9 ip firewalld nat_PRE_customer_deny verdict continue
trace id ba82f3e9 ip firewalld nat_PRE_customer rule jump nat_PRE_customer_=
allow (verdict jump nat_PRE_customer_allow)
trace id ba82f3e9 ip firewalld nat_PRE_customer_allow rule tcp dport 8080 r=
edirect to :443 (verdict drop)

It looks to me like the redirect rule itself is dropping the packet and I c=
an't figure out why. What can I do to further debug this issue?

-Patrick Boyd

Internal Use - Confidential
