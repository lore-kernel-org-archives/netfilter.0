From: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Subject: Re: HELP SSL-problem
Date: Fri, 7 Jun 2002 00:16:14 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020607041614.GA2731@cannon.eng.us.uu.net>
References: <GGECKAHHDGDOOLALHDJFCEIKCAAA.sinaasappelsap@planet.nl>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <GGECKAHHDGDOOLALHDJFCEIKCAAA.sinaasappelsap@planet.nl>
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
To: AB <sinaasappelsap@planet.nl>
Cc: netfilter@lists.samba.org

On Thu, Jun 06, 2002 at 09:05:25PM +0200, AB wrote:

> Hello everybody, I hope someone out there can help me with a problem I have
> :-)
> 
> Recently I compiled the 2.4.18 version of the Linux kernel. I am using

Has this ever worked with any other masquerading setup?

> IPtables with one rule in it:
> 
> 	iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
> 
> Internet works fine but I bump into trouble trying to reach an internet
> banking site.
> It uses https. The first few pages work well but when I have authenticated
> and
> want to see my account it seems to timeout.
> The same problem occurred when I tried to subscribe to a hotmail account.
> 
> I've tried other https pages and they work just fine.
> I've tried to pinpoint the problem with tcpdump and with ethereal but I
> can't find it.
> I know now that ssl3 is used and that it DOES work when I establish a direct
> connection
> (not through the Linux router)....
> 
> PLEASE anyone HELP ME... Tell my I'm stupid and please tell me what I'm
> doing wrong.

I'm not sure about the internals of SSL but I don't think the SSL communication
can get disrupted by masquerading. Are you sure there is no other things like
ident holding you up? Just a guess...

Ramin

> If there's any config or log or whatever file you want to see, let me know
> :-)
> 
> Thank you, for reading this. Arjan.
> 

