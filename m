From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ipt_string, udp, dns problem...
Date: Sun, 22 Sep 2002 11:23:54 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020922102356.DEQK13996.mta05-svc.ntlworld.com@there>
References: <1292.24.200.104.128.1032687264.squirrel@www.funio.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1292.24.200.104.128.1032687264.squirrel@www.funio.com>
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

On Sunday 22 September 2002 10:34 am, Mark Steele wrote:

> Hi there,
>
> I have a quick question regarding the iptables string module.
>
> I'm currently under siege from a DOS attack which is aimed
> at my name server. I believe the culprit is spoofing
> his IP address, and sending DNS requests to various
> recursive name servers for a domain which used to be
> hosted in my servers. To block this, I am trying to use
> a string match to drop the packets like so:
>
> /usr/sbin/iptables -I INPUT -j DROP -p udp -s 0.0.0.0/0 -m \
> string --string "militaire.org" --dport 53
>
> I have noticed however, that this hasn't had much of a significant
> effect, as my name server is still receiving the requests.
>
> And the requests are getting through to my
> name server. Any ideas on what I might
> be doing wrong?

Yes.   You are assuming that a UDP port 53 packet corresponding to a lookup 
of militaire.org actually contains the literal string "militaire.org".

In fact it doesn't.   Specifically, the dot separating the domain name from 
the org is not an Ascii 46 (0x2E).

Try changing your string match to look for just "militaire" and see if that 
works.

Antony.

-- 

Software development can be quick, high-quality, or low-cost.

The customer gets to pick any two out of three.


