From: Philip Craig <philipc@snapgear.com>
Subject: Re: ipt_tcpmss_target: bad length
Date: Mon, 18 Aug 2003 13:03:21 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F4041F9.1030004@snapgear.com>
References: <269A1D930039744AB5A54123F2D74BCD4A49@dc0.nl.corp.keenondots.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <269A1D930039744AB5A54123F2D74BCD4A49@dc0.nl.corp.keenondots.net>
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
To: Laurens van Alphen <subscriptions@keenondots.com>
Cc: netfilter@lists.netfilter.org

Laurens van Alphen wrote:
> Today, I received this kernel log entry via e-mail:
> 
> Aug 17 14:19:17 filter0 kernel: ipt_tcpmss_target: bad length (472
> bytes)
> 
> Using Google, I could not find a single useful meaning of this message.

Here's the comment from the source code which explains it:

/* Since it passed flags test in tcp match, we know it is is
    not a fragment, and has data >= tcp header length.  SYN
    packets should not contain data: if they did, then we risk
    running over MTU, sending Frag Needed and breaking things
    badly. --RR */

In other words, SYN packets cannot have data, so the total length
of the packet must be the same as the tcp header length, otherwise
it is a bad length.

-- 
Philip Craig - philipc@snapgear.com - http://www.SnapGear.com
SnapGear - Custom Embedded Solutions and Security Appliances


