From: <jwebb@korrnet.org>
Subject: Re: Proxies
Date: Wed, 17 Dec 2003 09:07:01 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <39523.66.4.149.1.1071670021.squirrel@www.korrnet.org>
References: <32916.66.4.149.1.1071667972.squirrel@www.korrnet.org>
        <1071669585.1059.38.camel@nienna.balabit>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1071669585.1059.38.camel@nienna.balabit>
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

Hello again,

You guys are absolutely correct.  I was hoping to utilize the efficiency
of netfilter.  Luckily though, I'm already using squid as a transparent
proxy.  I'm still not sure how to do it with squid, but I've been nudged
enough in the right direction that I can figure it out.

Thanks guys.

>
>   Hi,
>
> 2003-12-17, sze keltez=E9ssel 14:32-kor jwebb@korrnet.org ezt =EDrta:
>> Recently we've noticed a couple of users trying to use proxies to
>> bypass our filtering.  Ordinarily this is no problem, as we're
>> blocking standard proxy ports.  However, some users have wised up and
>> started using proxies on port 80.
>>
>> We've been blocking based on port, and obviously we can't block all of
>> port 80 outbound.  Is there any way to block a proxy on port 80 and
>> still have it be transparent to the users?
>
>   You should use some kind of application level proxy in transparent
> mode. For example, if you only want to allow HTTP traffic on port 80,
> then you should redirect outgoing TCP traffic with destination port 80
> to an HTTP proxy (squid, HTTP module of Zorp, etc.). These proxies
> should be able to restrict HTTP traffic strict enough so that it cannot
> be used to proxy anything other than real HTTP. Of course you should be
> aware that there are TCP over HTTP tunnels, which do not violate the
> HTTP protocol specification. However, these require a host outside your
> network running the "server" side of the tunnel software.
>
>   Of course this method will be not so efficient as packet filtering,
> but makes a lot of interesting things possible. (Caching, content
> filtering, on-the-fly virus scanning, etc.)
>
> --
>  Regards,
>    Krisztian KOVACS




