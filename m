From: Jason Opperisano <opie@817west.com>
Subject: Re: Need help with basic understanding of IPtables
Date: Mon, 25 Oct 2004 15:54:41 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041025195441.GA24801@bender.817west.com>
References: <s17d10cf.018@hpsk12.net>
	<20041025193800.GA24645@bender.817west.com>
	<33D73F71797CC09A67671396@[10.169.6.246]>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <33D73F71797CC09A67671396@[10.169.6.246]>
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

On Mon, Oct 25, 2004 at 12:50:50PM -0700, Kenneth Porter wrote:
> --On Monday, October 25, 2004 3:38 PM -0400 Jason Opperisano 
> <opie@817west.com> wrote:
> 
> >a local IP address on this machine
> 
> Also note that this includes virtual interfaces, tunnel interfaces (the 
> tun/tap driver, typically used in VPN's), and the loopback interface. It's 
> not just NIC's.

which is why i said "a local IP address on this machine" and not "a
physical interface on this machine."

-j

-- 
Jason Opperisano <opie@817west.com>

