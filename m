From: Piotr Jurkiewicz <piotr.jerzy.jurkiewicz@gmail.com>
Subject: How to update timeout of a map element?
Date: Sun, 8 Nov 2020 17:57:41 +0100
Message-ID: <75d70e12-659f-0e56-00d8-380a39cc83ba@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=2uy1+bwVX6+1jx/rf47Gu+gZ3RasfhQnwy4XWL1mj0k=;
        b=oGfLbFFMwiczT+C3zsWcq/EuUq2hrDDX7O3vpZmuwk6//4t3Ap7qRYQ/14Sd3kuxz+
         5TlwaOrVR6S8nr9B8/ckPAMTYyPrKdNFuBhHVNZRtjpuNl0SJF3odOt9Bksb/xHH6EU6
         xMeOXVi/tUMlGvlTvUwiFYgFt5T+XRE9Hio6JE3Duh+M3c+NHmvNoF3GyWk2b7/xxmFU
         0ks4hcMhqPwdf8bXGTB2ClFzZeihPNBoNWyaIP+T501dxlMdz24yxpv+F/0fexaBWAEM
         bgOicGrdqilBuJvxyulBJ/Ye1uemnXK14trlB0CnwqTsZ+KNK1pckIXanlUT7qvo30Y3
         IkUw==
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

I have a question regarding a very basic thing: How to refresh the map 
element timeout without recreating that element (i.e. without setting 
its value again)?

According to:

https://wiki.nftables.org/wiki-nftables/index.php/Updating_sets_from_the_packet_path

in the case of sets, the update operation can be used:

update @ctrs { ip saddr . ip daddr . th sport . th dport counter }

However, in the case of maps, the update operation requires specifying 
not only the key, but also value of a map element:

update @flows { ip saddr . ip daddr . th sport . th dport : rt nexthop }

Such a value can be unavailable in many cases. For example, let's 
consider the following configuration which caches flows nexthops (aka 
poor man's flow table):

table ip x {

     map flows {
             typeof ip saddr . ip daddr . th sport . th dport : ip daddr
             timeout 5s
     }

     set ctrs {
             typeof ip saddr . ip daddr . th sport . th dport
             flags dynamic
             timeout 5s
     }

     chain prerouting {
         type filter hook prerouting priority -300; policy accept;
         ip protocol { tcp, udp } dup to ip saddr . ip daddr . th sport 
. th dport map @flows update @ctrs { ip saddr . ip daddr . th sport . th 
dport counter } drop
     }

     chain forward {
         type filter hook forward priority 0; policy accept;

         ip protocol { tcp, udp } add @flows { ip saddr . ip daddr . th 
sport . th dport : rt nexthop }
         ip protocol { tcp, udp } add @ctrs { ip saddr . ip daddr . th 
sport . th dport counter }
     }
}

We can update the @ctrs set in prerouting chain to collect per-flow 
counters. Elements in this set will expire 5s after last flow packet. 
However, there is no way to refresh timeouts of @flows map elements. We 
cannot use rt nexthop here, since it would recreate the entry with 
current nexthop, which would obviously make our cache no op. As a 
result, element in @flows map will expire 5s after FIRST packet and the 
entry would be recreated in forward chain with a new nexthop, which also 
makes the cache pretty useless.

I see two solutions for this problem. The first one would be to allow 
update operations on maps to refresh timeouts without specifying 
element's value:

update @flows { ip saddr . ip daddr . th sport . th dport }

The second one would be to add a new flag to maps, which would make maps 
refresh their elements timeout on every hit (map lookup).

Or there is already some way to achieve this which I missed?

Regards,
Piotr Jurkiewicz
