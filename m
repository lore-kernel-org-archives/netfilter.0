From: Mike Wright <mike.wright@mailinator.com>
Subject: Re: ipporthash, ipportiphash, ipportnethash problems
Date: Wed, 06 Oct 2010 07:37:06 -0700
Message-ID: <4CAC8992.2030708@mailinator.com>
References: <4CA5091B.1090200@googlemail.com> <alpine.DEB.2.00.1010010913200.11563@blackhole.kfki.hu> <4CA5C48E.9010603@googlemail.com> <alpine.DEB.2.00.1010012302530.19869@blackhole.kfki.hu> <4CA70B3B.90001@googlemail.com> <alpine.DEB.2.00.1010022104571.23216@blackhole.kfki.hu> <4CA7978B.9020900@googlemail.com> <alpine.DEB.2.00.1010032106460.26617@blackhole.kfki.hu> <4CA8FDE1.8090809@googlemail.com> <alpine.DEB.2.00.1010041134130.28881@blackhole.kfki.hu> <4CAC866D.7060101@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4CAC866D.7060101@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, netfilter@vger.kernel.org

Mr Dash Four wrote:
> 
>>> So I should not use IP_NF_SET_HASHSIZE for the time being until it is 
>>> fixed,
>>> right?
>>>     
>>
>> Yes, because currently it's ignored. In this week I'm going to fix it 
>> in the git repository but won't release a new version just for this.
>>   
> There is another issue I found when using ipmap sets: when I execute, 
> for example, "ipset -N port-map ipmap --from 10 --to 30000" and then add 
> an element "ipset -A port-map 20" the two statements are accepted 
> without any error given (they shouldn't be as the map defined is an IP 
> map, not a port map and the values submitted are numbers, not IP 
> addresses)!
> 
> When I issue "ipset -L port-map" I get:
> 
> Header: from: 0.0.0.10 to: 0.0.117.48
> members:
> 0.0.0.20
> 
> Is this deliberate or a bug?

It's deliberate.

The numbers are treated as modulo 256.

30,000 / 256 = 117.1875
.1875 * 256 = 48

Thus the whole number parts become segments of the quad: 117.48

