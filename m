From: Gavin Hamill <gdh@acentral.co.uk>
Subject: Re: Linux firewall hardware specs
Date: Fri, 5 Sep 2003 13:55:15 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200309051355.15499.gdh@acentral.co.uk>
References: <20030905121050.88228.qmail@web11605.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030905121050.88228.qmail@web11605.mail.yahoo.com>
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

On Friday 05 September 2003 13:10, Grant Moby wrote:
> There are about 100 users surfing the web, sending and
> receiving email over a 256k line, a couple of subnets,
> a DMZ, etc.

Okies, we're running a fully stateful netfilter firewall on an old P233 with a 
2Mbps leased line, 10 very busy servers, another 50 desktop machines, and the 
loadaverage is typically about 0.01.

With 'fprobe' running for more accurate 'NetFlow' traffic reporting, the 
loadavg rises to 0.10, typically.

Even adding snort to the equation, the load settles at only 0.60 :)

I don't know how much extra load would be added by using cheap network cards, 
but we have a pair of Intel 10/100s in the firewall, and the box has been 
running flawlessly for months...

Cheers,
Gavin.

