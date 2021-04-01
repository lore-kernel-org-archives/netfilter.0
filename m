From: Frank Wunderlich <frank-w@public-files.de>
Subject: Aw: Re: nft show counter
Date: Thu, 1 Apr 2021 10:08:32 +0200
Message-ID: <trinity-e144cb32-0c89-44a6-b0f6-5b9edcf5e457-1617264512699@3c-app-gmx-bap06>
References: <trinity-08431e16-b4eb-4bb7-8b36-df2084481611-1617212862528@3c-app-gmx-bap62>
 <20210331214053.GB13699@breakpoint.cc>
 <d5770849-515b-5514-39ab-bb6907023ca2@fhmtech.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1617264512;
        bh=nVxlJvevPYZ+z4Jnk3pEIOGdX5ibb6ScuGwQ3Li+6TU=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=kcamek8uaLPKaFtephn0SmfEo83FOro5mrQJH6l6sOdLl/oi3sRem/Y9Q6fuelIVm
         pqJio79NyYO6Ii6Zk6GCdl0m1RICeF3bP0usoiNMxQYYTyA+LxzFMtmbTxF/W76rZx
         idZHpr4I1ezsLQwvmxv/7MPYVmo02iqeqCSq0COk=
In-Reply-To: <d5770849-515b-5514-39ab-bb6907023ca2@fhmtech.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Frank Myhr <fmyhr@fhmtech.com>
Cc: Florian Westphal <fw@strlen.de>, netfilter@vger.kernel.org

> Gesendet: Donnerstag, 01. April 2021 um 01:08 Uhr
> Von: "Frank Myhr" <fmyhr@fhmtech.com>
> An: "Florian Westphal" <fw@strlen.de>, "Frank Wunderlich" <frank-w@publi=
c-files.de>
> Cc: netfilter@vger.kernel.org
> Betreff: Re: nft show counter
>
> On 2021/03/31 17:40, Florian Westphal wrote:
> > You could use a named counter and then fetch it via 'nft list counter
> > inet tablenam countername'.
>
> This is the straightforward solution!
>
> Florian, is it correct that *all* counters are stateful objects, they're
> just anonymous stateful objects if used in a rule without first
> declaring them with a name? The wiki reads as if they're 2 separate
> things (I'm happy to fix but want to check with you first):
>
> https://wiki.nftables.org/wiki-nftables/index.php/Counters

Hi,

thank you, i saw the named counters before, but i have thought i can read =
out the "normal" counters too...

have now changed to named counters (instead of jump to voipX-chain)

my rules-file looks like this now (just for anybody wants do do similar):

table ip filter {
    ...
    chain FORWARD {
        type filter hook forward priority 0; policy drop;
        #...
        ip saddr $ipvoipbox udp dport 5160 counter name voip1 comment "cou=
nting packets for SIP1"
        ip daddr $ipvoipbox udp dport 5160 counter name voip1 comment "cou=
nting packets for SIP1"
        ip saddr $ipvoipbox udp sport 5161 counter name voip2 comment "cou=
nting packets for SIP2"
        ip daddr $ipvoipbox udp dport 5161 counter name voip2 comment "cou=
nting packets for SIP2"
        #...
    }

    counter voip1 {
    }

    counter voip2 {
    }
}

one thing:

# nft list counter filter voip2
table ip mangle {
}
table ip nat {
}
table ip filter {
	counter voip2 {
		packets 124 bytes 7440
	}
}


tables mangle and nat should not be printed (still have them separately fr=
om converting iptables to nft)...in json-format it is right

# nft list counter filter voip2 -j
{"nftables": [{"counter": {"family": "ip", "name": "voip2", "table": "filt=
er", "handle": 6, "packets": 136, "bytes": 8160}}]}

made a little python-script (not yet with error-handling) to read out the =
bytes:

import os
import json


def getCounter(countername):
    stream =3D os.popen('nft list counter filter '+countername+' -j')
    output =3D stream.read()
    #print(output)
    j=3Djson.loads(output)
    return j["nftables"][0]["counter"]["bytes"]

print(getCounter("voip1"),"bytes")
print(getCounter("voip2"),"bytes")



regards Frank
