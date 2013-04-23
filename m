From: Vigneswaran R <vignesh@atc.tcs.com>
Subject: Re: Remote IP in packet sent from WAN to LAN
Date: Tue, 23 Apr 2013 10:11:19 +0530
Message-ID: <517610EF.2020009@atc.tcs.com>
References: <47E0AF00D6313049B892E93D60AACDCA45C7193D@AMSPRD0410MB361.eurprd04.prod.outlook.com>,<CAOA3yK+twroq_pO0Y2H0r_b_h19WGBapdAv3dK_8GDbWpp_mfA@mail.gmail.com> <47E0AF00D6313049B892E93D60AACDCA45C7730F@AMSPRD0410MB361.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47E0AF00D6313049B892E93D60AACDCA45C7730F@AMSPRD0410MB361.eurprd04.prod.outlook.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Cc: piotr.pawlowski@goyello.com

On 04/19/2013 06:20 PM, Piotr Paw=B3owski wrote:
> Not exactly.
> On the iptables-based router there is port forwarding to services run=
ning on servers inside LAN. I.e. WWW server is running on 192.168.1.2:8=
0 , in iptables I have port forwarding (nat/prerouting) from external I=
P (2.3.4.5:80) to 192.168.1.2:80 . Now on 192.168.1.2 in WWW access log=
s I see internal IP of the router instead of remote IP of the client, w=
hich requested 2.3.4.5:80 in browser.

1. Instead of using iptables-based port forwarding (DNAT), if you use=20
some reverse proxy (eg., apache) on the router, I think you can log the=
=20
actual client IP by following the instructions in the below URL (taken=20
from Humberto Juca's mail).

http://engi.neir.org/tips-tricks/fix-apache-proxy-logging/

2. Otherwise, you can LOG the packet on the router before doing DNAT.=20
Then the router log and webserver log together can make some sense=20
(provided that the servers are time synchronized).


Regards,
Vignesh

