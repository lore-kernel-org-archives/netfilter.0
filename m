From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: securing windows farm  using iptables
Date: Fri, 24 Oct 2003 09:49:09 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031024104021.34E141B9B9@smtp.ttp.nl>
References: <F22386C3FEB012449238672E38ED61E706C257@overlord.overturemedia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F22386C3FEB012449238672E38ED61E706C257@overlord.overturemedia.com>
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
To: netfilter@lists.netfilter.org

> How can I protect a windows exchange server and domain controller?
> windows farm --- linux iptables -- internet
> 
> Again, I cannot change the windows exchange to linux postfix. 
> Although it is within my authority to move to linux, hundreds 
> of people using the windows farm won't be glad for a drastic 
> change. I am slowly moving some people to linux though. :D

You don't have to. Put a Linux/Postfix mail relay between Exchange and
the internet and firewall the machine. Then you can also do spam/virus
filtering, etc.
Your people won't notice it (well, smart ones maybe).

> For the exchange server, what ports do I need to open? Do I 
> need some port forwarding? I want to create some sort of 
> routing through iptables so I can secure the windows server as well.

For pop/imap/ldap access you could do portforwarding, but also proxying.
In that case maybe Delegate is what you want but there could be better
options than Delegate. (http://www.delegate.org/delegate/)

> For the domain controller, people said I need to make sure dns 
> is open. What else do I need to open up? Again, can I just do 
> some routing for the dns?

If the DC requires DNS and has a DNS service ; yes. That can be covered
with NAT.

You can configure Exchange to use a smart host (in the above example :
Postfix) which does the actual sending of email on the internet. Then,
local DNS is enough for Exchange.


Gr,
Rob


