From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: how to automate ip_forward
Date: Thu, 8 Jul 2004 13:15:38 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407081315.38774.Antony@Soft-Solutions.co.uk>
References: <16ac01c464e3$1af42c20$49caa8c0@caris.priv>
Reply-To: "netfilter" <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <16ac01c464e3$1af42c20$49caa8c0@caris.priv>
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
To: netfilter <netfilter@lists.netfilter.org>

On Thursday 08 July 2004 1:00 pm, Peter Marshall wrote:

> Hey guys, I know this sounds stupid, but I can not seem to get the value of
> /proc/sys/net/ipv4/ip_forward to be 1 after boot.  I tried putting the echo
> 1 > /pro...../ip_forward in my iptables script .... (BTW, I have a bash
> script with my rules in it and a startup script in rc2.d that calls it)

If you have done that and it's still ending up as 0 afterwards, then something 
else on your system must be writing 0 to it without you knowing.

Try doing a grep on everything in /etc downwards for ip_forward to see if ytou 
can find some other script which is messing you about:

grep -ri ip_forward /etc

Regards,

Antony.

-- 
This email was created using 100% recycled electrons.

                                                     Please reply to the list;
                                                           please don't CC me.


