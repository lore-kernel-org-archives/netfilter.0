From: Andreas Hoefler <andreas.hoefler@hitachi-powergrids.com>
Subject: Is it possible to change a chains default policy when rules are
 already present?
Date: Thu, 13 Aug 2020 12:28:34 +0000
Message-ID: <AM0PR06MB4628C196EBABF0FD53AA8006C5430@AM0PR06MB4628.eurprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hitachi-powergrids.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vnEW1E+HqD9hXnLk9tD0O1f25U4U019exobRniOXsYk=;
 b=mmCEkCy8TCeeCF8qV4x1JEYpOn89K8PBzG8icb4PWGLkGSrr43noKXLpb++ESsFi2tmp5UNpslz0gLLKXnbxwbzAyIpoWPKTEJ8Oh8IpUgM4mEC+jX3WhYesIk4ckFIBbIxEAasV8LvdIWC0bqJ/Iz7ggALGkDqXp7/gI7WsY+c=
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi

I have a chain with default policy drop.=20
I would like to first have the default policy set to accept, then add rules=
 and later change it to drop.=20
Is this possible?

Thx
Andy
