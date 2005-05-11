From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: SSH Brute force attacks
Date: Wed, 11 May 2005 14:15:26 -0500
Message-ID: <428259CE.3080708@riverviewtech.net>
References: <427B93EE.3030905@eccotours.dyndns.org>	<427C4EA3.5090501@riverviewtech.net>	<4281FC1A.8090000@eccotours.dyndns.org>	<42824D1E.7040508@riverviewtech.net>
	<42825732.8010206@verisignlabs.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42825732.8010206@verisignlabs.com>
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
To: iptables <netfilter@lists.netfilter.org>

> I get the error Brent gets above, but I do have the recent module:

> ipt_recent v0.3.1: Stephen Frost <sfrost@snowman.net>.
> http://snowman.net/projects/ipt_recent/
> 
> and "--hitcount" is referenced in the help:
> 
> --hitcount hits             For check and update commands above.
>                                 Specifies that the match will only occur
> if source address seen hits times.
> 
> FWIW, I'm using iptables 1.2.11 in Fedora Core 3.

Hmm, you may need / want to update your iptables and apply the most recent p-o-m patch for the recent match extension.  Here is what I get as output when I do "iptables -m recent -h":

recent v1.3.1-20050422 options:
[!] --set                       Add source address to list, always matches.
[!] --rcheck                    Match if source address in list.
[!] --update                    Match if source address in list, also update last-seen time.
[!] --remove                    Match if source address in list, also removes that address from list.
    --seconds seconds           For check and update commands above.
                                Specifies that the match will only occur if source address last seen within
                                the last 'seconds' seconds.
    --hitcount hits             For check and update commands above.
                                Specifies that the match will only occur if source address seen hits times.
                                May be used in conjunction with the seconds option.
    --rttl                      For check and update commands above.
                                Specifies that the match will only occur if the source address and the TTL
                                match between this packet and the one which was set.
                                Useful if you have problems with people spoofing their source address in order
                                to DoS you via this module.
    --name name                 Name of the recent list to be used.  DEFAULT used if none given.
    --rsource                   Match/Save the source address of each packet in the recent list table (default).
    --rdest                     Match/Save the destination address of each packet in the recent list table.
ipt_recent v0.3.1: Stephen Frost <sfrost@snowman.net>.  http://snowman.net/projects/ipt_recent/




Grant. . . .

