From: Michael Weiser <michael@weiser.dinsnail.net>
Subject: Re: Restrictive FTP egress using conntrack helper
Date: Sun, 12 Feb 2017 13:30:52 +0100
Message-ID: <20170212123052.GD2935@weiser.dinsnail.net>
References: <20170211171431.GD31183@weiser.dinsnail.net>
 <4d8f60b9-2eb1-2baa-035d-3ac223bfbdf5@pobox.com>
 <10a85123-67f2-c323-435c-3d006ba692aa@plouf.fr.eu.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <10a85123-67f2-c323-435c-3d006ba692aa@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pascal Hambourg <pascal@plouf.fr.eu.org>
Cc: Robert White <rwhite@pobox.com>, netfilter@vger.kernel.org

Hi Pascal,

On Sun, Feb 12, 2017 at 10:14:08AM +0100, Pascal Hambourg wrote:

> What has changed in recent kernels is that by default the helper is no more
> automatically associated to the "master" connection. You must do so
> explicitly with the 'CT' target, or change the default setting with some
> sysctl or module parameter I forgot about.

> I fail to retrieve the information page I had read about this change, but
> this one contains useful information :
> <https://home.regit.org/netfilter-en/secure-use-of-helpers/>

That page cleared it up: The default for
/proc/sys/net/netfilter/nf_conntrack_helper seems to be 0 nowadays,
effectively disabling all conntrack helpers by default. Because of that
I have to explicitly assign the helper to certain kinds of packets I
wish it to inspect. In my case (egress) this needs to be a rule such as:

iptables -A OUTPUT -t raw -p tcp --dport 21 -j CT --helper ftp

With that change my firewall now behaves as expected: The data
connection is considered as RELATED and permitted by the catch-all
--state ESTABLISHED,RELATED -j ACCEPT rule.

As the article states, I shall think about further narrowing that
blanket permission for helper-assisted connections.

What's bugging me is that I still don't see an expectation being
created with conntrack -L expect.
-- 
Thanks!
Michael
