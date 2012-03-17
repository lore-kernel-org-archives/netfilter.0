From: Miles Stevenson <miles@mstevenson.org>
Subject: Re: Figuring out odd web traffic from clients
Date: Sat, 17 Mar 2012 20:28:31 +0000
Message-ID: <04AA66A9B9884FF69D3526953026D58E@gmail.com>
References: <CABqG1H8VJuXgPuNWa=8it1TCeDOXYL3LtOVKix3Xv7Un-=yRaw@mail.gmail.com>
 <4F63C987.4000100@mandragor.org>
 <7F9E8AF0E40846F28C9EA7BCA54D93C2@gmail.com>
 <15F55D7D8D0B48F8B8B495E62D858E8C@gmail.com>
 <alpine.DEB.2.00.1203172010310.27616@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :x-mailer:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=rlQXLneloZ1B1YRIoNADLaFZEGg0cTRay4sAMlJBTUQ=;
        b=KbQt6bipj6Y/BgFVvm+5pysuDGPaRltxmE9Pc1dWHpiGPPClr4+P+ySZbCYkrwLane
         y0tns7BDzEK31CemJXJK5upgDVLB2NNeFy1D/BdIENsjI9eqpgqCJ2dNE8pZWPIPySQ+
         GKE4cy6rxlMnfLWQx8GMHIXYNJRVq6ghKFlv8i/9Pov6Gz5NM7+3psRAK3kYaiw9Vu3m
         ruHc0xFqzPryEC/g4yOP8Fet9hswJQ6th0KcrQl6JcRS8Aobeb2TOBJrHZbAFILl8QuC
         HEqc95SQ+6Cl2j+3ZdKedoOhU6jci0fJNXIg+zxjBSlOlMcvrSj6SuwD53b8PzYZuVtL
         WiTQ==
In-Reply-To: <alpine.DEB.2.00.1203172010310.27616@blackhole.kfki.hu>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Jozsef,
> The packet was not dropped but ignored by conntrack.

Thanks for the reply. That explains a lot of my confusion then. It also explains why I don't see an accompanying log showing each of those packets were rejected, because they probably weren't. They were probably added to the state table and passed through successfully.

> It can happen easily: packets seen by the firewall can get lost in either 
> direction or client-server can be out of sync. In your case it's a 
> webserver: probably the client might just try to re-establish a timed out 
> connection attempt: it sent a SYN which was not answered by the server 
> (overloaded, slow to answer, etc) and sent a SYN with new parameters, and 
> both attempts were seen by conntrack. However the webserver was slow to 
> process the first connection attemtp and just sends the SYN/ACK answer to 
> the first SYN attempt, which is detected by conntrack - and the 
> packet ignored.
> 
That sounds plausible and would be consistent with what I'm seeing actually get rejected by the filter rules. That is, the errant FIN and RST packets from both directions getting rejected, because those sessions are out of sync with the state table completely and don't even match a known "tuple" by the state table. I guess more tcpdump/wireshark analysis would help to confirm this.
> 
> Maybe the webserver cannot cope with the connection load. Or it's a client 
> side issue. A full tcpdump can help to tell what happens exactly.


This was my first thought. The web server definitely has a hard time during peak loads. But this also happens during light loads. I'm still seeing this behavior right now, during fairly light traffic. The web server load averages are all low, and Apache is seeing an average of about 20 requests/sec, for a total of 0.5MB/sec inbound + outbound web traffic total. It's a Xeon multi-CPU / multi-core server, so it should definitely be able to cope with this. So I might have a configuration problem somewhere or might be experiencing a bug of some sort with Apache or the CentOS kernel, not sure. 

Thanks for all the input, I really appreciate it. My troubleshooting will continue, but if anyone wants to suggest anything else that I should try or investigate, I'm all ears. Thanks everyone. This is a quality mailing list.

-Miles


