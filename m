From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Need help have some questions...
Date: Mon, 25 Aug 2003 19:02:37 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030825230237.GA28772@cannon.eng.us.uu.net>
References: <20030825224013.GC28045@cannon.eng.us.uu.net> <20030825225309.56171.qmail@web40204.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20030825225309.56171.qmail@web40204.mail.yahoo.com>
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
To: SBlaze <dagent.geo@yahoo.com>
Cc: Ramin Dousti <ramin@cannon.eng.us.uu.net>, Ralf Spenneberg <lists@spenneberg.org>, nf <netfilter@lists.netfilter.org>

On Mon, Aug 25, 2003 at 03:53:09PM -0700, SBlaze wrote:

> > OK. If SBalze is running apache, why not using the powerful rewrite rules
> > of "the great" apache to keep the bad guys away? No need for a
> > "circuit relay" ;) or a "dumb bridge" ;)
> > 
> > Ramin
> > 
> > > Cheers,
> > > 
> > > Ralf
> > 
> What are these rewrite rules you are talking about? I have never heard of such.

Like already noted by Ralf, if you're running apache on linux you must not fear
about the worms/viruses/... But just to be guarded against the "bad guys"
you can use the rewrite rules in

http://httpd.apache.org/docs/mod/mod_rewrite.html

to do neat stuff like redirecting client's request to a blackhole (if the
client is really a browser). Take a look at the doc. It really is a must
read for people using apache...

Ramin

> What do they do? How do they work?
> 
> SBlaze

