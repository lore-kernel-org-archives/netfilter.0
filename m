From: Jason Opperisano <opie@817west.com>
Subject: Re: NAT issues on a VPN tunnel
Date: Fri, 5 Nov 2004 11:57:39 -0500
Message-ID: <20041105165739.GA1553@bender.817west.com>
References: <1099651214.4891.105.camel@localhost>
	<CARBON5MNNmPrdKz1EQ00002b82@carbon.netsvcs.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <CARBON5MNNmPrdKz1EQ00002b82@carbon.netsvcs.com>
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

On Fri, Nov 05, 2004 at 08:44:05AM -0800, Chris Lyon wrote:
> I am still trying to get a match rule going but it is saying something about
> libipt_match.so not being loaded. I did try to load it but it can't so I am
> digging around the kernel to find out what the hell is missing.

libipt_*.so are library file for the iptables command, not the kernel.

i am not aware of any file called "libipt_match.so" so i'm not sure what
that error means...but you need to be looking at the iptables side of
things, not the kernel.

are your kernel and userspace out of sync (i.e. you patched your kernel
from POM, and rebuilt the kernel but not the iptables package)?

-j

--
"I'll be deep in the cold, cold ground before I recognize Missoura!"
        --The Simpsons

