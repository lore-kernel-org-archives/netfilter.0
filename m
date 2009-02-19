From: Simon Gray <iptables@tech.nologi.es>
Subject: Re: iptables - how to create a rule that expires automatically
Date: Thu, 19 Feb 2009 17:32:09 +0000
Message-ID: <499D9799.2070704@tech.nologi.es>
References: <499D9292.902@colsmemory.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <499D9292.902@colsmemory.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Colin Davis <col@colsmemory.co.uk>
Cc: netfilter@vger.kernel.org

Colin Davis wrote:
>
> Hi,
>
> Not sure if this is possible. I wish to create a rule that once 
> created will
> automatically expire (and be removed) after say 10 minutes.
Use cron

SG
