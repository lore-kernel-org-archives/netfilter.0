From: Joel Newkirk <firewalldude@newkirk.us>
Subject: Re: iptables logs going to all ttys
Date: Mon, 13 Oct 2003 22:34:22 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1066098862.2384.36.camel@alpha.newkirk.us>
References: <3F8B2E19.7090601@webone.com.au>
Reply-To: firewalldude@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F8B2E19.7090601@webone.com.au>
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
To: lucas <lucas@webone.com.au>
Cc: iptables mailing list <netfilter@lists.netfilter.org>

On Mon, 2003-10-13 at 18:58, lucas wrote:
> Morning all,
> 
> I have the following in my firewall script, and to my knowledge this is 
> meant to stop all logs from going to all ttys but this is not the case 
> and its a real *pain* in the ass.
>
> $IPTABLES -N drop-and-log-it
> $IPTABLES -A drop-and-log-it -j LOG --log-level info
> $IPTABLES -A drop-and-log-it -j DROP
> 
> If someone could give me a hint as to what i have overlooked that would 
> be much appreciated, thanks

Syslog configuration is probably what you missed.  check
/etc/syslog.conf.  Very likely you have something like:
kern.*      /dev/console
in there, which states that all kernel messages of whatever level will
be sent to /dev/console.

For myself, I disable the /dev/console setting, then add:
kern.=debug  /var/log/firewall
kern.=warning /var/log/firewalladmin

Unless you're running a custom kernel with debugging enabled, the first
channel (debug) should be almost empty of traffic, ideal for redirection
to a firewall-only log file with "--log-level debug".  Everything of
level 'info' or higher usually goes to /var/log/messages as well.

j



