From: Herman <Herman@AerospaceSoftware.com>
Subject: Re: Invalid friggen argument
Date: Tue, 14 Oct 2003 07:14:47 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200310140714.47291.Herman@AerospaceSoftware.com>
References: <200310120141.15894.Herman@AerospaceSoftware.com> <1066111459.2383.67.camel@alpha.newkirk.us>
Reply-To: Herman@AerospaceSoftware.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1066111459.2383.67.camel@alpha.newkirk.us>
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

On Tuesday 14 October 2003 12:04 am, Joel Newkirk wrote:
   Have you checked lsmod, to make sure you have iptable_nat loaded?  If
   not, try "modprobe iptable_nat" then try your rule again.

The trouble was not iptable_nat, but rather iptable_mangle.  It seems that nat 
doesn't work if iptable_mangle is not loaded - who woulda thunkit?

I was mislead by a Rehat script, which stated that it isn't needed for nat, 
but apparently it is indeed.

Cheers,
-- 
Herman

