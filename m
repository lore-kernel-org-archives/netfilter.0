From: "Samuel Jean" <sjean@cookinglinux.org>
Subject: Re: How to start external script when ipfilter rule matches
Date: Fri, 6 Aug 2004 15:33:53 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1089.216.239.71.162.1091820833.squirrel@216.239.71.162>
References: <20040806042631.5824.39404.Mailman@vishnu.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040806042631.5824.39404.Mailman@vishnu.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org
Cc: soeren.lorenz@web.de

> Date: Thu, 05 Aug 2004 22:39:51 +0200
> From: S=F6ren Lorenz <soeren.lorenz@web.de>
>
> I'd like to start Squid when packets arrive on port 3128 on my router.

That's not netfilter/iptables job. inetd better suits to your needs.
I don't know much about Squid, but I guess it supports inetd.

> When the router disconnects from my ISP, Squid is shutdown again.

If that isn't a question, goto CONTINUE

As you seem to be using PPP connection, I'd consider using
/etc/ppp/ip-down bash script which is launched after successfull
disconnection process.


:CONTINUE
> Ideally the packets would be kept on hold until Squid is running and
> then delivered to the daemon. Another question is to shutdown squid
> after a certain time of inactivity on port 3128. Is there a way to
> achive this with ipfilter?

Again, not iptables/netfilter. Inetd can.

>
> Thanks in advance.
>
> Regards,
>
> S=F6ren Lorenz

Hope this helps.

--=20
Samuel Jean
SysAdmin & NetAdmin
at cookinglinux.org


