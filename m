From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Problem behind my DMZ
Date: Fri, 9 Jan 2004 10:26:57 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040109152657.GA24304@cannon.eng.us.uu.net>
References: <Law9-F354jsKlkag7KO00012b91@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Law9-F354jsKlkag7KO00012b91@hotmail.com>
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
To: Martin Leduc <marled3@hotmail.com>
Cc: netfilter@lists.netfilter.org

On Fri, Jan 09, 2004 at 09:54:42AM +0000, Martin Leduc wrote:

> >Is your IP forwarding turned on?
> 
> Yes, it is.

OK. Then is proxy_arp turned on?

> Can you explain to me why /32 against /28 netmask, or tell me 
> where I can get the documentation?

Take a look at lartc.org.

> >Please use the "ip" utility instead of ifconfig/route/arp/... It's much 
> >easier
> >and more powerful...
> 
> Ok I will tried, but is not installed by default with slackware.  I will 
> search where I can get it.

You might be required to recompile the kernel with the Advanced Routing
features.

Ramin


