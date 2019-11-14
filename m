From: A L <mail@lechevalier.se>
Subject: ipset bitmap:port question
Date: Thu, 14 Nov 2019 02:24:19 +0100
Message-ID: <ba4fb013-93a0-3f63-0fd6-a4ee557893af@lechevalier.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lechevalier.se; s=20140924;
        h=content-transfer-encoding:content-type:mime-version:date:message-id:subject:
         from:to:from;
        bh=YxxEXUG7MvN2Mr+XusgTAzIxivIvxiCMY3Q7nQd3W3o=;
        b=gksjbDeFxHIWd28GxoKp8+uwkNV14n3BavGyQihtjHaaQ5Fmv1l918eNP7QKQ53/EE+vGNYyR1n32
         TSTVz9DZ426h0XSivmYbeHSRFIyM/22ntl0aPobiM4iV8ZbZlqCYqk+24Ud/wEpJOFxcEc/Jjl9pdY
         GlQeTtut5ofq1BqU=
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hello,

I'm trying to understand if ipset "bitmap:port" should support protocol 
or not. Based on the name"bitmap:port" it should only store one value 
per row, and not tuple like "bitmap:ip,mac" does. However the examples 
in the manual suggests it should?

 From the man page at http://ipset.netfilter.org/ipset.man.html#lbBI

bitmap:port
/ADD-ENTRY/:= {/[proto:]port/|/[proto:]fromport/-/toport/}
Examples:
     ipset create foo bitmap:port range 0-1024
     ipset add foo 80
     ipset test foo 80
     ipset del foo udp:[macon-udp]-[tn-tl-w2]


However in my testing I can't see any entries with udp or tcp in the list.

     # ipset create test bitmap:port range 1000-65000 comment
     # ipset add test tcp:8080 comment "http proxy"
     # ipset add test udp:9999 comment "some udp service"


However when listing or exporting the "test" set, there is no protocol 
information.

     # ipset list test
     Name: test
     Type: bitmap:port
     Revision: 3
     Header: range 1000-65000 comment
     Size in memory: 520144
     References: 0
     Number of entries: 2
     Members:
     8080 comment "http proxy"
     9999 comment "some udp service"

     # ipset save test
     create test bitmap:port range 1000-65000 comment
     add test 8080 comment "http proxy"
     add test 9999 comment "some udp service

I am running:
ipset v7.1, protocol version: 7
kernel 5.3.10

Regards,
~A

