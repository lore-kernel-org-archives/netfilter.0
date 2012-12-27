From: Richard A Nelson <cowboy@cavein.org>
Subject: Re: conntrack-tools rpc helper
Date: Wed, 26 Dec 2012 19:36:33 -0500
Message-ID: <50DB9811.7040002@cavein.org>
References: <50D90E08.40100@cavein.org> <20121226224301.GA32453@1984>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cavein.org; s=2008;
	t=1356568595; bh=Y335RJZD7b/fjbSvUv8XJUEgWPK1Vv4jum0pYjyj2BA=;
	l=2236;
	h=Message-ID:Date:From:MIME-Version:To:CC:Subject:References:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	b=zI3OJqCWdyu9M4UdgVP4q/VdAm6kAxvVHAhnEaOZgX+/21uHHKair92tVaJ3vh9xB
	 Y8BX5OfVbZU9pGNK/odglqN42X76ktcRWP5yxF3ZiPhezFKdjiZwyDxBqbYVP0McE4
	 WnP2daHqVerlJb402nOiUu3SWOs1K9xSF0vZWb/o=
In-Reply-To: <20121226224301.GA32453@1984>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

On 12/26/2012 05:43 PM, Pablo Neira Ayuso wrote:
> Hi Richard,

Thanks for the quick, and on target note !

>
> {
>      .name = rpc,
>      .queuenum = 0,
>      .l3protonum = 2,
>      .l4protonum = 17,
>      .priv_data_len = 16,
>      .status = disabled,
> };
>
> Why disabled?  conntrackd startup went fine, the nfct helper add
> went fine, what am I missing ?
> That means conntrackd did not configured the helper so far, so it
> remains dormant in the kernel.
>
> Did you add the corresponding Helper clause to conntrackd.conf?
>
> It should be something similar to what you can find under
> conntrack-tools/doc/helper/conntrackd.conf.
>
> Please, check /var/log/conntrackd.log (or custom path in case you set
> it). It should report some information regarding the helper
> configuration.

My confusion seemed to have been the requisite three part dance - even though 
they're pretty well described in the docs.
1) Register helpers via nfct
2) Add iptables rules in -t raw (output & prerouting)
3) (Re)Start conntrackd

I now see:
# nfct helper list
{
     .name = rpc,
     .queuenum = 2,
     .l3protonum = 2,
     .l4protonum = 6,
     .priv_data_len = 16,
     .status = enabled,
};
{
     .name = rpc,
     .queuenum = 1,
     .l3protonum = 2,
     .l4protonum = 17,
     .priv_data_len = 16,
     .status = enabled,
};

I rebooted, and made sure things came back up in the same state... looking good.
>
> This was tested with NFSv3 running both Linux in the client and the
> server sides.
Perfect, then - there is a good chance this'll go...  I'm still somewhat worried 
about the fact that the RPC call is answered by a different machine than the 
request was made to... but trial and error is called for now ;)
>
> I'd suggest to start by getting that "disabled" issue resolved first,
> then, move on to see what other problem you find.
Exactly, one down - and I have removed the old rules allowing arbitrary replies 
from port 111, and things are working well on the server side (NFSv3 mounts work 
fine).

Now, to see if I can coax the AIX box into booting again - otherwise I'll try 
another Linux client behind the server.

Thanks again!

-- 
Rick Nelson
Life'll kill ya                         -- Warren Zevon
Then you'll be dead                     -- Life'll kill ya

