From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Need help have some questions...
Date: Mon, 25 Aug 2003 18:40:13 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030825224013.GC28045@cannon.eng.us.uu.net>
References: <20030825203905.32224.qmail@web40207.mail.yahoo.com> <1061845024.1507.93.camel@kermit>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1061845024.1507.93.camel@kermit>
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
To: Ralf Spenneberg <lists@spenneberg.org>
Cc: SBlaze <dagent.geo@yahoo.com>, nf <netfilter@lists.netfilter.org>

On Mon, Aug 25, 2003 at 10:57:05PM +0200, Ralf Spenneberg wrote:

> Oh, that i might not remember your original post correctly. Lets see ...
> Well, yeah you are right, you never said you wanted to redirect but just
> reject. Ok, my fault.
> Then you could just put a proxy in between. Run your Apache on 8080 and
> run a reverse proxy like apache or squid on 80. But I doubt, that you
> would be happy with it, because it will eat up resources. 
> Make a long thread short:
> There is no good way to do it on one machine. Since you are using Apache
> and not IIS, you will be fine. If the log messages annoy you, bad luck.
> This is just life if you don't filter the request first using a proxy.

OK. If SBalze is running apache, why not using the powerful rewrite rules
of "the great" apache to keep the bad guys away? No need for a
"circuit relay" ;) or a "dumb bridge" ;)

Ramin

> Cheers,
> 
> Ralf

