From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: [PATCH] nf_conntrack_sip: check for trailing spaces
Date: Tue, 18 Oct 2016 23:47:08 +0200
Message-ID: <20161018214708.GA4306@salvia>
References: <20161018091318.GA20644@gir>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161018091318.GA20644@gir>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ulrich Weber <ulrich.weber@riverbed.com>
Cc: netfilter@vger.kernel.org, kaber@trash.net

Hi Ulrich,

On Tue, Oct 18, 2016 at 11:13:18AM +0200, Ulrich Weber wrote:
> on SIP requests, so a fragmented TCP SIP packet starting with
>  INVITE,NOTIFY,OPTIONS,REFER,REGISTER,UPDATE,SUBSCRIBE
>  Content-Length: 0
> 
> will not bet interpreted as an INVITE request.
> 
> Confirm with RFC 3261
>  Request-Line   =  Method SP Request-URI SP SIP-Version CRLF

Please, submit this to netfilter-devel@vger.kernel.org.

Thanks.
