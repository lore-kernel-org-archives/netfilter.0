From: Anton Rieger <rieger@jikken.de>
Subject: Re: nft show counter
Date: Sat, 3 Apr 2021 00:22:26 +0200
Message-ID: <20210402222226.kncnxuxztbxhrpjv@nisshoku.fritz.box>
References: <trinity-08431e16-b4eb-4bb7-8b36-df2084481611-1617212862528@3c-app-gmx-bap62>
 <20210331214053.GB13699@breakpoint.cc>
 <d5770849-515b-5514-39ab-bb6907023ca2@fhmtech.com>
 <trinity-e144cb32-0c89-44a6-b0f6-5b9edcf5e457-1617264512699@3c-app-gmx-bap06>
 <20210401164247.ng3na2sbvrsqzcti@nisshoku.fritz.box>
 <7fe793ae-1474-883e-1f75-4746ee7a9070@fhmtech.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=jikken.de;
        s=Mv0BmWWr5KBeokdR; t=1617402148;
        bh=JDENdNYaTPjGKaQ4CVl81DIiYAzuEfsJAmUlWc18ljA=;
        h=Date:From:To:Subject:References:In-Reply-To;
        b=ab5KJZxxod945aSJifVTdme3xCa8xRdzpKEeEkCLdkI/Xae+UMy4BU2jl8eSoFYxu
         WZ/ZepgvczDeiIGjtwWNQt/ippO4lHaR8rGCVZXjS426XkVG0lwEiBUit6AWAPtIzO
         MCukDw2mAob6ixAugLNxMZbB5r+3/IfGdjnBRzg4=
Content-Disposition: inline
In-Reply-To: <7fe793ae-1474-883e-1f75-4746ee7a9070@fhmtech.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

On Fri, Apr 02, 2021 at 01:16:50PM -0400, Frank Myhr wrote:
>On 2021/04/01 12:42, Anton Rieger wrote:
>>On Thu, Apr 01, 2021 at 10:08:32AM +0200, Frank Wunderlich wrote:
>>>made a little python-script (not yet with error-handling) to read
>>>out the bytes:
>>>
>>>import os
>>>import json
>>>
>>>
>>>def getCounter(countername):
>>>   stream = os.popen('nft list counter filter '+countername+' -j')
>>>   output = stream.read()
>>>   #print(output)
>>>   j=json.loads(output)
>>>   return j["nftables"][0]["counter"]["bytes"]
>>>
>>>print(getCounter("voip1"),"bytes")
>>>print(getCounter("voip2"),"bytes")
>>
>>Here's above using the nftables python module:
>>
>>```
>>from nftables import Nftables
>>from nftables import json
>>
>>
>>def getCounter(countername, family='ip'):
>>     nft = Nftables()
>>     nft.set_json_output(True)
>>     _, output, _ = nft.cmd(f"list counter {family} filter {countername}")
>>     j = json.loads(output)
>>     return j['nftables'][1]["counter"]["bytes"]
>>
>>print(getCounter('voip1'), 'bytes')
>>print(getCounter('voip2'), 'bytes')
>>```
>>
>>Greetings
>>Anton
>
>Nice!
>
>Anton & Frank W., is it OK with you if I include your examples in the
>nftables wiki?

Sure
