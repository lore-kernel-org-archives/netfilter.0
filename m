From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Ideal iptables, kernel configuration for stability.
Date: Fri, 13 Sep 2002 17:29:58 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209131630.g8DGU7v11843@vulcan.rissington.net>
References: <002101c25b3f$54521d10$6b01a8c0@s3ac>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <002101c25b3f$54521d10$6b01a8c0@s3ac>
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

On Friday 13 September 2002 5:05 pm, Rowan Reid wrote:

> What is the ideal kernel version, and iptables version for the most
> stable config.

2.4.19
1.2.7a

Both latest stable.

> The config should support FTP, Windows Media player, MSN
> and Yahoo messenger, and hopefully pptp.

You'll need some patch-o-matic extensions to support all those.

> Key work being stable. I would
> also like to do some content filtering i.e. code red stuff.

iptables is not a content filter.

Regards,

Antony.

-- 

You can spend the whole of your life trying to be popular,
but at the end of the day the size of the crowd at your funeral
will be largely dictated by the weather.

 - Frank Skinner

