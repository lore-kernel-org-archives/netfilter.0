From: Jose Maria Lopez <jkerouac@eresmas.com>
Subject: Re: connlimit and LVS
Date: 25 Aug 2004 21:25:28 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1093445746.25289.17.camel@nostromo.bgsecm.com>
References: <f3204f9a04082400405a81100c@mail.gmail.com>
	<f3204f9a040824153160dbb46f@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <f3204f9a040824153160dbb46f@mail.gmail.com>
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

El mié, 25 de 08 de 2004 a las 00:31, Stuart Clark escribió:
> Hi there..
> 
> I have a LVS setup with two directors direct routing to 4 real
> servers. I have been trying to use the 'connlimit' patch from
> Netfilter patch-o-matic on the director to restrict the number of
> concurrent connections coming into the VIP.  I have not been able to
> get it working with the PREROUTING or FORWARD tables, and was
> wondering if is due to LVS that connlimit can not seem to track
> connections?
> 

Maybe the problem is that you are using direct routing, that it's a
hack to redirect the traffic directly to the routers without passing
through the firewall. I don't really know which tables the traffic
passes through when using direct routing, it should be in the LVS
documentation.

Maybe you would have more luck using the iproute2 system to limit the
traffic using advanced routing or QOS.

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


