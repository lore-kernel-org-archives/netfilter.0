From: Jose Maria Lopez <jkerouac@eresmas.com>
Subject: Re: tcpdump and Iptables
Date: 02 Sep 2004 22:25:56 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094155695.16865.7.camel@nostromo.bgsecm.com>
References: <41375ED1.5090400@kdtc.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41375ED1.5090400@kdtc.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="utf-8"
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

El jue, 02 de 09 de 2004 a las 19:56, CC escribió:
> Hi,
> 
> I think I've asked this before here, but I
> don't remember what the answer was.
> 
> If I have iptables running and I do a
> tcpdump -i eth0,   at what point is
> tcpdump listening to the connection?
> 
> I'm trying to troubleshoot my firewall,
> but am not seeing the right behaviour
> as the packets that I'm trying to block
> by the following command:
> 
> $IPTABLES -A FORWARD -i eth1 -p tcp \
>               -d 192.168.7.1 -j DROP
> 
> But I still get tcp packets going to
> 192.168.7.1.

Wouldn't it work if you use -o eth1 instead of
-i eth1. Where it's situated 192.168.7.1? If
the routes says it has to go through eth1 to
get to 192.168.7.1 then you need -o.

Or maybe you have packets routed through other
interfaces, not eth1. Or maybe the packets
are being originated in the same firewall, so
the FORWARD rule does not apply.

> 
> And wouldn't :
> 
> $IPTABLES -A FORWARD -i eth1 -p tcp \
>              -s 192.168.7.1 -j DROP
> 
> in effect disables all access to the
> internet for machine IP 192.168.7.1?
> 
> But my main query is about the
> relationship between the packets that
> TCPDUMP sees and where the packets
> are within the packet filtering
> process.
> 
> Thanks
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


