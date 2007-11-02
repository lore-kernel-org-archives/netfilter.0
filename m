From: Martijn Lievaart <m@rtij.nl>
Subject: Re: Use mangle to DROP/ACCEPT
Date: Sat, 03 Nov 2007 00:13:23 +0100
Message-ID: <472BAF13.4030702@rtij.nl>
References: <df1bdeb10711021154hf8db4baya3fa2861ef027e84@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <df1bdeb10711021154hf8db4baya3fa2861ef027e84@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Srinivas Murthy <codevana@gmail.com>
Cc: netfilter@vger.kernel.org

Srinivas Murthy wrote:
> Hi,
>  Is it ok to use the "mangle" table to insert rules that can
> DROP/ACCEPT pkts in the PREROUTE chain?
>
>  I cannot use "filter" since that is registered in the INPUT chain and
> I want these rules in the PREROUTE chain.
>   

There was a recent thread about this on the netfilter-devel list. Yes 
it's OK to drop in mangle, but not all matches work in mangle.

HTH,
M4

