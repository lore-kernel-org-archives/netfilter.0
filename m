From: Jason Opperisano <opie@817west.com>
Subject: Re: setting up network sharing
Date: Fri, 15 Oct 2004 20:03:24 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041016000324.GA9058@bender.817west.com>
References: <29c1c2ca23d24.416ffa4a@usc.edu>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <29c1c2ca23d24.416ffa4a@usc.edu>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Fri, Oct 15, 2004 at 04:26:50PM -0700, vineet bhargava wrote:
> Hi all,
> 
> I am having trouble setting up internet conenction sharing
> on an embedded device. I am running linux kernel v2.4.18
> with iptables and netfilter support. 
> 
> When I try to run this command -
> iptables --table nat --append POSTROUTING --out-interface
> wlan0 -j MASQUERADE
> 
> I am getting the following error -
> iptables v1.2.2: Couldn't load target `MASQUERADE':File not
> found

first off--that is an *_ANCIENT_* version of iptables...1.2.8/1.2.9 is
the oldest version i still see in use regularly, as SuSE and RH are
keeping them around...however--the current version is 1.2.11...

anyways--it sounds like you compiled a custom kernel w/o MASQUERADE
support.  does your kernel config have the following set:

  CONFIG_IP_NF_TARGET_MASQUERADE=m

the 'm' would be for a modular kernel, a non-modular kernel would have
it set to 'y'

if you do have that set in your kernel, and your kernel is modular,
check the output of:

  lsmod | grep ipt_MASQUERADE

and if you don't see any output, try loading it with:

  modprobe ipt_MASQUERADE

the module in question should be located at:

/lib/modules/`uname -r`/kernel/net/ipv4/netfilter/ipt_MASQUERADE.o

HTH...

-j

-- 
Jason Opperisano <opie@817west.com>

