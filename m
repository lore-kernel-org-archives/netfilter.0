From: Payal Rathod <payal-iptables@scriptkitchen.com>
Subject: Re: DNAT not working
Date: Wed, 18 Apr 2007 23:31:23 -0400
Message-ID: <20070419033123.GB22763@tranquility.scriptkitchen.com>
References: <20070418162604.GA10834@tranquility.scriptkitchen.com>
	<462656A8.3090003@rtij.nl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <462656A8.3090003@rtij.nl>
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
To: Martijn Lievaart <m@rtij.nl>
Cc: netfilter@lists.netfilter.org

On Wed, Apr 18, 2007 at 07:34:32PM +0200, Martijn Lievaart wrote:
> Payal Rathod wrote:
> >Hi,
> >My gateway server is Ubuntu 6.06.1 LTS, iptables v1.3.3.  By ifconfig I 
> >have added one more ip say 1.2.3.4 (eth0:1). iptables-save gives me the 
> >output at,
> >http://pastebin.ca/446625
> >
> Try -d 1.2.3.4 instead of -s.

But now it is timing out instead of connecting.
The new ruleset is at,

http://pastebin.ca/447539

Can someone tell what might be wrong?

With warm regards,
-Payal

