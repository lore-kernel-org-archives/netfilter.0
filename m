From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: need some help solving problem
Date: Sat, 29 Mar 2003 13:55:47 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200303291355.47578.netfilter@newkirk.us>
References: <3E859680.19568.5FA7E8@localhost>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E859680.19568.5FA7E8@localhost>
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
To: Mack <RAGAN_DAVIS@colstate.edu>, netfilter@lists.netfilter.org

On Saturday 29 March 2003 12:50 pm, Mack wrote:
> Hi!

Hi! :^)

> I currently have a rule in my iptables firewall script like this:
>
> iptables -t nat -A PREROUTING -p tcp -s 1.2.3.4 --dport http -j DNAT
> --to 5.6.7.8:80
>
> This successfully "redirects" a client trying to go to
> www.somewhere.com and sends them to a web site on my webserver, and
> displays the default web page for that web site.  This works fine.=20
> However, this happens on every request from the client.  Is there a
> way to have the prerouting happen only once, and then not happen after
> that?  I'd like to redirect them to a web page that contains news or
> important imformation.  Once they've visited this page, I'd like for
> them to not see it again until later (if ever).  I was looking at the
> "-m recent" extension, but I'm not sure if this will work.
>
> Any ideas/suggestions?

Two ways come to mind.  The first is redirect everything to a proxy, and=20
handle this there.  (that's the better solution.) The second is using=20
the limit match.

iptables -t nat -A PREROUTING -s 1.2.3.4 -p tcp --dport 80 -m limit=20
--limit 2/d --limit-burst 1 -m state --state NEW -j DNAT --to 5.6.7.8

This will redirect them to 5.6.7.8, then not do it again for 12 hours. =20
You can match 1/d or whatever frequency you want, just make the limit=20
what you need, and keep burst at 1, for this purpose.  (with burst set=20
to 3, for instance, then the first three attempts would match)  The=20
minimum frequency is 1/d.

Be aware that this could also match an attempt to retrieve an image=20
inlined in a web document already loading, or other similarly=20
problematic outcomes...  With a proxy you could set up to do this in a=20
more precise and effective fashion.  (recent match would suffer the same=20
problem as limit)

> many thanks,
> mack

j


