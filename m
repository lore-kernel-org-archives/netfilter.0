From: Jose Maria Lopez <jkerouac@eresmas.com>
Subject: Re: failure when using --string
Date: 28 Aug 2004 04:01:52 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1093658511.18215.4.camel@nostromo.bgsecm.com>
References: <D5C9032B2B09C64EA2409D6214E91AC906420B@asimail2.alphanumeric.com>
	<20040827091446.GH22322@metastasis.org.uk>
	<200408271021.48984.gdh@acentral.co.uk>
	<20040828002917.GZ22322@metastasis.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040828002917.GZ22322@metastasis.org.uk>
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

El sáb, 28 de 08 de 2004 a las 02:29, Nick Drage escribió:
> On Fri, Aug 27, 2004 at 10:21:48AM +0100, Gavin Hamill wrote:
> > On Friday 27 August 2004 10:14, Nick Drage wrote:
> 
> > > I'm not sure about upgrading netfilter on a distribution like Debian,
> > > apt-get trundles along nicely, I'm kind of loathe to play.  Is anyone
> > > else here using a more recent version of netfilter on Debian?
> > 
> > Yep, works just fine.. 
> > 
> > http://backports.hands.com/debian/dists/stable/iptables/binary-i386/
> > 
> > OK it's not cutting edge 1.2.11, but it's at least progress from that shipped 
> > with woody :)
> 
> Shame, 1.2.11 is what I'm after I believe.  I need to read up on the
> release notes but some of the extra functions, like string matching and
> the tarpit, are what I'd like to play with.

And anyway if you change your iptables to version 1.2.11 you will want
to recompile your kernel to add the new features.

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


