From: Jose Maria Lopez <jkerouac@eresmas.com>
Subject: Re: Problem with 2 NAT and 2 ROUTE
Date: 24 Aug 2004 07:17:01 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1093324620.22468.10.camel@nostromo.bgsecm.com>
References: <008801c4891f$70be07b0$0800000a@pc08infierno>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <008801c4891f$70be07b0$0800000a@pc08infierno>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="utf-8"
To: netfilter@lists.netfilter.org

El lun, 23 de 08 de 2004 a las 16:42, Cristian Seva (VOIPLAB) escribió:
> have a problem with mi linux BOX
> 
> Eth0 =  192.168.0.254  (RED A)
> Eth1 =  200.69.123.177/130  (LINK A)
> Eth2 =  192.168.0.100  (RED B)
> Eth3 =  192.168.1.1 para el PPPOE
> ppp0=  DynamicIP (LINK B)
> -------------------------------------------------------------------
> -DEFAULT ROUTE
> 200.69.123.178 (LINKA)
> ppp0 (cdo establece el PPPOE)
> -------------------------------------------------------------------
> -IPTABLES  NAT RULES
> iptables -t nat -A POSTROUTING -s 192.168.0.0/255.255.255.128 -o ppp0 -j
> MASQUERADE
> iptables -t nat -A POSTROUTING -s 192.168.0.128/255.255.255.128 -o eth1 -j
> MASQUERADE
> -------------------------------------------------------------------
> 
> My problem is the only NAT works is the NAT with march with de default
> route..
> 
> Can any one helme?
> 

I think you need Advanced Routing using iproute2 nexthop facility
to send the traffic to both routers, and then masquerade the
connections, masquerading does know who to send the traffic but
it doesn't know how to do it.



-- 
Jose Maria Lopez Hernandez
Director Tecnico de bgSEC
jkerouac@bgsec.com
bgSEC Seguridad y Consultoria de Sistemas Informaticos
http://www.bgsec.com
ESPAÑA

The only people for me are the mad ones -- the ones who are mad to live,
mad to talk, mad to be saved, desirous of everything at the same time,
the ones who never yawn or say a commonplace thing, but burn, burn, burn
like fabulous yellow Roman candles.
                -- Jack Kerouac, "On the Road"


