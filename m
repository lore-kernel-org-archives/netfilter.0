From: =?ISO-8859-1?Q?S=F6ren_Lorenz?= <soeren.lorenz@web.de>
Subject: Re: How to start external script when ipfilter rule matches
Date: Thu, 19 Aug 2004 11:40:33 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <41247591.9000902@web.de>
References: <20040806042631.5824.39404.Mailman@vishnu.netfilter.org> <1089.216.239.71.162.1091820833.squirrel@216.239.71.162> <411DF2E0.3020304@web.de> <200408141220.03743.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200408141220.03743.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Yes, that's the  way to go. But I need a lightweight userspace program=20
to trigger the actions I want to execute based on specific log events.=20
I've only come across perl solutions for this which is not suitable for=20
a router.

Regards,

S=F6ren Lorenz

Antony Stone schrieb:

>
>Try investigating the ULOG target perhaps?
>
>Antony.
>
> =20
>


