From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Ports stop responding some times :-(
Date: Sun, 4 Jul 2004 14:10:50 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407041410.50847.Antony@Soft-Solutions.co.uk>
References: <20040701221707.98643.qmail@web60801.mail.yahoo.com>
Reply-To: netfilter <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040701221707.98643.qmail@web60801.mail.yahoo.com>
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

On Thursday 01 July 2004 11:17 pm, AmirS wrote:

> Hello,
>
> After I set up the firewall (on redhat 7.2),
> everything works fine for a few hours. But after a
> while (not sure the exact amount of time), the
> computer stops responding to requests on the open
> ports (21,22,80).
>
> Any help please ? :-(

Sounds like a hardware problem to me - check the network interface - swap the 
card if you can, to test a different one.

Does another machine on the same subnet lose its arp cache entry for the 
machine when the ports stop responding?

> Chain INPUT (policy ACCEPT)
> target prot opt source   destination
> ACCEPT all  --  anywhere anywhere
> ACCEPT tcp  --  anywhere anywhere tcp dpt:ftp
> ACCEPT tcp  --  anywhere anywhere tcp dpt:ssh
> ACCEPT tcp  --  anywhere anywhere tcp dpt:http
> ACCEPT all  --  anywhere anywhere state
> RELATED,ESTABLISHED
> DROP   all  --  anywhere anywhere
>
> Chain FORWARD (policy ACCEPT)
> target prot opt source   destination
>
> Chain OUTPUT (policy ACCEPT)
> target prot opt source   destination

I *hope* that ruleset is only because you're trying to figure out what's 
wrong, and you don't normally run the system like that?

Regards,

Antony.

-- 
"640 kilobytes (of RAM) should be enough for anybody."

 - Bill Gates

                                                     Please reply to the list;
                                                           please don't CC me.


