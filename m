From: Lindsay Haisley <fmouse-netfilter@fmp.com>
Subject: Re: iptables: Unknown error 4294967295
Date: Mon, 25 Sep 2006 19:55:04 -0500
Message-ID: <20060926005504.GD10112@fmp.com>
References: <20060926000301.GC10112@fmp.com>
	<427c54c0609251737w484a6fh7485a4cd77d27c7@mail.gmail.com>
Reply-To: Lindsay Haisley <fmouse-m14acd@fmp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <427c54c0609251737w484a6fh7485a4cd77d27c7@mail.gmail.com>
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

Thus spake Daniel De Graaf on Mon, Sep 25, 2006 at 07:37:13PM CDT
> The (unsigned)(-1) is a known bug (#460 in bugzilla), fixed in
> subversion versions of iptables.
> However, it is only an invalid reporting of the error; the fixed
> version would output "iptables: Invalid Argument".
> 
> The error is because SNAT must be in POSTROUTING, not PREROUTING.

Thanks.  I had just discovered this.  I'm trying to wrangle a VPN into shape 
and feeling my way.  Sorry for the noise!

-- 
Lindsay Haisley       | "Fighting against human |     PGP public key
FMP Computer Services |    creativity is like   |      available at
512-259-1190          |    trying to eradicate  | <http://pubkeys.fmp.com>
http://www.fmp.com    |        dandelions"      |
                      |      (Pamela Jones)     |

