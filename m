From: Thorsten Scherf <tscherf@web.de>
Subject: Re: internal web server
Date: Fri, 5 Sep 2003 15:57:39 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200309051557.39683.tscherf@web.de>
References: <F22386C3FEB012449238672E38ED61E70A8CA2@overlord.overturemedia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F22386C3FEB012449238672E38ED61E70A8CA2@overlord.overturemedia.com>
Content-Disposition: inline
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
To: Fritz Mesedilla <fritz.mesedilla@overturemedia.com>, netfilter@lists.netfilter.org

>- external ip of firewall 202.138.128.xxx
>- internal ip of firewall 192.168.247.3
>- internal web server with ip 192.168.247.5
>
>This was what my code was...
>$IPT -t nat -A PREROUTING -p tcp -d 192.168.247.3 --dport 80 -j DNAT
> --to-destination 192.168.247.5:80
>
>It doesn't seem to work. I have set the web server to use the gw of
> 192.168.247.3

Not really sure what you want, but if you try to write a rule for forwarding 
packets which destination Port 80 to your internal web server, try this 
one:

$IPT -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to-destination 
192.168.247.5:80

If you know your external fw-IP you can specify it in the rule:

$IPT -t nat -A PREROUTING -p tcp --dport 80 -d 202.138.128.xxx -j DNAT 
--to-destination 192.168.247.5:80


Greetings,

Thorsten Scherf,
RHCE, RHCX


