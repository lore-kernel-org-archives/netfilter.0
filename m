From: Nick Drage <nickd@metastasis.org.uk>
Subject: Re: command owner match support
Date: Fri, 6 Jan 2006 13:31:03 +0000
Message-ID: <20060106133103.GF7546@metastasis.org.uk>
References: <43BCC326.4000302@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <43BCC326.4000302@gmail.com>
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

On Thu, Jan 05, 2006 at 12:56:38 -0600, Ryan L wrote:

> I'm trying to block specific applications through iptables. However I
> keep getting the following error message: Jan  4 22:44:05 thor
> ipt_owner: pid, sid and command matching not supported anymore Is
> there any way to add this back into the newer kernels or to do this
> without it?

I'm not seeing that message when I try and use --cmd-owner or
--pid-owner, I just get "iptables: Invalid argument".  However the
commands are listed in the output of "iptables --owner --help" for
IPTables 1.3.3.

I can only presume that that functionality has silently "gone away".  I
can't see anything on mailing lists or in the netfilter documentation,
are there any references for when this was removed, or why, or what it
should be replaced with, if anything?

-- 
When the going gets tough, the tough call for close air support.

