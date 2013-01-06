From: "Steve \(Telsat Broadband\)" <steve@telsatbb.vu>
Subject: FW: Packets missing the NAT table
Date: Mon, 7 Jan 2013 03:08:01 +1100
Message-ID: <00a901cdec28$006d1c10$01475430$@telsatbb.vu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
References: 
In-Reply-To: 
Content-Language: en-au
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: netfilter@vger.kernel.org

Hi All,

I=92m just trying to debug an issue on our network and I=92ve noticed t=
hat some
packets are being missed from some rules in the NAT table.=A0=20

Do all packets go through the NAT table or is there some exclusion?=A0 =
I=92m
seeing the packet hitting the mangle table as well as the filter table,=
 but
not the NAT?

Thanks
Steve.


