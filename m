From: Anton Rieger <rieger@jikken.de>
Subject: Re: nft show counter
Date: Thu, 1 Apr 2021 18:42:47 +0200
Message-ID: <20210401164247.ng3na2sbvrsqzcti@nisshoku.fritz.box>
References: <trinity-08431e16-b4eb-4bb7-8b36-df2084481611-1617212862528@3c-app-gmx-bap62>
 <20210331214053.GB13699@breakpoint.cc>
 <d5770849-515b-5514-39ab-bb6907023ca2@fhmtech.com>
 <trinity-e144cb32-0c89-44a6-b0f6-5b9edcf5e457-1617264512699@3c-app-gmx-bap06>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=jikken.de;
        s=Mv0BmWWr5KBeokdR; t=1617295368;
        bh=/6hew0oADwi9cqr0DRjV4EF0m6kQP1hiP9LOxT2r9BA=;
        h=Date:From:To:Subject:References:In-Reply-To;
        b=YVN2u1FXlCTTBRGtNSCjUwe1jagMkoei8T/oA6BGtkgacf7p6QhkMcw+lPrxmQ615
         TtIRL2+AvSae3Lyo/RmG96G3MI5SCGNssnpNxDZaYg/YmKfD3RyNd327/+Wm3D+REg
         3gitbm+ROs/ZLHIjurrhOzNvcTZCHEqmRmRVkVqU=
Content-Disposition: inline
In-Reply-To: <trinity-e144cb32-0c89-44a6-b0f6-5b9edcf5e457-1617264512699@3c-app-gmx-bap06>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Thu, Apr 01, 2021 at 10:08:32AM +0200, Frank Wunderlich wrote:
>made a little python-script (not yet with error-handling) to read out the bytes:
>
>import os
>import json
>
>
>def getCounter(countername):
>    stream = os.popen('nft list counter filter '+countername+' -j')
>    output = stream.read()
>    #print(output)
>    j=json.loads(output)
>    return j["nftables"][0]["counter"]["bytes"]
>
>print(getCounter("voip1"),"bytes")
>print(getCounter("voip2"),"bytes")

Here's above using the nftables python module:

```
from nftables import Nftables
from nftables import json


def getCounter(countername, family='ip'):
     nft = Nftables()
     nft.set_json_output(True)
	_, output, _ = nft.cmd(f"list counter {family} filter {countername}")
     j = json.loads(output)
     return j['nftables'][1]["counter"]["bytes"]

print(getCounter('voip1'), 'bytes')
print(getCounter('voip2'), 'bytes')
```

Greetings
Anton
