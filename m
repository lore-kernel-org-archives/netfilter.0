From: =?ISO-8859-1?Q?S=F6ren_Lorenz?= <soeren.lorenz@web.de>
Subject: Re: How to start external script when ipfilter rule matches
Date: Sat, 14 Aug 2004 13:09:20 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <411DF2E0.3020304@web.de>
References: <20040806042631.5824.39404.Mailman@vishnu.netfilter.org> <1089.216.239.71.162.1091820833.squirrel@216.239.71.162>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1089.216.239.71.162.1091820833.squirrel@216.239.71.162>
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

Samuel Jean schrieb:

>That's not netfilter/iptables job. inetd better suits to your needs.
>I don't know much about Squid, but I guess it supports inetd.
>
> =20
>
No, it doesn't. It needs to bind the port directly, no way to run it via=20
inetd.

>>When the router disconnects from my ISP, Squid is shutdown again.
>>   =20
>>
>Again, not iptables/netfilter. Inetd can.
> =20
>
Come on, there must be a way to trigger userspace actions on netfilter=20
matches. Some people do realtime blacklisting on portscanning IPs. I'm=20
looking for a lightweight (router suitable) way to do this. Solutions=20
depending on Perl are not an option.

Regards,

S=F6ren Lorenz

