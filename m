From: Kenneth Porter <shiva@sewingwitch.com>
Subject: Re: Need help with basic understanding of IPtables
Date: Mon, 25 Oct 2004 12:50:50 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <33D73F71797CC09A67671396@[10.169.6.246]>
References: <s17d10cf.018@hpsk12.net>
	<20041025193800.GA24645@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041025193800.GA24645@bender.817west.com>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

--On Monday, October 25, 2004 3:38 PM -0400 Jason Opperisano 
<opie@817west.com> wrote:

> a local IP address on this machine

Also note that this includes virtual interfaces, tunnel interfaces (the 
tun/tap driver, typically used in VPN's), and the loopback interface. It's 
not just NIC's.



