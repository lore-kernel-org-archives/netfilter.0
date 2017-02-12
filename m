From: Michael Weiser <michael@weiser.dinsnail.net>
Subject: Re: Restrictive FTP egress using conntrack helper
Date: Sun, 12 Feb 2017 16:42:41 +0100
Message-ID: <20170212154241.GA4258@weiser.dinsnail.net>
References: <20170211171431.GD31183@weiser.dinsnail.net>
 <4d8f60b9-2eb1-2baa-035d-3ac223bfbdf5@pobox.com>
 <10a85123-67f2-c323-435c-3d006ba692aa@plouf.fr.eu.org>
 <20170212123052.GD2935@weiser.dinsnail.net>
 <20170212141940.GA15863@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170212141940.GA15863@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Pascal Hambourg <pascal@plouf.fr.eu.org>, Robert White <rwhite@pobox.com>, netfilter@vger.kernel.org

Hi Pablo,

On Sun, Feb 12, 2017 at 03:19:40PM +0100, Pablo Neira Ayuso wrote:

> > What's bugging me is that I still don't see an expectation being
> > created with conntrack -L expect.
> It's very unlikely to see FTP expectation via conntrack -L since they
> are created and destroyed very quickly if you are testing with a FTP
> client.

I thought so as well and tried to catch it using a while [ 1 ] loop ...

> So `conntrack -E expect' is likely a better option for the debugging
> purposes you need.

... but conntrack -E expect shows it plain as day of course. Thank you!
-- 
Michael
