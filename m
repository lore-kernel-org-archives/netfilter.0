From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: Is this firewall good enough?
Date: Wed, 09 Jun 2004 09:47:26 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1086788846.2117.24.camel@grendel>
References: <20040609073259.90131.qmail@web14713.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040609073259.90131.qmail@web14713.mail.yahoo.com>
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
To: netfilter <netfilter@lists.netfilter.org>

On Wed, 2004-06-09 at 03:32, Sagara Wijetunga wrote:
>
> Here I have almost no choice, just have budget for one
> server :(

That's what I figured. Thus the info I included at the end of my post. 

> 
> > 17. /sbin/iptables -P OUTPUT ACCEPT
> >  
> Could you elaborate this a bit? What are the possible
> outbound transports and what are the possible
> solutions? 

This rule permits any outbound session establishment. This means if an
attacker can exploit one of your exposed services they can use anything
they want (HTTP, FTP, TFTP, etc. etc.) as an outbound session to
transfer a toolkit/rootkit. 

A better solution may be to only permit the types of outbound access
that you actually need to support (outbound DNS, SMTP, etc.).

> Our intension to host the server in a data center. Our
> server is not required to act as a client other than
> receiving mail from other STMP servers. We do not even
> offer recursive DNS. Is the SMTP, the client service
> that you refer?

By "client services" I was referring to the rule above that permits all
outbound traffic. Sorry I was not clear. Typically with a server you
only permit the types of outbound access that you know you will need to
support. I was assuming that the box was going to act as someone's
desktop because of the "permit anything outbound" rule.

> Could you kindly elaborate payload based attacks? Is
> it the packet rate per second? And what are the
> possible solutions for payload based attacks?

iptables controls traffic at the header level (IP address, port numbers,
transport, etc.). So while you can use iptables to ensure that only
TCP/80 traffic reaches your Web server, this does not protect you
against someone launching an HTTP based attack through port TCP/80. Sure
you can use "--string" to match on payload, but unless you define every
possible attack pattern and ensure that people never fragment their data
stream its not going to be effective.

To protect against payload based attacks you need to use a proxy. Squid
is an excellent example of software you can run to help protect a Web
server from payload based attacks (especially if run Jean on top of
Squid).

Of course the problem is you only have one box to work with so trying to
proxy every service is not going to happen. This is one of the risks you
are going to have to live with because of the design. :(

> > Some other things you could do to mitigate this
> > risk:
> > Setup an automatic patching system
> > Setup Tripwire or Aide to check system integrity
> > Setup another system to collect the logs off of this
> > system 
> > 	Setup Swatch or a similar tool to check these logs
> > Setup an IDS
> > 
> Could you point me to learn more into above setup
> subjects?

Some additional reading you might find helpful:
http://www.novell.com/products/desktop/update.html
http://sourceforge.net/projects/aide
http://www.loganalysis.org/
http://www.snort.org/

HTH,
Chris



