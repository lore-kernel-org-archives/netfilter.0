From: Andreas Hoefler <andreas.hoefler@ch.abb.com>
Subject: callback on adding tables from mnl_cb_run for nftables
Date: Thu, 25 Jun 2020 07:51:20 +0000
Message-ID: <AM0PR06MB41960A43994E3A1517E65346CE920@AM0PR06MB4196.eurprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ch.abb.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UFJwHXFgKAFJmmhDKmH3p59bQ9bcSOnMXArn0bpT4aI=;
 b=s758FUrdd6G0ta8L2QRaKMuZKXYQD4VKKhCz8jYOljGemOCLCQusU2daefaYBQbvzeo4xb3mbX7jnO4Wex2sjkl1TJTUr+n0Ik8vrJbOF4o2WYuEUE0f3yd0ZDE4jtgqE2A73+U7ecrqAYEPIlpxdFpX/X+Hqj0Mys/mNVS9UDU=
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi all

I would like to use a callback when adding tables with libnftnl and libmnl =
with mnl_cb_run.=20
I tried to build the message header with nftnl_table_nlmsg_build_hdr and NL=
M_F_CREATE | NLM_F_ACK | NLM_F_ECHO. But it does not seem to trigger the ca=
llback provided on mnl_cb_run but still returns 0.
Any ideas?

Thx a lot
Andy

