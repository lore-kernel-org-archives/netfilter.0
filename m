From: Kerin Millar <kerframil@gmail.com>
Subject: Re: ip_conntrack_icmp_timeout now taking effect
Date: Sun, 04 Mar 2012 07:46:46 +0000
Message-ID: <jiv6l7$fo0$1@dough.gmane.org>
References: <20120301083908.7646c423@mistral.stie>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20120301083908.7646c423@mistral.stie>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 01/03/2012 13:39, jonetsu wrote:
>    What is there to do to be able to stop pings as soon as the firewall
> is set up while keeping the now-observed icmp conntrack timeout ?  Is
> it possible to selectively flush only the ICMP connection tracking
> table ?

Regarding the second question, you might be able to do that if you 
assign a distinct conntrack zone for ICMP traffic (via the CT target). 
You should then be able to run conntrack -D -w <zone-id> but I haven't 
personally tried it. Not particularly elegant but it doesn't appear to 
be possible to use -D with -p icmp alone.

Cheers,

--Kerin

