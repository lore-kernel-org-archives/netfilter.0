From: Richard Feng <rfeng@wurldtech.com>
Subject: Re: conntrack-tools 0.9.14 can not block the connection
Date: Fri, 7 May 2010 12:04:04 -0700
Message-ID: <201005071204.04815.rfeng@wurldtech.com>
References: <201005061651.40203.rfeng@wurldtech.com> <201005070922.00629.rfeng@wurldtech.com> <4BE4612F.4090604@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4BE4612F.4090604@plouf.fr.eu.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>


On May 7, 2010 11:51:27 am Pascal Hambourg wrote:
> 
> Do you mean this : "this can be used to block traffic" ?
> It can be used to block traffic, but does not block traffic by itself.
> Subsequent packets of a deleted TCP connection will just be in the
> INVALID state, it is up to the iptables ruleset to drop such packets if
> this is what you want.
> > What should I do if I want to break current connection? Using 'cutter'?
> 
> What do you want to achieve exactly ? Drop/reject subsequent packets ?
> Then see above, you need iptables. Or actively close the connection ?
> Then you need a tool such as cutter.
> 
Thank you very much - I think that is the answer I am looking for.
