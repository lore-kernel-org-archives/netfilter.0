From: SBlaze <dagent.geo@yahoo.com>
Subject: Re: Need help have some questions...
Date: Mon, 25 Aug 2003 15:53:09 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030825225309.56171.qmail@web40204.mail.yahoo.com>
References: <20030825224013.GC28045@cannon.eng.us.uu.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030825224013.GC28045@cannon.eng.us.uu.net>
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
Content-Transfer-Encoding: 7bit
To: Ramin Dousti <ramin@cannon.eng.us.uu.net>, Ralf Spenneberg <lists@spenneberg.org>
Cc: SBlaze <dagent.geo@yahoo.com>, nf <netfilter@lists.netfilter.org>


--- Ramin Dousti <ramin@cannon.eng.us.uu.net> wrote:
> On Mon, Aug 25, 2003 at 10:57:05PM +0200, Ralf Spenneberg wrote:
> 
> > Oh, that i might not remember your original post correctly. Lets see ...
> > Well, yeah you are right, you never said you wanted to redirect but just
> > reject. Ok, my fault.
> > Then you could just put a proxy in between. Run your Apache on 8080 and
> > run a reverse proxy like apache or squid on 80. But I doubt, that you
> > would be happy with it, because it will eat up resources. 
> > Make a long thread short:
> > There is no good way to do it on one machine. Since you are using Apache
> > and not IIS, you will be fine. If the log messages annoy you, bad luck.
> > This is just life if you don't filter the request first using a proxy.
> 
> OK. If SBalze is running apache, why not using the powerful rewrite rules
> of "the great" apache to keep the bad guys away? No need for a
> "circuit relay" ;) or a "dumb bridge" ;)
> 
> Ramin
> 
> > Cheers,
> > 
> > Ralf
> 
What are these rewrite rules you are talking about? I have never heard of such.
What do they do? How do they work?

SBlaze

=====
"Winky is not knowing how sir, winky is not knowing how?" -=Winky / Harry Potter and the Goblet of Fire=-"

__________________________________
Do you Yahoo!?
Yahoo! SiteBuilder - Free, easy-to-use web site design software
http://sitebuilder.yahoo.com

