From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: quick questions ---
Date: Thu, 27 Nov 2003 13:12:01 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311271312.01582.Antony@Soft-Solutions.co.uk>
References: <FDB52A0429DFD31196FB0008C7D972D50EA57B26@OST_EXCH_USR5>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FDB52A0429DFD31196FB0008C7D972D50EA57B26@OST_EXCH_USR5>
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

On Thursday 27 November 2003 1:02 pm, Knight, Steve wrote:

> Hi chaps
>
> Had a bit of a google, and of course consulted Ziegler, but I'm still not
> 100% on either of these, so ---
>
> 1) can iptables use eth0:0 as a valid interface distinct from eth0 ?

No.   They're both the same physical device, and netfilter only knows it as 
eth0.

> So I can use eth0 as LAN internal i/f and eth0:0 as DMZ internal i/f.

You can if you really want to but nobody here will respect you for it :)

I almost completely blows away the concept of a DMZ - because somebody on your 
internal LAN can get unrestricted access to the DMZ machines simply by 
changing their IP address.

> and ...
>
> 2) Back when I did my checkpoint certs we covered "static NAT" - simple
> one-to-one address translation, rather than "hide NAT" - aka iptables SNAT
> / MASQUERADE....
>
> ...the question I have is -
>
> is the example given in Ziegler starting on p280 and table 7.1 "Host
> Forwarding to Servers in a Privately Addressed DMZ" an example of "static
> NAT"?

Please can you rephrase the question so that we can answer it without needing 
a copy of the book?

Antony.

-- 
All matter in the Universe can be placed into one of two categories:

1. Things which need to be fixed.
2. Things which need to be fixed once you've had a few minutes to play with 
them.

                                                     Please reply to the list;
                                                           please don't CC me.


