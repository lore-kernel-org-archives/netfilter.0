From: "Rob Sterenborg (lists)" <lists@sterenborg.info>
Subject: Re: masquerade error
Date: Fri, 14 Oct 2011 10:55:36 +0200
Message-ID: <1318582536.3179.5.camel@ns014530.dcyb.net>
References: <4E93E9B8.3010005@gmail.com> <4E94480C.4050604@googlemail.com>
	 <4E95D9E2.4010002@gmail.com>  <4E97E602.3000809@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4E97E602.3000809@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: J Webster <jw.jwebster@gmail.com>
Cc: netfilter@vger.kernel.org

On Fri, 2011-10-14 at 08:34 +0100, J Webster wrote:
> The hosting company have told me that masquerade is not activated:
> 
> MASQUERADE target isn\'t activate on your VPS.
> You can use SNAT or DNAT target in nat tables.
> 
> So, how can I use SNAT and DNAT to route the traffic to my OpenVPN?

-j SNAT --to-source <internet_ip>
-j DNAT --to-destination <internal_ip>

Please check the SNAT and DNAT targets with 'man iptables' for the
details.


--
Rob


> [root@vps8259 myscripts]# echo 1>   /proc/sys/net/ipv4/ip_forward
> [root@vps8259 myscripts]# iptables -A FORWARD -m state --state  RELATED,ESTABLISHED -j ACCEPT
> [root@vps8259 myscripts]# iptables -A FORWARD -s 10.8.0.0/24 -j ACCEPT
> [root@vps8259 openvpn]# iptables -A FORWARD -s 172.16.0.0/24 -j ACCEPT
> [root@vps8259 openvpn]# iptables -A FORWARD -j REJECT
> [root@vps8259 openvpn]# iptables -t nat -A POSTROUTING -s 10.8.0.0/24  -o venet0 -j MASQUERADE
> iptables: Unknown error 4294967295
> [root@vps8259 openvpn]# iptables -t nat -A POSTROUTING -s 10.8.0.0/24  -o venet0 -j MASQUERADE
> iptables: Unknown error 4294967295
> 
> 
> 
> 
> On 12/10/11 19:18, J Webster wrote:
> >>  The problem here may be venet0 interface. As far as I know, there is no
> >>  support for "nat" tables on OpenVZ virtual network interfaces.
> >
> > Thanks. If that is the case, then how do I postroute on a virtual 
> > network?
> >
> >  [root@vps8259 openvpn]# iptables -t nat -A POSTROUTING -s 
> > 10.8.0.0/24  -o venet0 -j MASQUERADE
> >  iptables: Unknown error 4294967295
> >  [root@vps8259 openvpn]# iptables -t nat -A POSTROUTING -s 
> > 10.8.0.0/24  -o venet0 -j MASQUERADE
> >  iptables: Unknown error 4294967295
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


