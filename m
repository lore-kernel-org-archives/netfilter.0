From: Jose Maria Lopez <jkerouac@eresmas.com>
Subject: Re: tcpdump and Iptables
Date: 03 Sep 2004 19:20:25 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094222205.4370.20.camel@nostromo.bgsecm.com>
References: <41375ED1.5090400@kdtc.net>
	<20040902180705.GG3755@metastasis.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040902180705.GG3755@metastasis.org.uk>
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

El jue, 02 de 09 de 2004 a las 20:07, Nick Drage escribió:
> On Fri, Sep 03, 2004 at 01:56:33AM +0800, CC wrote:
> 
> > If I have iptables running and I do a tcpdump -i eth0,   at what point
> > is tcpdump listening to the connection?
> 
> tcpdump will see the packets before IPTables does anything to them.

If that's true (I don't doubt it) then I have a question:
Where in the routing process does tcpdump see the traffic?
It can be very important to know it for some studies.


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


