From: "Mack" <RAGAN_DAVIS@colstate.edu>
Subject: Re: need some help solving problem
Date: Mon, 31 Mar 2003 10:22:34 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E8816E9.23197.30E614@localhost>
References: <3E859680.19568.5FA7E8@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <200303291355.47578.netfilter@newkirk.us>
Content-description: Mail message body
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
To: netfilter@newkirk.us, netfilter@lists.netfilter.org

This seems to work great!  Thanks for the advice.  The only weirdness I saw was 
that if someone requests "www.somewhere.com/subweb", then they get a page not 
found error.  But, this was the case with my original dnat code, too.  I guess it's 
looking for the path "/subweb" on the document root of the web site that I'm 
redirecting them too, and since it's not there, it give an error.  But, using your limit 
and state match suggestion, this should rarely happen and I doubt I'll have too many 
complaints about it.  Nevertheless, I am going to look into your web proxy 
suggestion.  I am currently using Squid for another application, so maybe this will 
serve the purpose.  Have you ever used Squid, and if so, do you have any 
suggestions as to how I'd configure Squid to do this?

Thanks for the help!
mack

On 29 Mar 2003 at 13:55, Joel Newkirk wrote:

> On Saturday 29 March 2003 12:50 pm, Mack wrote:
> > Hi!
> 
> Hi! :^)
> 
> > I currently have a rule in my iptables firewall script like this:
> >
> > iptables -t nat -A PREROUTING -p tcp -s 1.2.3.4 --dport http -j DNAT
> > --to 5.6.7.8:80
> >
> > This successfully "redirects" a client trying to go to
> > www.somewhere.com and sends them to a web site on my webserver, and
> > displays the default web page for that web site.  This works fine.
> > However, this happens on every request from the client.  Is there a
> > way to have the prerouting happen only once, and then not happen
> > after that?  I'd like to redirect them to a web page that contains
> > news or important imformation.  Once they've visited this page, I'd
> > like for them to not see it again until later (if ever).  I was
> > looking at the "-m recent" extension, but I'm not sure if this will
> > work.
> >
> > Any ideas/suggestions?
> 
> Two ways come to mind.  The first is redirect everything to a proxy,
> and handle this there.  (that's the better solution.) The second is
> using the limit match.
> 
> iptables -t nat -A PREROUTING -s 1.2.3.4 -p tcp --dport 80 -m limit
> --limit 2/d --limit-burst 1 -m state --state NEW -j DNAT --to 5.6.7.8
> 
> This will redirect them to 5.6.7.8, then not do it again for 12 hours.
>  You can match 1/d or whatever frequency you want, just make the limit
> what you need, and keep burst at 1, for this purpose.  (with burst set
> to 3, for instance, then the first three attempts would match)  The
> minimum frequency is 1/d.
> 
> Be aware that this could also match an attempt to retrieve an image
> inlined in a web document already loading, or other similarly
> problematic outcomes...  With a proxy you could set up to do this in a
> more precise and effective fashion.  (recent match would suffer the
> same problem as limit)
> 
> > many thanks,
> > mack
> 
> j
> 



