From: "Steve \(Telsat Broadband\)" <steve@telsatbb.vu>
Subject: RE: FW: Packets missing the NAT table
Date: Mon, 7 Jan 2013 03:58:46 +1100
Message-ID: <00ad01cdec2f$18f156a0$4ad403e0$@telsatbb.vu>
References: <00a901cdec28$006d1c10$01475430$@telsatbb.vu> <alpine.LNX.2.01.1301061753140.6663@nerf07.vanv.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1301061753140.6663@nerf07.vanv.qr>
Content-Language: en-au
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Jan Engelhardt' <jengelh@inai.de>
Cc: netfilter@vger.kernel.org


Hi Jan,

Thanks for the quick reply.

That make sense; however now I just need to find a way to modify my rules to account for that :)

Thanks.
Steve.




-----Original Message-----
From: Jan Engelhardt [mailto:jengelh@inai.de] 
Sent: Monday, 7 January 2013 3:55 AM
To: Steve (Telsat Broadband)
Cc: netfilter@vger.kernel.org
Subject: Re: FW: Packets missing the NAT table

On Sunday 2013-01-06 17:08, Steve (Telsat Broadband) wrote:

>Hi All,
>
>I?m just trying to debug an issue on our network and I?ve noticed that 
>some packets are being missed from some rules in the NAT table.
>
>Do all packets go through the NAT table or is there some exclusion?  
>I?m seeing the packet hitting the mangle table as well as the filter 
>table, but not the NAT?

The nat table is a configuration database of sorts that is only consulted when necessary.


