From: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Completely NAT an ISP: A practical possibility?
Date: Thu, 20 Jun 2002 20:19:43 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020621001943.GA2453@cannon.eng.us.uu.net>
References: <3D0BBC45.5000807@palaver.net> <20020618202115.32CD7C94DF@srv11-sao.terra.com.br> <20020618225058.GC27054@cannon.eng.us.uu.net> <200206200948.g5K9m7U31874@vulcan.rissington.net> <20020620193615.40DDAC87AF@srv9-sao.terra.com.br>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <20020620193615.40DDAC87AF@srv9-sao.terra.com.br>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rodrigo Senra <rodsenra@gpr.com.br>
Cc: netfilter@lists.samba.org

On Thu, Jun 20, 2002 at 04:37:10PM -0300, Rodrigo Senra wrote:

> > > > time being this is used to accomodate a multiple-ISP cenario where
> > > > clients need basically HTTP, FTP, and less percentage of H.323.
> > >
> > > Just a small note. FTP is one of the protocols that would break...
> > 
> > This is, of course, assuming that they only do "simple NAT", rather than 
> > implementing netfilter + associated helper modules inside the ISP....
> > 
> 
> Thank you Antony.
> 
> Indeed we were discussing different things! I believe now that Ramin
> made reference that protocols would break due to a lack of "connection
> conntracking" withou which packets couldn't suffer NAT properly. We have
> implemented a rudimentar NAT+conntrack kernel 2.2 patch, because by the time
> we netfilter/iptables was not available in all its glory ;o).

Oh, I see, I wasn't thinking in terms of netfilter when I read your
original email about NATting FTP. Yes, FTP is supported and (although
I didn't do it myself) H.323 is also supported (except for certain
functionalities, I hear). So, you can easily say that your routed
context DSL solution works by means of a linux nat box.

Do you guys do DNAT too? I mean do you let the costomers run services?
Who assigns IP's to them? The content providers? How do you sync up
with them for the DNAT? The whole NAT solution between the medium provider
and the content provider is still a bit vague to me, especially when you
sell static IP's to the customers...

> What we did was to use a priority queue and hashtables to implement full
> NAT to FTP and H.323 only (our immediate needs by then).

Feel free to elaborate on this priority queue/hashtables implementation
to solve FTP/H.323 problem. Sounds like an extendable thing for other
unfriendly protocols.

> We've upgraded the solution to use netfilter/iptables last year.

Good for you.

Ramin

> regards,
> Senra 
> 
> -- 
> Rodrigo Senra         
> MSc Computer Engineer   (GPr Sistemas Ltda)     rodsenra@gpr.com.br 
> http://www.ic.unicamp.br/~921234  (LinUxer 217.243) (ICQ 114477550)

