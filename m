From: Robert Vazan <robertvazan@host.sk>
Subject: Re: netfilter digest, Vol 1 #570 - 12 msgs
Date: Sun, 2 Feb 2003 13:31:44 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030202123135.GA334@pc77969vm1.soluziona.sk>
References: <20030201232700.1610.60138.Mailman@kashyyyk> <3E3C643C.4090008@aut.ac.nz>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3E3C643C.4090008@aut.ac.nz>
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
To: netfilter@lists.netfilter.org

On Sun, Feb 02, 2003 at 01:20:12PM +1300, Ian Batterbee wrote:
> >Subject: How does squid know original destination?
> >From: Robert Vazan <robertvazan@host.sk>
> >
> >If I forward intranet -> internet connections to a proxy program, how do
> >I discover from within my proxy what was original internet destination?
> 
> The important line here is the "Host:" line, ie, the browser puts the name 
> of the site it wants to connect to as part of the HTTP request.

I know about this and I feared this is the way squid is doing it.
Unfortunately, I am not doing HTTP proxy, I want to proxy everything. I
implemented my own TCP/IP stack in old version of my program. I hoped I
could use existing TCP/IP stack in operating system for new version.

The outstanding question is, what were those remarks about NAT options
in getsockopt manpage? I am not dropping hopes yet. I know that TCP/IP
stacks *can* do transparent proxying if they want.

