From: Jose Maria Lopez <jkerouac@eresmas.com>
Subject: RE: traffic graphing?
Date: 25 Aug 2004 21:25:25 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1093445499.28515.13.camel@nostromo.bgsecm.com>
References: <HAEOIFPIBBBLGLHOMLLICEJPCIAA.bclark@eccotours.biz>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <HAEOIFPIBBBLGLHOMLLICEJPCIAA.bclark@eccotours.biz>
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

El mié, 25 de 08 de 2004 a las 09:00, Brent Clark escribió:
> >What would you guys suggest for a good traffic monitoring/graphing 
> >sollution for a iptables (shorewall) firewall?
> 
> Hi 
> 
> I use bandwidthd
> 
> The most fastest installation I have ever had encounted.
> 
> http://bandwidthd.sourceforge.net/

A good option is using Cacti+rrdtool to generate all kind
of graphical stats. You just have to write some scripts
to extract the data from the tables. I'm using something
similar in my firewall, but extracting the data with a
C program from the chains and then graphing it with
rrdtool.


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


