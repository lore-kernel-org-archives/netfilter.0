From: =?iso-8859-2?Q?Piotr_Paw=B3owski?= <piotr.pawlowski@goyello.com>
Subject: RE: Remote IP in packet sent from WAN to LAN
Date: Fri, 19 Apr 2013 12:50:07 +0000
Message-ID: <47E0AF00D6313049B892E93D60AACDCA45C7730F@AMSPRD0410MB361.eurprd04.prod.outlook.com>
References: <47E0AF00D6313049B892E93D60AACDCA45C7193D@AMSPRD0410MB361.eurprd04.prod.outlook.com>,<CAOA3yK+twroq_pO0Y2H0r_b_h19WGBapdAv3dK_8GDbWpp_mfA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAOA3yK+twroq_pO0Y2H0r_b_h19WGBapdAv3dK_8GDbWpp_mfA@mail.gmail.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Not exactly.
On the iptables-based router there is port forwarding to services runni=
ng on servers inside LAN. I.e. WWW server is running on 192.168.1.2:80 =
, in iptables I have port forwarding (nat/prerouting) from external IP =
(2.3.4.5:80) to 192.168.1.2:80 . Now on 192.168.1.2 in WWW access logs =
I see internal IP of the router instead of remote IP of the client, whi=
ch requested 2.3.4.5:80 in browser.

Best egards
---
Piotr Paw=B3owski
