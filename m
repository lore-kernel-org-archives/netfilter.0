From: "Marco Berizzi" <pupilla@hotmail.com>
Subject: Re: snat to multiple source ip
Date: Tue, 20 Sep 2005 17:53:34 +0200
Message-ID: <BAY103-DAV54E98832F4818390900ACB2950@phx.gbl>
References: <2F75680A268354469586578F0712182AC974D5@CXOEXC12.AMERICAS.CPQCORP.NET>
Return-path: <netfilter-bounces@lists.netfilter.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Harrison, Bruce (CXO) wrote:

> You're assuming that the man page accurately describes the behavior
> of the code (which normally is the case).  But how about doing a quick
> test as suggested by Derick just to be sure.  Could be a bug?

The second ip address sometimes *is* used. My guess is that SNAT
choose the second IP when the system open a second socket to the same
host.
My guess is that SNAT is working as described in the previous post:
1st socket opened to a.a.a.a  -->> SNAT with first_ip
2nd socket opened to b.b.b.b  -->> SNAT with first_ip
3rd socket opened to c.c.c.c  -->> SNAT with first_ip
4th socket opened to b.b.b.b  -->> SNAT with second_ip
5th socket opened to d.d.d.d  -->> SNAT with first_ip
6th socket opened to a.a.a.a  -->> SNAT with second_ip

It should work in this manner:

1st socket opened to a.a.a.a  -->> SNAT with first_ip
2nd socket opened to b.b.b.b  -->> SNAT with second_ip
3rd socket opened to c.c.c.c  -->> SNAT with first_ip
4th socket opened to b.b.b.b  -->> SNAT with second_ip
5th socket opened to d.d.d.d  -->> SNAT with first_ip
6th socket opened to a.a.a.a  -->> SNAT with second_ip

Right?

> Have a Great Day!

thanks!


