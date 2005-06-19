From: Jason Opperisano <opie@817west.com>
Subject: Re: What's the best way to block these IP's?
Date: Sun, 19 Jun 2005 10:07:19 -0400
Message-ID: <20050619140719.GA4788@bender.817west.com>
References: <003001c57425$4bb210a0$45d4a8c0@martin>
	<200506181246.09879.rob0@gmx.co.uk>
	<004701c5742f$e5d47c40$45d4a8c0@martin>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <004701c5742f$e5d47c40$45d4a8c0@martin>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Sat, Jun 18, 2005 at 01:02:31PM -0500, Netfilter wrote:
> Thanks fo the reply... I noticed the error of the "/32" CIDR right after I 
> sent it.
> Brain fart on my part.
> I just wanted to know if
> 218.0.0.0 without the" /*"  would work. (blocking the whole 218.0.0.0 
> block)

the default prefix length when none is specified is /32, so no...using
218.0.0.0 in a rule is not the same as 218.0.0.0/8; it is the same as
218.0.0.0/32.

<need coffee>
 would it really have been such a daunting task to just add a rule using
 both notations and compared the results?
</need coffee>

-j

--
"Peter: Now, I know you're a feminist, and I think that's adorable, but
 this is grown-up time and I'm the man."
        --Family Guy

