From: Jose Maria Lopez <jkerouac@eresmas.com>
Subject: Re: forwarding traffic to different hosts
Date: 27 Aug 2004 01:03:34 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1093561412.20349.2.camel@nostromo.bgsecm.com>
References: <20040826224357.GF22322@metastasis.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040826224357.GF22322@metastasis.org.uk>
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

El vie, 27 de 08 de 2004 a las 00:43, Nick Drage escribió:
> Hi,
> 
> Sorry, another question, things aren't working well for me tonight.  If
> I want traffic to port 777 on a host to be redirected to another host on
> the same LAN, will this do the job?
> 
> I'm on host 198.81.129.100, and I want all traffic from IP address
> 207.155.252.12 to port 777 to be redirected to a different host, .101 on
> the same network, if I try this rule it fails:
> 
> iptables -t nat -I PREROUTING --source 207.155.252.12 -p tcp --dport 777
> -j DNAT --to-destination 198.81.129.101
> 
> But I don't see anything in the logs.  I tried permitting all traffic to
> port 777 in for FORWARD and OUTPUT tables, but that didn't make a
> difference.
> 
> Any ideas?

Maybe it's a routing problem. Try to use ethereal to see what's
happening with your packets and if you are receiving or sending
ICMP error packets.

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


