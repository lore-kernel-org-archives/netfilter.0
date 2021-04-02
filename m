From: Frank Myhr <fmyhr@fhmtech.com>
Subject: Re: nft show counter
Date: Fri, 2 Apr 2021 13:16:50 -0400
Message-ID: <7fe793ae-1474-883e-1f75-4746ee7a9070@fhmtech.com>
References: <trinity-08431e16-b4eb-4bb7-8b36-df2084481611-1617212862528@3c-app-gmx-bap62>
 <20210331214053.GB13699@breakpoint.cc>
 <d5770849-515b-5514-39ab-bb6907023ca2@fhmtech.com>
 <trinity-e144cb32-0c89-44a6-b0f6-5b9edcf5e457-1617264512699@3c-app-gmx-bap06>
 <20210401164247.ng3na2sbvrsqzcti@nisshoku.fritz.box>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=larkmoor.net; s=larkmoor20140928;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:Cc:References:To:Subject; bh=a8X7wUFyDeENWk4VcD15CNtPBy6Ui6B2lqKoyBpy0vo=;
        b=rvlUXSi8fZswnehfrObtougBr0ODS2DWUJ8unk+xK5NXvilVBfoqOsWj4/go46ocwT3pjMYMojhGItYQTxVB/zhkOh9YDc0KdpcTL946uf9CbSOvRLko1sylVH9pJ9mqniVOVQdMZRDbtXYtrWSOoYVjh8PGkU6nvRQcUuueB2Y=;
In-Reply-To: <20210401164247.ng3na2sbvrsqzcti@nisshoku.fritz.box>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org
Cc: rieger@jikken.de, Frank Wunderlich <frank-w@public-files.de>

On 2021/04/01 12:42, Anton Rieger wrote:
> On Thu, Apr 01, 2021 at 10:08:32AM +0200, Frank Wunderlich wrote:
>> made a little python-script (not yet with error-handling) to read out 
>> the bytes:
>>
>> import os
>> import json
>>
>>
>> def getCounter(countername):
>>    stream = os.popen('nft list counter filter '+countername+' -j')
>>    output = stream.read()
>>    #print(output)
>>    j=json.loads(output)
>>    return j["nftables"][0]["counter"]["bytes"]
>>
>> print(getCounter("voip1"),"bytes")
>> print(getCounter("voip2"),"bytes")
> 
> Here's above using the nftables python module:
> 
> ```
> from nftables import Nftables
> from nftables import json
> 
> 
> def getCounter(countername, family='ip'):
>      nft = Nftables()
>      nft.set_json_output(True)
>      _, output, _ = nft.cmd(f"list counter {family} filter {countername}")
>      j = json.loads(output)
>      return j['nftables'][1]["counter"]["bytes"]
> 
> print(getCounter('voip1'), 'bytes')
> print(getCounter('voip2'), 'bytes')
> ```
> 
> Greetings
> Anton

Nice!

Anton & Frank W., is it OK with you if I include your examples in the 
nftables wiki?

Thanks,
Frank M.
