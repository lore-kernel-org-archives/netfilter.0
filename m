From: Jose Maria Lopez <jkerouac@eresmas.com>
Subject: Re: tracking usage by mac address
Date: 31 Aug 2004 21:52:27 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1093975734.10779.57.camel@nostromo.bgsecm.com>
References: <41329413.3080407@shaw.ca>
	<1093887545.23659.47.camel@nostromo.bgsecm.com>
	<3063e504083013374bd2a909@mail.gmail.com>  <4133C792.9050909@shaw.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4133C792.9050909@shaw.ca>
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
To: Henry Baxter <henrybaxter@shaw.ca>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

El mar, 31 de 08 de 2004 a las 02:34, Henry Baxter escribió:
> Thank you Jose, I'm going to go with parsing the log with C code which I 
> wouldn't mind writing - but if you could point me to your source, that 
> would be very helpful. From the sounds of your setup George it should 
> work great for us here (a tenth of your bandwidth usage!).
> 
> This mailing list rocks

You can find the source code at our downloads web page:

http://www.bgsec.com/downloads.html

or at the sourceforge web site:

http://bastionfirewall.sourceforge.net

the module you could use it's named
bastion-firewall-stats-1.0.src.tar.bz2

But it's you can also look at google for the Querying
Libiptc HOWTO, that was the document we used to write
our code. Just have in mind that it has a big bug, because
it allocates memory when it open the chain to read the
counters but it doesn't free the memory. If you use the
code in the examples you must do this after you read the
counters:

iptc_free(&h);

If you don't do it your program starts to eat memory and
grows and grows and grows until it uses all the memory in
the system.

We have sent an email to the author of the Howto, but we have
not received any response yet. Hope he reads it's mail and
the new version of the HOWTO adds this code.


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


