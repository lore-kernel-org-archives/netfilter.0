From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Yahoo Messenger
Date: Sun, 6 Oct 2002 10:11:29 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021006091131.LDNX459.mta02-svc.ntlworld.com@there>
References: <20021006085222.69643.qmail@web40011.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021006085222.69643.qmail@web40011.mail.yahoo.com>
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
To: Netfilter <netfilter@lists.netfilter.org>

On Sunday 06 October 2002 9:52 am, Hanz F. wrote:

> Hi,
> blocking yahoo messenger on iptables is not enough,
> becoze users will still be able to connect through a
> proxy, u have to block it on the proxy as well.
>
> Concerning my email of 10/01/02 it was not very
> accurate, but unfortunately nobody warned me, I had to
> discover the error by myself: there's a missing line ,
> when I added it, yahoo messenger and ICQ worked (as
> well as IRC after loading related modules)
> this line is:
> iptables -A FORWARD -i eth0 -o eth1 -m state --state
> ESTABLISHED, RELATED -j ACCEPT
>
> If u don't insert this line yahoo messenger will not
> work but also most applications.

I really don't see what this rule has to do with Yahoo Messenger specifically.

It simply says "allow packets through this firewall from eth0 to eth1 which 
are part of an existing connection, or related to one".

It is completely non-specific about any protocol (from OSI layer 3 up to 
layer 7) and cannot possibly be used to block or allow access to something 
specific such as Yahoo Messenger without affecting virtually everything else 
going through the firewall as well.

Unfortunately I know nothing about quite how Yahoo Messenger does work, and 
therefore I can't propose any sensible ways of blocking access to it, but 
it's surely going to be something less generalised than this.

Antony.

-- 

Normal people think "if it ain't broke, don't fix it".
Engineers think "if it ain't broke, it doesn't have enough features yet".

