From: Jose Maria Lopez <jkerouac@eresmas.com>
Subject: Re: multiple mapping
Date: 01 Sep 2004 18:44:39 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094048371.6066.3.camel@nostromo.bgsecm.com>
References: <006701c48ff9$9627b5b0$2a245cc2@cea05>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <006701c48ff9$9627b5b0$2a245cc2@cea05>
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
To: Netfilter <netfilter@lists.netfilter.org>

El mié, 01 de 09 de 2004 a las 09:59, Tomek Macioszek escribió:
> Hi
> I have my FIREWALL BOX with address 4.3.2.1 (eth0) and local address 192.168.10.0/24.
> Now I have SNAT:
> iptables -t nat -A POSTROUTING -s 192.168.10.0/24 -o eth1 -j SNAT --to 4.3.2.1
> I would like to make SNAT with i.e two external address.
> iptables -t nat -A POSTROUTING -s 192.168.10.0/28 -o eth1 -j SNAT --to 4.3.2.1
> iptables -t nat -A POSTROUTING -s 192.168.10.128/28 -o eth1 -j SNAT --to 4.3.2.2. It is good solution? Should I make alias for eth0 with address 4.3.2.2?

Yes, it's a good solution, and you can use --to more than once in the
same rule. Check iptables -j SNAT --help.
You should have an alias for the IP if you need routing through the IP,
not only for the SNAT.

> Thanks for help and sorry for my English.
> Best regards
> T.  
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


