From: Ludger Zachewitz <ludger.z@gmx.de>
Subject: Re: iptables and port 25
Date: Wed, 11 May 2005 17:44:52 +0200
Message-ID: <6.2.1.2.0.20050511173852.01e7d558@pop.gmx.net>
References: <6.2.1.2.0.20050511160801.01e6e430@domino.offis.uni-oldenburg.de>
	<20050511145529.GA12831@bender.817west.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050511145529.GA12831@bender.817west.com>
References: <6.2.1.2.0.20050511160801.01e6e430@domino.offis.uni-oldenburg.de>
	<20050511145529.GA12831@bender.817west.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi Jason,

At 16:55 11.05.2005, you wrote:

>looks like the port 25 packet is getting dropped by something between
>your test machine and host X.  either the ISP of client machine or your
>ISP filters TCP port 25 traffic (not uncommon).

I have now tested it from different machines (with different ISPs).
In fact, that's the reason. The ISP of the host X has dropped the
packets over port 25.

Many thanks for help!

Ludger
   


