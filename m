From: Julian Gomez <kluivert@tm.net.my>
Subject: Re: iptables and ipsec
Date: Wed, 22 Oct 2003 21:18:17 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031022131817.GC2578@propaganda.localdomain>
References: <Law10-F118TFur2iz2M00009655@hotmail.com>
Reply-To: kluivert@tm.net.my
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Law10-F118TFur2iz2M00009655@hotmail.com>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Wed, Oct 22, 2003 at 11:12:56AM +0000, dimitri borjac spoke thusly:

>do you know where i can find any interesting documentation about the 
>interoperability/compatibility of ipsec with iptables ...?

Check the FreeSWAN docs out. Last time I checked (which was in the v1.9x
series); there were complementary information in regards to it.

It also depends on what IPsec scenario are you envisioning ?

>what's more regarding the eventual UDP encapsulation and the pass-through 
>technology ?

I think only Checkpoint (?) and Cisco do UDP encapsulation for NAT
traversal. Have no experience with pass-through.

In general, IPsec + Netfilter will play nice together. If you are
experiencing otherwise however, give us more information.

