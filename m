From: Jason Opperisano <opie@817west.com>
Subject: Re: Does anybody work on supporting SPD matching Netfilter MARKS?
Date: Wed, 19 Jan 2005 09:41:24 -0500
Message-ID: <1106145684.4934.32.camel@hubcap.ljm.dom>
References: <41EE01DF.5040707@protactive.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41EE01DF.5040707@protactive.nl>
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

On Wed, 2005-01-19 at 01:44, Ludo Stellingwerff wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Hi All,
> 
> I was wondering if someone has been working on and/or has a patch
> which implement's the use of Netfilter Marks for ipsec spd matching
> under the linux kernel 2.6. This would be similar to the NetBSD
> "tagged" option of 'setkey':
> 
> spdadd tagged "ssh" -P out esp/transport//require
> 
> But then something like:
> 
> ~     spdadd tagged 1 -P out esp/transport//require
> or  spdadd mark 1 -P out esp/transport//require

this may not be "good enough" for what you need--but why not just MARK
the ESP packets in mangle PREROUTING, for later filtering:

  iptables -t mangle -A PREROUTING -p 50 -s $VPN_PEER_1 \
    -j MARK --set-mark 1

  iptables -A [INPUT|FORWARD] -m mark --mark 1 [...] -j ACCEPT

also--have a look at the "policy" match in POM, as i *think* it will do
what you want.

and finally--please don't cross-post--it's poor form.

-j

--
"Let us all bask in television's warm glowing warming glow."
	--The Simpsons


