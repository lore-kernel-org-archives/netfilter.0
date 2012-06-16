From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrackd config syntax inflexibility
Date: Sat, 16 Jun 2012 21:28:21 +0200
Message-ID: <20120616192821.GA20265@1984>
References: <20120606210358.089a4bc8@mistral.stie>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120606210358.089a4bc8@mistral.stie>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jonetsu <jonetsu@teksavvy.com>
Cc: netfilter@vger.kernel.org

On Wed, Jun 06, 2012 at 09:03:58PM -0400, jonetsu wrote:
> Hello,
> 
>   I'm using 0.9.14 to try out the stateful firewall feature, along
>   with keepalived.  Trying out first the most simple 'notrack' option.
>   Copied the provided config file, modified interfaces and IP
>   addresses.  Problem is, conntrackd gives a syntax error when an
>   interface in contrackd.conf is either:
> 
>   Interface fe-3-1
> 
>   or:
> 
>   Interface te1-5-1c02ppp
> 
>   Is there any plan to allow more flexible interface names ?

Are you defining those mappings in /etc/network/interfaces or udev ?
