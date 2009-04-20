From: Brian Austin - Standard Universal <brian@standarduniversal.com.au>
Subject: Re: still can't route using fwmark
Date: Mon, 20 Apr 2009 22:25:48 +1000
Message-ID: <49EC69CC.7090305@standarduniversal.com.au>
References: <op.uskfabufx1lyi3@localhost>	 <20090418082314.GA12566@internet24.de> <op.usld3aqfx1lyi3@localhost>	 <20090418184809.GA15649@internet24.de> <op.uslkl80px1lyi3@localhost>	 <20090418205802.GA16790@internet24.de> <op.uslqwresx1lyi3@localhost>	 <20090419090016.GA19987@internet24.de>  <op.usn740lix1lyi3@localhost> <1240225752.27336.25.camel@enterprise.ims-firmen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1240225752.27336.25.camel@enterprise.ims-firmen.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Thomas Jacob <jacob@internet24.de>
Cc: Lloyd Standish <lloyd@crnatural.net>, netfilter@vger.kernel.org



Thomas Jacob wrote:
>
> So you if you want to load balance local packets correctly as well,
> you need to put some rules into OUTPUT. Possibly that's really your
> basic problem here, but I don't have time to think about that at the
> moment.
>   
its spooky, that was *exactly* my problem when I visited load balance 
via conntracking.

you need to consider each path and rule for each.. and use the syslog 
and conntrack table
to diagnose what is going on.

b
 



