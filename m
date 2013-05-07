From: "tian fang" <tianfang@gmail.com>
Subject: RE: Fwd: ipset and counters
Date: Tue, 7 May 2013 21:32:22 +0800
Message-ID: <002c01ce4b27$5026a240$f073e6c0$@com>
References: <51752B00.8090908@metu.edu.tr> <51753143.8090908@metu.edu.tr> <alpine.DEB.2.00.1304221554230.16792@blackhole.kfki.hu> <5175432F.2060304@metu.edu.tr> <alpine.DEB.2.00.1304221921001.19576@blackhole.kfki.hu> <loom.20130506T151314-549@post.gmane.org> <alpine.DEB.2.00.1305061535250.12392@blackhole.kfki.hu> <003a01ce4a68$7ccb5e40$76621ac0$@com> <alpine.DEB.2.00.1305062022050.15306@blackhole.kfki.hu> <002b01ce4b1b$1e766980$5b633c80$@com> <alpine.DEB.2.00.1305071409560.16401@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:from:to:cc:references:in-reply-to:subject:date
         :message-id:mime-version:content-type:content-transfer-encoding
         :x-mailer:thread-index:content-language;
        bh=ZDRHL69Iwx3FXb6FVrOfUj9Pi7UBEHtLateLZ8R8Al8=;
        b=jIsSDLUsWVuMn1hb5VCXejcuY8aL6BjyTQw/9eYzVNl8YFqa7Q6NH5ln25hs/QAw7X
         uoTRKaBC+2LgYpt2xb8LbHljG0Mw+pfktTXKkJN4w4YCa1kqhuko1yhUO0t8u9OWYkz6
         emtvfgAI29mgv6aIMLN0i6Aqjri80QV3wkKZ3Tf1fLm6aZ848c7sOwGBTcQictPtp0IK
         ZHbXaSLgOY54O1XbyYpeRAShK5zIskFMaiir4zYKZ1Wa2I7x4hHJraow4ny5jpngo7GT
         U+WN8XtLMZlXVkMOSmHOb6xrbFoW1G3HBalJ+1jdlVbnQnpqyF7cfrTMvl0UoYLp+5PK
         twfw==
In-Reply-To: <alpine.DEB.2.00.1305071409560.16401@blackhole.kfki.hu>
Content-Language: zh-cn
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Jozsef Kadlecsik' <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org

> 
>      I am using ubuntu 12.04 LTS.

I'll check this out: it should work without any extra effort.

> And I got an issue ,I am sorry if I am wrong because I am a quite newbie.
> 
> I am confused of the "--match-set setname src,dst" .  it seems only 
> the one before the comma is functional. Please look at this .
> 
> I added an IP into the ipset sec,and set the iptables FORWARD Chain as 
> "dst, src" ,I guess this means dst OR src, but unfortunately ,my 
> outgoing packages was dropped.
> 
> If I set two separated lines ,it works.

If the dimension of the set is less than the direction parameters of the set
match/SET target, then that's ignored.

With "--match-set setname src,dst" you instruct ipset that if the named set
stores IP address and port number pairs, then get the source and destination
parameters from the packets, say 192.168.1.1 as source address, TCP port 80
as destination, form the element 192.168.1.1,tcp:80 and look it up in the
given set.

You can't store and lookup IP address pairs, if that's what you want.

Best regards,
Jozsef
 
Jozsef,
    Thanks much for your kindness. Seems I have to set two separated rules
for my purpose.
And I have the last question ,what is the maximum number of the ipset bytes
counters ?

RGS
tian

