From: SBlaze <dagent.geo@yahoo.com>
Subject: Re: Need help have some questions...
Date: Sat, 23 Aug 2003 13:51:58 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030823205158.60796.qmail@web40210.mail.yahoo.com>
References: <20030818205223.GA3993@cannon.eng.us.uu.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030818205223.GA3993@cannon.eng.us.uu.net>
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
To: nf <netfilter@lists.netfilter.org>


Going to try to fit all my comments for this thread into one email and hope
everyone reads. Here we go.

First off I would like to say a big thanks to Ralf and Ramin. They gave really
good explanations that I needed to see why this hasn't been addressed. While I
still would like to see this kind of functionality in iptables I can see why it
is not.

To those stressing that it would be too much on the CPU and memory I have to
wonder how valid this is. I know it would certainly increase the load but I do
not believe it would overload most systems.

Ralf made some really good points. He says I should use a proxy. Ok so how do I
go about proxying my two web sites that are hosted with apache? Honestly I'm
not being sacrastic I really don't know. Going along with what Ramin says is
the third level of a fully implemented firewall(the application level) am I to
assume then that it is then to fall to a proxy(I again don't know what sort of
proxy I need here...not sure squid is what I need) or I would really like to
ask should it fall to apache(if so anyone know of how to define what apache
logs?)

A question to Ralf about the second lawyer of a firewall. Is a circut relay
also known as a bridge?

Also a question to Ramin. You make note in that last post of basically dealing
with the HTTP protocol on the HTTP application level.... are you referreing to
web server(apache) ?

Thanks to all who are helping out. I see a soloution coming about. With a
little more help I and some others I know may get there.

Thanks
SBlaze

=====
"Winky is not knowing how sir, winky is not knowing how?" -=Winky / Harry Potter and the Goblet of Fire=-"

__________________________________
Do you Yahoo!?
Yahoo! SiteBuilder - Free, easy-to-use web site design software
http://sitebuilder.yahoo.com

