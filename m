From: gypsy <gypsy@iswest.com>
Subject: Re: string match fails to find anything/everything
Date: Tue, 20 Jul 2004 23:12:46 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40FE095E.3C5DB307@iswest.com>
References: <20040718221103.28836.60474.Mailman@vishnu.netfilter.org> <2996.216.239.71.162.1090327934.squirrel@216.239.71.162>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Samuel Jean <sjean@cookinglinux.org>, netfilter <netfilter@lists.netfilter.org>

Samuel Jean wrote:
> 
>  On Sun, 18 Jul 2004, gypsy wrote:
> > Problem:
> > No matter what text is in $STRING, iptables fails to see the match.
> >
> > iptables -I INPUT -m string --string $STRING -j LOG
> 
> That rule will _only_ apply for packets going to the firewall itself.

Which is where the request is coming from - not from anybody on my side
of the firewall.  So the FORWARD chain is never going to see the string
I want to log.

Gypsy

