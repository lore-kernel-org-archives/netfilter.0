From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: ssl forward / proxy question
Date: Fri, 25 Jul 2003 15:33:03 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030725193303.GB30070@cannon.eng.us.uu.net>
References: <20030725001249.9399.qmail@saturn5.com> <006701c352db$e891a380$05001aac@breton1>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <006701c352db$e891a380$05001aac@breton1>
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
To: Garcia Ruiz <gar_ruiz@teleline.es>
Cc: jen@saturn5.com, netfilter@lists.netfilter.org

You mean squid is going to handle the "get" requests for https??????
Meaning it's terminating SSL, sending the right cert, negotiating a
session key with the client, getting the request and fetching the
contents based on the "get" request from the right web server on the
LAN????

Can you confirm all the above? If so, squid is a big security hole,
but I'm sure it's not:

http://www.squid-cache.org/Doc/FAQ/FAQ-1.html#ss1.12

Ramin

On Fri, Jul 25, 2003 at 08:38:14PM +0200, Garcia Ruiz wrote:

> Have a look at Squid proxy. The last releases admit SSL reverse proxying. If
> it would be capable of handling different servers your problem would be
> solved. You could have it inside of the firewall (but be careful with
> security issues).
> 
> Regards.
> 
> BGR

