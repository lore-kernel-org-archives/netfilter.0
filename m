From: <david@suarapembaruan.co.id>
Subject: Re: Transparant proxy
Date: Fri, 4 Jun 2004 23:25:19 +0700 (WIT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3116.172.16.131.133.1086366319.squirrel@mail.suarapembaruan.co.id>
References: <40BF3E60.2060206@efn.uncor.edu>
        <1157.172.16.131.133.1086337464.squirrel@mail.suarapembaruan.co.id>
        <40C02017.5030304@unav.es>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40C02017.5030304@unav.es>
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
To: ecasbas@unav.es
Cc: david@suarapembaruan.co.id, netfilter@lists.netfilter.org

I will try it,

Thank's
DK

> david@suarapembaruan.co.id wrote:
>
>>Dear all,
>>can anybody tell me how to set rules in iptables if i want to use
>> transparant proxy.
>>
>>Thank's
>>David Kandou
>>
>>
>>
>>
>>
>>
> iptables -t nat -A prerouting -i eth0 -p tcp --dport 80 -j REDIRECT
> --to-port 3128
>
> This command make your kernel intercept  HTTP connections and send them
> to proxy port.
>
>
> Emilio C.




