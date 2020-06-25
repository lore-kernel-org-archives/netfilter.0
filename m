From: Andreas Hoefler <andreas.hoefler@ch.abb.com>
Subject: RE: callback on adding tables from mnl_cb_run for nftables
Date: Thu, 25 Jun 2020 08:02:58 +0000
Message-ID: <AM0PR06MB41961208803001DFE0397B67CE920@AM0PR06MB4196.eurprd06.prod.outlook.com>
References: <AM0PR06MB41960A43994E3A1517E65346CE920@AM0PR06MB4196.eurprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ch.abb.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6aznYAqqI3QO8cHmcFtXHOfqZsBoV9tbm6kjw4b5EEE=;
 b=V/JQlK4WwWWoewzNx2L+vQA8QBkZhlnA3dhqx9hFl96fnt3KVVwTsJg+rX/j1G9NYCYvu/vXUSejGalUw9CzKqtwwSK/TACq7NkzC1ZL0cSDwlqGxvN94hQIf+v2XTut3zh/lDIlnzcCy1qM6tL59+4SYza3ACY3ZbyYdQquItk=
In-Reply-To: <AM0PR06MB41960A43994E3A1517E65346CE920@AM0PR06MB4196.eurprd06.prod.outlook.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Nevermind, figured it out....:-)

-----Original Message-----
From: netfilter-owner@vger.kernel.org <netfilter-owner@vger.kernel.org> On =
Behalf Of Andreas Hoefler
Sent: Donnerstag, 25. Juni 2020 09:51
To: netfilter@vger.kernel.org
Subject: callback on adding tables from mnl_cb_run for nftables

Hi all

I would like to use a callback when adding tables with libnftnl and libmnl =
with mnl_cb_run.=20
I tried to build the message header with nftnl_table_nlmsg_build_hdr and NL=
M_F_CREATE | NLM_F_ACK | NLM_F_ECHO. But it does not seem to trigger the ca=
llback provided on mnl_cb_run but still returns 0.
Any ideas?

Thx a lot
Andy

