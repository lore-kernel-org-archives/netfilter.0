From: Jose Maria Lopez <jkerouac@eresmas.com>
Subject: Re: remove old conntrack entries
Date: 04 Feb 2005 21:46:25 +0100
Message-ID: <1107549965.24666.15.camel@nostromo.bgsecm.com>
References: <0140CEDD3075ED428813B1F2A659081212C7FE@p001ex02.porta.local>
	<1107547924.24666.8.camel@nostromo.bgsecm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
In-Reply-To: <1107547924.24666.8.camel@nostromo.bgsecm.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="utf-8"
To: "Baake, Matthias" <m.baake@porta.de>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

El vie, 04 de 02 de 2005 a las 21:12, Jose Maria Lopez escribió:
> El vie, 04 de 02 de 2005 a las 09:30, Baake, Matthias escribió:
> > Hi,
> > 
> > i'm having problems with my conntrack table. A few days ago i scanned a subnet, thru the problem iptable box, which is not existing. Now about 4 days after that scan these connections are still in the connection tracking. how do i remove them, 
> > or where is the mistake with the configuration at all?
> > 
> > Sorry for the poor english.
> > 
> > Best regards
> 
> Included in our GPL bastion-firewall firewall it's the script
> I attach to this message. It does just what you want.

Reading my own message I have realized that it uses some of
our bastion-firewall functions, but surely you can imagine
how the script works. The only important think it's the one
that uses hping2.

Sorry and Regards.

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


