Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2115.outbound.protection.outlook.com [40.107.244.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91AD88820
	for <netfilter@vger.kernel.org>; Sat, 30 Mar 2024 05:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711775290; cv=fail; b=CAG5VQjgK6Zo723bsWfx1iPlIN81PYlN9yhi52nve6FU8ClYl/P+HppqkKI0olscqcjgX6blX+DAkJp9/80JscLhpc4RPXonrHWPx21LgMe5oESFw/DOLCHn4TU0yFbGYgL6hWyiSqBd1/W5hzdzNBsC3iGdLztuFj70Ckc1Drg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711775290; c=relaxed/simple;
	bh=cftZsp0nb3SCGQ96j2mtK7QqARR8GC5mxDKJ1wa/wQ0=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=gdFZ8nM+/xJtDEgToOMAHG2aG9v2cqFSWEtF2azwQ0grlJ5+xhLdgJgn3NRBhLHpPaNb2PChmUAJgzgBvi8a6qT7juKnvrV6Fx1aoBici98MYkMp8awGQPTuf+bcgYbKXpp6IlJgwylUxrq8UL8EibhmkoVcQsvoCubf5ItTbNI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cygnalabs.com; spf=pass smtp.mailfrom=cygnalabs.com; dkim=pass (1024-bit key) header.d=cygnalabs.onmicrosoft.com header.i=@cygnalabs.onmicrosoft.com header.b=mULX2N12; arc=fail smtp.client-ip=40.107.244.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cygnalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cygnalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cygnalabs.onmicrosoft.com header.i=@cygnalabs.onmicrosoft.com header.b="mULX2N12"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JBrnqdyTo8XIa7P2ujYubTh3FaV9sHJQkkVVCzThQTB3r9uEYvpkqHS5YoBoj06faOeXYJPIB72C1r86fOa4FVJqKaNkz9CzWYXYcbj6Gr+yM8rqio2/SVt1wa2kmvMid81jB9OC85LQOpO/t+XEt7MSllGIO8RYNj4GEarhYGDxnCqm4eqMBxPr4Ytadxw0Cwk465luq1HYGtPWCssytUYZAWzkSAuoYZPhpij5fg5ktL+NfrfRtoFqGaJe4Ig219ddKhvee3cYZxGGMXc/vapM4+ZpnV6pblEhnF4fEZeMFNTmvqvGLfwx+imWI3vI1ONQAslM8HlcrfvVO7KTsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XAajcEJuve99s51YQiKBmPU0yIhnhz/Aa6aTk4Yz4cQ=;
 b=jQDSPMO3njSTM1zHBRZOYWztVRzz4W+TxtgbRn94bN98oMJuOWgzCek3yfY7prdasKoNYqE62R5Vapknw2fgAJHD0/HjS6dcK8mtpQlgslITXtDJhVl60j4NIL++sRyDtu1gZokCAiTXcnhZL1UNRRpwZ28e54CeikO67HsR0OGye/1uT5sPDcysq7HvBotR1JsqqPDZo6aAafM+8QtnDy8agDg/v6aL/i61dIRJYXxQGVTY4CnTuzdfL76wsmbQ00ENE8X3eYGk0nF2maSeMOeQXtGWCDT7CmQ28KlnGQdrZ09t1GuKwrMivmT1c/3D5t7cH8GieE8sx0K4nkeJoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cygnalabs.com; dmarc=pass action=none
 header.from=cygnalabs.com; dkim=pass header.d=cygnalabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cygnalabs.onmicrosoft.com; s=selector2-cygnalabs-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XAajcEJuve99s51YQiKBmPU0yIhnhz/Aa6aTk4Yz4cQ=;
 b=mULX2N12mX1d82j8JS7n6a6z/89SKv04vMNHCjaEU1pcBionxzZuT43rKRDkdrEFK4lXntRoYbKE7LRbLfLP1MmYZ2JbqDJaIn3eKB7yji/sKRloeikh4vjEFjbDkPCyHX3iid3pY8e0xGmjpRkrURC0HkyHbW1ZeBaj72cD1gs=
Received: from SJ0PR18MB3884.namprd18.prod.outlook.com (2603:10b6:a03:2ee::21)
 by CO3PR18MB4846.namprd18.prod.outlook.com (2603:10b6:303:172::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.34; Sat, 30 Mar
 2024 05:08:05 +0000
Received: from SJ0PR18MB3884.namprd18.prod.outlook.com
 ([fe80::fc05:62bb:a21:caa3]) by SJ0PR18MB3884.namprd18.prod.outlook.com
 ([fe80::fc05:62bb:a21:caa3%2]) with mapi id 15.20.7409.042; Sat, 30 Mar 2024
 05:08:04 +0000
From: Blaine Elzey <Blaine.Elzey@cygnalabs.com>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Subject: Rocky Linux 9 with firewalld and nftables always tracks connections
Thread-Topic: Rocky Linux 9 with firewalld and nftables always tracks
 connections
Thread-Index: AdqCWwLiZxLG+wb/QdeaTIIFKBfwWw==
Date: Sat, 30 Mar 2024 05:08:04 +0000
Message-ID:
 <SJ0PR18MB388483F4136B4AEF9FF7F8F097392@SJ0PR18MB3884.namprd18.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR18MB3884:EE_|CO3PR18MB4846:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 bAsB/b2r2IDSuaGHxOb6JV0MfsUd+HUKwuLmKwU31kZx/0YLCI8WEoZxKJYac3w8mDKn3dl7+fB5Z2fO7wKl6le6PUojhWw3qF9LKuqLVU8bCGljiZRIh7ATpemQfCgB+Kt9a+xYddaR1NWnOvrS/oNPcaXHXEWssJjS9UEeUods2Vd35H9BUEO5TnZBWcJ/HGBVUPmP/IXoV6R0XzfCanXQHyt1cbF7viNxDp/i7s7Ve72PRrax4C8WHN1A7P/vxsT3tQ8G68wbYfPe0tw6EBdoVEqe4CSYdcw5cTf5cyCEJniBrpoRaNL9UOuLd48tkPnBaA7/V8vwx8qxhiU07/gHydqwsc8fTRzTJHjil9kpipR+kbKll8UBt6xOPmlcLVdfsKj+xFRwsr/wj9qWv4pAP4t2QffX5zFR2E//QlUTOxt/KYhA+y3rpHAlrAnk8P0JMrUngh5gjMy0naF21P4FAMu8RQjlkxuA2Ot7Ef6K3s360V74Y3kJUWubQpClC6wqhpn6VP22t5kK1eiK0gc70QH011pmzjHz7lrQ3T8EeQleLKUUq3fwDd3QEHU2HGii5Nu7F2lV5SN2mEuz1ABRw47UB6lbPk+DMS83uEhz+yCF3jvi1RZHVRAlC5yLf9Sjy7wBYnCB5Euzh4P0gg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR18MB3884.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?9JOUIIwqxLgRdauZfwL2gxOhyB9lPzuSIvKudsHHoNR6Abf4s05Gf//K5Ivs?=
 =?us-ascii?Q?Dnr83UOZdQH+qx0J+4D82gbeInu9G9dRdDVHT5GmjTeON7V41lOiX6QPp9dI?=
 =?us-ascii?Q?bPugV0qh/biV5kPUwqFb8vKjxHfiGo6W8T/p69uY+89bAApsmnNavt4XWS6D?=
 =?us-ascii?Q?I11pNMPc62GITKzapHWmmhSpGn+HQFhcfk8bc+gfgj+a0960E2pM2peD1+o1?=
 =?us-ascii?Q?fObn/6wtOEPD1jEbNSpzK1Cs/LwtpLBHvNrFJdEWf+Su4nzjTFvrSe7xmqRF?=
 =?us-ascii?Q?sj6oj/doSv0wMrD43BEqTCVZgNgX/Y7/e9vdlbQbewRCP25qleANLelMTKDU?=
 =?us-ascii?Q?s6N66gDMLXsdt4ZPKSVj5XrcSOFOD3SPGIq0AHoefvLjlkU1lKNyFnyY5iVb?=
 =?us-ascii?Q?k/aokIHkrNbeQLb2NjxIi9scNg5lICCMsC6l/MrMJ6wSLbcNxhS3SVU1iWsL?=
 =?us-ascii?Q?+wkd1ioKEtGiM12G131CDnUSA7LqeztFcyRhPtfpbJ0PamGsq5HzxbrvOXTa?=
 =?us-ascii?Q?rKHszoKkfRgBYUU2NbEuzI/OKcvVz3+hKc0EQEtkTj8Wq87j5hmU1vYdTtxw?=
 =?us-ascii?Q?MUH8tUuhbR9BluX5irWgo34n28AyfNSyElV2r/86TRobkRYDworT6HSLRA6n?=
 =?us-ascii?Q?0FQDjg1wefzF8oXwZdppMvQlbSY4X4X+WNx4TOkPzkSG0TwbgGoPSkNJQXmG?=
 =?us-ascii?Q?GV6h6uL/VTtnKlHMzgQXrPsbb8Qsa91rSiuS/6IXmDtxOw3OOCE/ljJyAeNy?=
 =?us-ascii?Q?3wpGXu5+E+LAgDCpELC8GUnT3HMyQH+W8l8iHArv30Fhu/SErfLW+ks7lOTT?=
 =?us-ascii?Q?3rEv0dZXmD46JuGw61h+NcxXmpeUPqFtaDGa5ghUet5VHglytVEu6dr2I5Bk?=
 =?us-ascii?Q?sr0QTN4VUmDpCat94pmicV4M6mdwE17Pq1LY8zlKslmqXdHh+8DPZiaruQDl?=
 =?us-ascii?Q?a4RtrvFGLCewbkb/kAK1TK5htFO+k212Q6oh5hkwGuRjl+WdI3IS3dZ5Vpm7?=
 =?us-ascii?Q?WbeW8dY68XIOeqio6SmQ6FzVg3Tv9Z8qHBwsT87GEX0sfep1/1g/iP8etqSN?=
 =?us-ascii?Q?8z8gvpU41xrmJ8CpocsT45sOaksXtz18LW3yhtmeNcCRYjkoGyyze5lUrRGZ?=
 =?us-ascii?Q?l26RTpIbMZ3vNrD3E8IWqOW03r4Gcc1xUJWOUakHNT0hdtSlrkGeIfGOHIsY?=
 =?us-ascii?Q?/5BIeLN+XIFDxIS+laRM+YV2wQGYDND6XFIUO8YMEwMAo68XGp5NhGinMuik?=
 =?us-ascii?Q?giMvXI03h4aLA1FUxx80z9+qpeeD0KMsE7jMhPkK5fPxWDAJSQSbKtphVkKU?=
 =?us-ascii?Q?/pxc6tHyn8/L+jCWwcW3cHVz0ZZ85LIvCUjNJDR117SR8wN0gdJcYcOK4BKB?=
 =?us-ascii?Q?fOotuwfeDzEtOIsq21qLmqjueMCv9omHUc9uexuTx0Lgbc7UFLcnAxfKyknO?=
 =?us-ascii?Q?Dz4h18ezIOK5iNQIckMcsy3oYQQhdwSnV7fOuFzxnIdF3hqFCPzul2RU2dMs?=
 =?us-ascii?Q?scEkrcXYlZSdpuhgGMWxhWnZLdjL57ewc5eV3fuHTzoWxlUx4Em1KdbL2d22?=
 =?us-ascii?Q?EkmDTkteLLyCp4WspF89TkpRpsXUeeIUBIzFd/JRbFRqlJ6W4FjlqNR4jYf5?=
 =?us-ascii?Q?dQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: cygnalabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR18MB3884.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c569cc8e-3894-451b-dbeb-08dc50776173
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2024 05:08:04.5881
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 52aaff49-9322-41f9-ad11-aa09e87f6af7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: paowgpCW95aPuKBguJ5DD8V6o+vujM33vg4+g+k+m/aunJSFk4SlIf489JFT6dGX36vlAlIol5ZdrgnftIsDecjaKvZcWMmjoid1m3fQQnI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO3PR18MB4846

I enabled the public zone and the dns service (udp/tcp port 53).  Firewalld=
 service is running and nftables service is not.  The connection tracking t=
able gets full on busy servers, and drops packets.  In prior Linux (RHEL7) =
I set iptables rules via firewalld direct configuration file.  The same rul=
es are not working now.  I set dns to listen on a 2nd port (5353), and trie=
d 2 nft commands:

  # nft insert rule inet firewalld mangle_PREROUTING udp dport 5353 notrack=
 meta mark set 53
  # nft insert rule inet firewalld filter_IN_public_allow mark 5353 accept

All the rules are automatically created by default firewalld config, based =
on the specified zone and services, except the 2 rules added with nft, abov=
e.

The mark is passed through the chains, as the port is allowed based on the =
packet mark, but the conntrack output shows "mark=3D0", even though I don't=
 think the packets should even be in the conntrack table.

This does allow the dns client to get a response, but the dns connections a=
re still tracked (included in /proc/net/nfconntrack).

Spent hours searching online with many hits, but none of them work.  It's l=
ike the connections are always added to the conntrack table, no matter what=
.  Hopefully someone has used a similar config, or can provide how to set s=
pecific packets to successfully notrack in a similar environment (detailed =
below).

# uname -a
Linux qip1250re-2 5.14.0-284.30.1.el9_2.x86_64 #1 SMP PREEMPT_DYNAMIC Sat S=
ep 16 09:55:41 UTC 2023 x86_64 x86_64 x86_64 GNU/Linux
# cat /etc/rocky-release
Rocky Linux release 9.2 (Blue Onyx)
# rpm -qa|grep firewalld
firewalld-filesystem-1.2.1-1.el9.noarch
firewalld-1.2.1-1.el9.noarch
# rpm -qa|grep nftables
nftables-1.0.4-10.el9_1.x86_64
python3-nftables-1.0.4-10.el9_1.x86_64
# cat /proc/net/nf_conntrack
ipv4     2 udp      17 28 src=3D192.168.1.2 dst=3D192.168.1.1 sport=3D43160=
 dport=3D5353 src=3D192.168.1.1 dst=3D135.114.104.251 sport=3D5353 dport=3D=
43160 mark=3D0 zone=3D0 use=3D2
# cat /etc/firewalld/zones/public.xml
<?xml version=3D"1.0" encoding=3D"utf-8"?>
<zone>
  <short>Public</short>
  <description>For use in public areas. You do not trust the other computer=
s on networks to not harm your computer. Only selected incoming connections=
 are accepted.</description>
  <service name=3D"ssh"/>
  <service name=3D"DNS"/>
  <forward/>
</zone>
# cat /etc/firewalld/services/dns.xml
<?xml version=3D"1.0" encoding=3D"utf-8"?>
<service>
  <short>DNS</short>
  <description>The Domain Name System (DNS) is used to provide and request =
host and domain names. Enable this option, if you plan to provide a domain =
name service (e.g. with bind).</description>
  <port protocol=3D"tcp" port=3D"53"/>
  <port protocol=3D"udp" port=3D"53"/>
</service>
# nft list ruleset
table inet firewalld {
        chain mangle_PREROUTING {
                type filter hook prerouting priority mangle + 10; policy ac=
cept;
                udp dport 5353 notrack meta mark set 0x00000035
                jump mangle_PREROUTING_ZONES
        }

        chain mangle_PREROUTING_POLICIES_pre {
                jump mangle_PRE_policy_allow-host-ipv6
        }

        chain mangle_PREROUTING_ZONES {
                iifname "eth0" goto mangle_PRE_public
                goto mangle_PRE_public
        }

        chain mangle_PREROUTING_POLICIES_post {
        }

        chain nat_PREROUTING {
                type nat hook prerouting priority dstnat + 10; policy accep=
t;
                jump nat_PREROUTING_ZONES
        }

        chain nat_PREROUTING_POLICIES_pre {
                jump nat_PRE_policy_allow-host-ipv6
        }

        chain nat_PREROUTING_ZONES {
                iifname "eth0" goto nat_PRE_public
                goto nat_PRE_public
        }

        chain nat_PREROUTING_POLICIES_post {
        }

        chain nat_POSTROUTING {
                type nat hook postrouting priority srcnat + 10; policy acce=
pt;
                jump nat_POSTROUTING_ZONES
        }

        chain nat_POSTROUTING_POLICIES_pre {
        }

        chain nat_POSTROUTING_ZONES {
                oifname "eth0" goto nat_POST_public
                goto nat_POST_public
        }

        chain nat_POSTROUTING_POLICIES_post {
        }

        chain nat_OUTPUT {
                type nat hook output priority -90; policy accept;
                jump nat_OUTPUT_POLICIES_pre
                jump nat_OUTPUT_POLICIES_post
        }

        chain nat_OUTPUT_POLICIES_pre {
        }

        chain nat_OUTPUT_POLICIES_post {
        }

        chain filter_PREROUTING {
                type filter hook prerouting priority filter + 10; policy ac=
cept;
                icmpv6 type { nd-router-advert, nd-neighbor-solicit } accep=
t
                meta nfproto ipv6 fib saddr . mark . iif oif missing log pr=
efix "rpfilter_DROP: " drop
        }

        chain filter_INPUT {
                type filter hook input priority filter + 10; policy accept;
                ct state { established, related } accept
                ct status dnat accept
                ct state invalid log prefix "STATE_INVALID_DROP: "
                ct state invalid drop
                iifname "lo" accept
                jump filter_INPUT_ZONES
                log prefix "FINAL_REJECT: "
                reject with icmpx admin-prohibited
        }

        chain filter_FORWARD {
                type filter hook forward priority filter + 10; policy accep=
t;
                ct state { established, related } accept
                ct status dnat accept
                ct state invalid log prefix "STATE_INVALID_DROP: "
                ct state invalid drop
                iifname "lo" accept
                ip6 daddr { ::/96, ::ffff:0.0.0.0/96, 2002::/24, 2002:a00::=
/24, 2002:7f00::/24, 2002:a9fe::/32, 2002:ac10::/28, 2002:c0a8::/32, 2002:e=
000::/19 } log prefix "RFC3964_IPv4_REJECT: " reject with icmpv6 addr-unrea=
chable
                jump filter_FORWARD_ZONES
                log prefix "FINAL_REJECT: "
                reject with icmpx admin-prohibited
        }

        chain filter_OUTPUT {
                type filter hook output priority filter + 10; policy accept=
;
                ct state { established, related } accept
                oifname "lo" accept
                ip6 daddr { ::/96, ::ffff:0.0.0.0/96, 2002::/24, 2002:a00::=
/24, 2002:7f00::/24, 2002:a9fe::/32, 2002:ac10::/28, 2002:c0a8::/32, 2002:e=
000::/19 } log prefix "RFC3964_IPv4_REJECT: " reject with icmpv6 addr-unrea=
chable
                jump filter_OUTPUT_POLICIES_pre
                jump filter_OUTPUT_POLICIES_post
        }

        chain filter_INPUT_POLICIES_pre {
                jump filter_IN_policy_allow-host-ipv6
        }

        chain filter_INPUT_ZONES {
                iifname "eth0" goto filter_IN_public
                goto filter_IN_public
        }

        chain filter_INPUT_POLICIES_post {
        }

        chain filter_FORWARD_POLICIES_pre {
        }

        chain filter_FORWARD_ZONES {
                iifname "eth0" goto filter_FWD_public
                goto filter_FWD_public
        }

        chain filter_FORWARD_POLICIES_post {
        }

        chain filter_OUTPUT_POLICIES_pre {
        }

        chain filter_OUTPUT_POLICIES_post {
        }

        chain filter_IN_public {
                jump filter_INPUT_POLICIES_pre
                jump filter_IN_public_pre
                jump filter_IN_public_log
                jump filter_IN_public_deny
                jump filter_IN_public_allow
                jump filter_IN_public_post
                jump filter_INPUT_POLICIES_post
                meta l4proto { icmp, ipv6-icmp } accept
                log prefix "filter_IN_public_REJECT: "
                reject with icmpx admin-prohibited
        }

        chain filter_IN_public_pre {
        }

        chain filter_IN_public_log {
        }

        chain filter_IN_public_deny {
        }

        chain filter_IN_public_allow {
                meta mark 0x00000035 accept
                tcp dport 22 ct state { new, untracked } accept
                udp dport 53 ct state { new, untracked } accept
                tcp dport 53 ct state { new, untracked } accept
        }

        chain filter_IN_public_post {
        }

        chain nat_POST_public {
                jump nat_POSTROUTING_POLICIES_pre
                jump nat_POST_public_pre
                jump nat_POST_public_log
                jump nat_POST_public_deny
                jump nat_POST_public_allow
                jump nat_POST_public_post
                jump nat_POSTROUTING_POLICIES_post
        }

        chain nat_POST_public_pre {
        }

        chain nat_POST_public_log {
        }

        chain nat_POST_public_deny {
        }

        chain nat_POST_public_allow {
        }

        chain nat_POST_public_post {
        }

        chain filter_FWD_public {
                jump filter_FORWARD_POLICIES_pre
                jump filter_FWD_public_pre
                jump filter_FWD_public_log
                jump filter_FWD_public_deny
                jump filter_FWD_public_allow
                jump filter_FWD_public_post
                jump filter_FORWARD_POLICIES_post
                log prefix "filter_FWD_public_REJECT: "
                reject with icmpx admin-prohibited
        }

        chain filter_FWD_public_pre {
        }

        chain filter_FWD_public_log {
        }

        chain filter_FWD_public_deny {
        }

        chain filter_FWD_public_allow {
                oifname "eth0" accept
        }

        chain filter_FWD_public_post {
        }

        chain nat_PRE_public {
                jump nat_PREROUTING_POLICIES_pre
                jump nat_PRE_public_pre
                jump nat_PRE_public_log
                jump nat_PRE_public_deny
                jump nat_PRE_public_allow
                jump nat_PRE_public_post
                jump nat_PREROUTING_POLICIES_post
        }

        chain nat_PRE_public_pre {
        }

        chain nat_PRE_public_log {
        }

        chain nat_PRE_public_deny {
        }

        chain nat_PRE_public_allow {
        }

        chain nat_PRE_public_post {
        }

        chain mangle_PRE_public {
                jump mangle_PREROUTING_POLICIES_pre
                jump mangle_PRE_public_pre
                jump mangle_PRE_public_log
                jump mangle_PRE_public_deny
                jump mangle_PRE_public_allow
                jump mangle_PRE_public_post
                jump mangle_PREROUTING_POLICIES_post
        }

        chain mangle_PRE_public_pre {
        }

        chain mangle_PRE_public_log {
        }

        chain mangle_PRE_public_deny {
        }

        chain mangle_PRE_public_allow {
        }

        chain mangle_PRE_public_post {
        }

        chain filter_IN_policy_allow-host-ipv6 {
                jump filter_IN_policy_allow-host-ipv6_pre
                jump filter_IN_policy_allow-host-ipv6_log
                jump filter_IN_policy_allow-host-ipv6_deny
                jump filter_IN_policy_allow-host-ipv6_allow
                jump filter_IN_policy_allow-host-ipv6_post
        }

        chain filter_IN_policy_allow-host-ipv6_pre {
        }

        chain filter_IN_policy_allow-host-ipv6_log {
        }

        chain filter_IN_policy_allow-host-ipv6_deny {
        }

        chain filter_IN_policy_allow-host-ipv6_allow {
                icmpv6 type nd-neighbor-advert accept
                icmpv6 type nd-neighbor-solicit accept
                icmpv6 type nd-router-advert accept
                icmpv6 type nd-redirect accept
        }

        chain filter_IN_policy_allow-host-ipv6_post {
        }

        chain nat_PRE_policy_allow-host-ipv6 {
                jump nat_PRE_policy_allow-host-ipv6_pre
                jump nat_PRE_policy_allow-host-ipv6_log
                jump nat_PRE_policy_allow-host-ipv6_deny
                jump nat_PRE_policy_allow-host-ipv6_allow
                jump nat_PRE_policy_allow-host-ipv6_post
        }

        chain nat_PRE_policy_allow-host-ipv6_pre {
        }

        chain nat_PRE_policy_allow-host-ipv6_log {
        }

        chain nat_PRE_policy_allow-host-ipv6_deny {
        }

        chain nat_PRE_policy_allow-host-ipv6_allow {
        }

        chain nat_PRE_policy_allow-host-ipv6_post {
        }

        chain mangle_PRE_policy_allow-host-ipv6 {
                jump mangle_PRE_policy_allow-host-ipv6_pre
                jump mangle_PRE_policy_allow-host-ipv6_log
                jump mangle_PRE_policy_allow-host-ipv6_deny
                jump mangle_PRE_policy_allow-host-ipv6_allow
                jump mangle_PRE_policy_allow-host-ipv6_post
        }

        chain mangle_PRE_policy_allow-host-ipv6_pre {
        }

        chain mangle_PRE_policy_allow-host-ipv6_log {
        }

        chain mangle_PRE_policy_allow-host-ipv6_deny {
        }

        chain mangle_PRE_policy_allow-host-ipv6_allow {
        }

        chain mangle_PRE_policy_allow-host-ipv6_post {
        }
}
#

TIA,
Blaine
