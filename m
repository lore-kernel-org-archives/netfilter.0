From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: adding counters
Date: Mon, 16 Sep 2002 14:53:17 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209161353.g8GDrNv15337@vulcan.rissington.net>
References: <200209161449.58221.roy@karlsbakk.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200209161449.58221.roy@karlsbakk.net>
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
To: Netfilter mailinglist <netfilter@lists.netfilter.org>

On Monday 16 September 2002 1:49 pm, Roy Sigurd Karlsbakk wrote:

> hi
>
> I've created a new table with the following lines, and inserted a -j
> counters on top of INPUT. Wouldn't this allow me to count packets per port?
> All I get is the -j counters line increasing it's byte count, but none of
> the below does...

Is this a server, providing pop3s, irc, https, imap, pop3, http and smtp 
services to other clients, or are you actually sending packets *through* this 
machine and the link should be from the FORWARD chain ?

If this really is a server, and the INPUT chain is correct, please post your 
ruleset (ie the commands which create the rules) instead of the output from 
iptables -L.

Antony.

-- 

You can spend the whole of your life trying to be popular,
but at the end of the day the size of the crowd at your funeral
will be largely dictated by the weather.

 - Frank Skinner

