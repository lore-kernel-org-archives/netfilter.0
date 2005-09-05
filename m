From: Andy Furniss <andy.furniss@dsl.pipex.com>
Subject: Re: proper context for connbytes
Date: Mon, 05 Sep 2005 20:57:25 +0100
Message-ID: <431CA325.6020006@dsl.pipex.com>
References: <20050816051846.846924C62E@crs.ultradns.net>
	<A6B8B856-F6B9-40C6-9DF1-6697BDAF9A9B@iacookie.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <A6B8B856-F6B9-40C6-9DF1-6697BDAF9A9B@iacookie.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cookie <cookie@iacookie.net>
Cc: netfilter@lists.netfilter.org

cookie wrote:
> Hello-
>   After trying out several modules from Modwall
> http://www.stearns.org/modwall/
>   I was stumped when I encountered the mapssh module.
> http://www.stearns.org/modwall/mapssh
> 
> ##    The mapssh module uses some very tight checks to identify the SSH
> ##protocol string found at the beginning of a connection.  Because it
> ##strictly limits how many packets it inspects, it _should_ not produce
> ##high load on the system, even when inspecting every tcp connection.
> ##There is a small chance of false positives and/or false negatives.
> /sbin/iptables -N mapssh
> /sbin/iptables -F mapssh
> /sbin/iptables -A mapssh -m u32 --u32 '0>>22&0x3C@ 12>>26&0x3C@  
> 0=0x5353482D' -j LOG --log-prefix mapssh
> /sbin/iptables -A INPUT -i ! lo -p tcp ! -f -m connbytes --connbytes  
> 0:255 -m state --state ESTABLISHED -m length --length 46:375 -j mapssh
> /sbin/iptables -A FORWARD -p tcp ! -f -m connbytes --connbytes 0:255 - m 
> state --state ESTABLISHED -m length --length 46:375 -j mapssh
> /sbin/iptables -A OUTPUT -p tcp ! -f -m connbytes --connbytes 0:255 - m 
> state --state ESTABLISHED -m length --length 46:375 -j mapssh
> 
>   It all goes well till it hits the 4th line (the first that uses  
> connbytes) then it kicks out:
> iptables v1.3.3: You must specify `--connbytes'`--connbytes- direction' 
> and `--connbytes-mode'
> Try `iptables -h' or 'iptables --help' for more information.
> 
>   After a day of googling for the correct use of -m connbytes I am  at a 
> loss, I was hoping
> someone could help me figure this out.  I have tried adding
> --connbytes-dir original --connbytes-mode bytes but to no avail.

Hmm - there was a bug in 1.3.1 which stopped it from parsing properly 
but I just looked and it's fixed in 1.3.3. You still need to specify dir 
and mode now, though.

Can you search for libipt_connbytes.so to check datestamp/ for multiple 
copies incase you are using an older version.

You do need connbytes in kernel/as module aswell of course which until 
very recently involved using POM, and when I last did it (2.6.12-rc1 
time) it (POM) failed without messing around.

Andy.

