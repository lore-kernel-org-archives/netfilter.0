From: "Peter Marshall" <peter.marshall@caris.com>
Subject: Re: Nat with a dynamic IP
Date: Fri, 5 Sep 2003 16:28:57 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <03d101c373e3$f388dff0$49caa8c0@caris.priv>
References: <7C9884991ADAE0479C14F10C858BCDF52E3680@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Daniel Chemko <dchemko@smgtec.com>, Ramin Dousti <ramin@cannon.eng.us.uu.net>
Cc: Thorsten Scherf <tscherf@web.de>, netfilter@lists.netfilter.org

yep.  (but I wish I had access to their switches and vlans :)

Thanks for the tips.  everyone.

----- Original Message -----
From: "Daniel Chemko" <dchemko@smgtec.com>
To: "Ramin Dousti" <ramin@cannon.eng.us.uu.net>
Cc: "Peter Marshall" <peter.marshall@caris.com>; "Thorsten Scherf"
<tscherf@web.de>; <netfilter@lists.netfilter.org>
Sent: Friday, September 05, 2003 4:23 PM
Subject: RE: Nat with a dynamic IP


> It is to an ISP, so no beans...
>
> -----Original Message-----
> From: Ramin Dousti [mailto:ramin@cannon.eng.us.uu.net]
> Sent: Friday, September 05, 2003 12:14 PM
> To: Daniel Chemko
> Cc: Peter Marshall; Thorsten Scherf; netfilter@lists.netfilter.org
> Subject: Re: Nat with a dynamic IP
>
> Here is an idea, It might cost you some vlanning efforts on both the
> dhcp client and the dhcp server:
>
> vconfig add eth2 10
> vconfig add eth2 11
> vconfig add eth2 12
> vconfig add eth2 13
>
> dhcpcd eth2.10
> dhcpcd eth2.11
> dhcpcd eth2.12
> dhcpcd eth2.13
>
>


