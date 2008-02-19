From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrack "invalid parameters" error
Date: Tue, 19 Feb 2008 14:22:03 +0100
Message-ID: <47BAD7FB.8040709@netfilter.org>
References: <003901c872f9$915921e0$0201a8c0@stealth>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <003901c872f9$915921e0$0201a8c0@stealth>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Eugene Polyanichko <messiah@nline.net.ua>
Cc: netfilter@vger.kernel.org

Eugene Polyanichko wrote:
> Hello,
> 
> i've faced with a problem, which I don't know how to solve, so I will
> appreciate any help. I've decided to upgrade my old red hat router from 2.4
> kernel to latest 2.6.24.2 to make use of conntrack-tools. I've compiled
> everything: kernel with netlink support, libnfnetlink,
> libnetfilter_conntrack and conntrack-tools (all latest versions) and when I
> execute 'conntrack -F' I get this:
> 
> # conntrack -F
> Operation failed: invalid parameters
> 
> libnetfilter_conntrack get util (utils/conntrack_get) tells me this:
> 
> # ./conntrack_get
> TEST: get conntrack (-1)(Invalid argument)
> 
> Any suggestions? Where the problem could be? Is it on kernel level or maybe
> something wrong in libnfnetlink?

Did you insmod nf_conntrack_netlink? nfnetlink can return EINVAL for
those cases.

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers
