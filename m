From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: Additional Security
Date: Sat, 20 Sep 2003 08:09:27 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F6C4377.3070605@chrisbrenton.org>
References: <3F6B3989.6010708@Loudoun-Fairfax.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Cc: netfilter@lists.netfilter.org

Jeffrey Laramie wrote:
> 
> Do you think it's worthwhile to install and configure tripwire on an 
> iptables firewall box?

I myself prefer to use Aide, but some kind of file integrity checking on 
your firewall is an excellent idea (I also regularly audit running 
processes, listening ports, etc.). If someone whacks the box, you 
certainly want to know about it ASAP. The more checks you do the better.

HTH,
C


