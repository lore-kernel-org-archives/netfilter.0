From: Marcin Sura <slacklist@op.pl>
Subject: Re: traffic graphing?
Date: Sat, 21 Aug 2004 00:49:54 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <823120906.20040821004954@op.pl>
References: <41267935.2040008@leaplab.com>
Reply-To: Marcin Sura <slacklist@op.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <41267935.2040008@leaplab.com>
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

Witam

Saturday, August 21, 2004, 12:20:37 AM, you wrote:

> What would you guys suggest for a good traffic monitoring/graphing 
> sollution for a iptables (shorewall) firewall?

I'm using Lstat - http://lstat.sourceforge.net/
This is a nice interface for rrdtool, but only in Polish :(
Besides standard charts it allow you to capture stats form your
iptables rules.

And, of course you can simple try rrdtool, but playing with it takes
some time :)

-- 
Pozdrawiam
 Marcin                            mailto:slacklist@op.pl


