From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: blocking ipaddresses
Date: Sun, 18 Dec 2005 12:06:01 -0600
Message-ID: <200512181206.01585.rob0@gmx.co.uk>
References: <1134913819.99ab56762176f@webmail.harrisonburg.k12.va.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1134913819.99ab56762176f@webmail.harrisonburg.k12.va.us>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Sunday 2005-December-18 07:50, Dwayne Hottinger wrote:
> ###blocking proxify.com##############################
> $IPC -t nat -A PREROUTING -p tcp -d 67.15.77.223 -j DROP

As Askar pointed out, this is wrong. Filtering is done in -t filter.

> My question is, is there a better way to block the proxify.com
> addresses I would like to block them completely.  I also have quite a
> few spyware sites listed like the proxify.  Using iptables V1.2.9

Netfilter offers no silver bullet against ratware. In fact there IS no 
such thing.

Best thing: ditch Windows. Seriously. It cannot be made secure, after 
all the insecure design decisions. But I know, that would require 
expertise beyond what you have on staff, and the school board would 
never budget for that, even if it would save money in the long run.

Second best: DNS poisoning. Force your local clients to use your DNS, 
and claim authority over the bad domains. Problem: the bad guys are 
registering domains every day, by the score. You cannot possibly know 
all of them. Another problem: they might only register them for a year, 
and later some innocent sucker might register one of those names.

Another second best: proxy services which can detect and filter the 
malware. Problem: some people might need real Internet access for some 
things.

On Sunday 2005-December-18 11:21, Dwayne Hottinger wrote:
> Is it better to use DROP LDROP or TREJECT when blocking ipaddresses
> for example I have the following in my firewall script:

LDROP and TREJECT are not found in my copy of the iptables man page. 
Perhaps these are user chains implemented by your script. Read it and 
see what they do, then look that up in "man iptables".

Oh the question of DROP vs. REJECT, you would only REJECT for TCP, and 
it comes down to a local policy decision on what you want. REJECT is 
"best" for RFC compliance and is faster for would-be connecting clients 
(they get the icmp-port-unreachable message quicker than a timeout.) 
But in some cases DROP might be preferred, i.e., for stealth.

On a publically-available Web, mail, ftp, DNS, or other server, I tend 
to use REJECT. For home systems, I tend toward DROP.

On the question of logging firewall rejections (I am guessing that 
"LDROP" does -j LOG followed by -j DROP), absolutely not. Too much 
information. It isn't generally useful, and could lead you to DoS 
yourself with too much syslog traffic. I only use -j LOG in specific, 
generally temporary, situations.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

