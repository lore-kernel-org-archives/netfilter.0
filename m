From: Roger <roger@efn.org>
Subject: Re: Portscan logging?
Date: Sun, 13 Oct 2002 18:16:20 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021014011620.GA1572@efn.org>
References: <3DAA09B7.9040305@gmx.de>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3DAA09B7.9040305@gmx.de>
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
To: Sven Schuster <schuster.sven@gmx.de>
Cc: netfilter@lists.netfilter.org



Around Mon,Oct 14 2002, at 02:03,  Sven Schuster, wrote:
> Hello everybody,
> are down and the default policy is ACCEPT. But when I put in all my 
> rules, the scanlogd doesn't log any portscans from the internet. I think 
> that is because the packets are already dropped in the kernel by the 
> iptables module, am I right??
> 
> And know my question is if there's a chance to log portscans (maybe also 
> the different kinds??) via some iptables-rules, an extra iptables-module 
> or any other tool?? I hope that somebody knows something about it, 
> because I think it's very nice to see how much people try to find holes 
> in any system...it's already quite interesting to review the Apache-Logs 
> everyday, with peoples thinking there's an IIS running on my system :-)))
use the logging feature.

iptables -I INPUT -t tcp  -j LOG --log-prefix "IPTABLES-IN "

would log *any* inbound tcp connection to syslog.  Including traffic 
you have created (the return of an HTTP or FTP session)

You could pick a couple of ports and set logging on those ports:

iptables -I INPUT -t tcp --dport 80  -j --log-prefix "IPTABLES-IN "  

would log any ports that attempt a scan of your port 80.  Your outbound 
HTTP would not be picked up by this.
I use IN as part of my INPUT log prefix, and OUT as part of my OUTPUT log 
prefix, it makes it easier to track.

Roger

-- 
roger@efn.org

