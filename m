From: Axel Heinrici <heinrici76@gmx.de>
Subject: Re: passive ftp and file sharing
Date: Wed, 11 Jun 2003 15:21:45 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200306111521.45814.heinrici76@gmx.de>
References: <3EE063BC000042A9@mail-4.tiscali.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3EE063BC000042A9@mail-4.tiscali.it>
Content-Disposition: inline
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

Hello

On Monday 09 June 2003 11:42, Leonardo Lombardo wrote:
> Hi all,
>
> a question for you: how can I set my iptables firewall so that natted
> lan users can use ftp in passive mode and have winmx, dc,
> audiogalaxy, .... blocked ? I've tried out all that scripts/lists of
> ip/... i've found on the net but nothing... the only way I found to
> block file sharing is to close all ports 800:65535 but this way
> passive ftp is blocked too.... :(( I'm a very beginner with iptables
> so please be patient...
You should use the nat- and conntrack modules for ftp. Not 100% sure of 
the names (ip_nat_ftp ip_conntrack_ftp). Then add a rule which allows 
related and established traffic (iptables -A FORWARD -m --state 
RELATED,ESTABLISHED -j ACCEPT). It is important that this rule comes 
before the rule blocking ports 800:65535. Use iptables -I ... if 
unsure. If the control connection for ftp is done on port 21 passive 
and active ftp should work then. 

greetings 
	Axel


