From: Jason Opperisano <opie@817west.com>
Subject: Re: Patch-o-matic and Time Based Rules
Date: Sat, 15 Jan 2005 08:42:22 -0500
Message-ID: <1105796541.6055.6.camel@hubcap.ljm.dom>
References: <75b657f40501142358308ebc64@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <75b657f40501142358308ebc64@mail.gmail.com>
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

On Sat, 2005-01-15 at 02:58, DurgaPrasad Adusumalli wrote:
> I am running FC3 and iptables 1.2.11. I like to add Time Based rules
> module support to my existing system. Is there any possibility of
> adding just the patch I like to without using patch-o-matic ng.

not sure what you mean by "without using patch-o-matic ng" as that is
how patches are distributed and applied.  if you're asking, "how do i
skip all those POM questions and just apply the time patch" you would:

  # cd /path/to/patch-o-matic-ng
  # export KERNEL_DIR=/usr/src/linux-<VER>
  # export IPTABLES_DIR=/path/to/iptables-1.2.11
  # ./runme --batch time

rebuild your kernel and rebuild iptables.

-j

--
"Another day, another box of stolen pens."
	--The Simpsons


