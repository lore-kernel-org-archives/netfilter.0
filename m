From: J Webster <jw.jwebster@gmail.com>
Subject: Re: masquerade error
Date: Fri, 14 Oct 2011 08:34:26 +0100
Message-ID: <4E97E602.3000809@gmail.com>
References: <4E93E9B8.3010005@gmail.com> <4E94480C.4050604@googlemail.com> <4E95D9E2.4010002@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=aMQQQGZxOYf8wI85ffGlv6BxCNT0y4FOoN/3F+7LSl8=;
        b=pz0qobiSV3OQvxzDwxAgKJnVZOd96NDEZosMesEyjj7EYIGcxa/KuA7I5K4u+IRBYw
         Ok/a/d34V1roz1dQY2Uxe9jH6ZuuYQsZBtkOwfN2zur6Li4H36bJ6XtjZ9JmuI+fo5nC
         6Iq7ZnIxVLQE2Mw4+Uw4fBaqk9gqPF3jf07Nw=
In-Reply-To: <4E95D9E2.4010002@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

The hosting company have told me that masquerade is not activated:

MASQUERADE target isn\'t activate on your VPS.
You can use SNAT or DNAT target in nat tables.

So, how can I use SNAT and DNAT to route the traffic to my OpenVPN?

[root@vps8259 myscripts]# echo 1>   /proc/sys/net/ipv4/ip_forward
[root@vps8259 myscripts]# iptables -A FORWARD -m state --state  RELATED,ESTABLISHED -j ACCEPT
[root@vps8259 myscripts]# iptables -A FORWARD -s 10.8.0.0/24 -j ACCEPT
[root@vps8259 openvpn]# iptables -A FORWARD -s 172.16.0.0/24 -j ACCEPT
[root@vps8259 openvpn]# iptables -A FORWARD -j REJECT
[root@vps8259 openvpn]# iptables -t nat -A POSTROUTING -s 10.8.0.0/24  -o venet0 -j MASQUERADE
iptables: Unknown error 4294967295
[root@vps8259 openvpn]# iptables -t nat -A POSTROUTING -s 10.8.0.0/24  -o venet0 -j MASQUERADE
iptables: Unknown error 4294967295




On 12/10/11 19:18, J Webster wrote:
>>  The problem here may be venet0 interface. As far as I know, there is no
>>  support for "nat" tables on OpenVZ virtual network interfaces.
>
> Thanks. If that is the case, then how do I postroute on a virtual 
> network?
>
>  [root@vps8259 openvpn]# iptables -t nat -A POSTROUTING -s 
> 10.8.0.0/24  -o venet0 -j MASQUERADE
>  iptables: Unknown error 4294967295
>  [root@vps8259 openvpn]# iptables -t nat -A POSTROUTING -s 
> 10.8.0.0/24  -o venet0 -j MASQUERADE
>  iptables: Unknown error 4294967295
