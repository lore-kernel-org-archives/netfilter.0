From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Attaching nfct timeout policy
Date: Thu, 15 Dec 2016 21:53:15 +0100
Message-ID: <20161215205315.GA3768@salvia>
References: <a3a12638-9927-e514-f3f3-9ef28be31060@trustiosity.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <a3a12638-9927-e514-f3f3-9ef28be31060@trustiosity.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: zrm <zrm@trustiosity.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Thu, Dec 15, 2016 at 01:46:46PM -0500, zrm wrote:
> The nfct command allows creating a custom timeout policy. The man page
> describes how to attach the timeout policy using iptables.
> 
> How do you attach it when the flow is created using the conntrack API with
> NFCT_Q_CREATE, or attach to a flow that already exists?

You have to use libnetfilter_cttimeout.
