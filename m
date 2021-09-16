From: Daniel <tech@tootai.net>
Subject: Re: Error: conflicting intervals specified - Bullseye 0.9.8
Date: Thu, 16 Sep 2021 13:27:44 +0200
Message-ID: <48e95c8a-2469-08dd-0620-55187252653c@tootai.net>
References: <ab060c71-e640-a67e-347f-60cd1d800932@tootai.net>
 <20210916092924.GB31336@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1631791665; bh=eQ5gXaD0o1UASKesIj4FQLv6/5/tH8H2H0VCTczOtHQ=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=MCsbzdPwCRB3sHvtP6lRRv/RiK0XW7mplzKDDkWZA2ciBvk/1UcYpHkMzTqlzyFbI
         RDywgtss4jG6LigXDSLCq2xUCEoKdgzHvso++l/lilnqFKYCGxzTKmPdo1VLqwZZae
         9Ge2XvkQt9SuzftZ+ZsaPMQCwrv3EuiW0OHEiJ3c=
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1631791664; bh=eQ5gXaD0o1UASKesIj4FQLv6/5/tH8H2H0VCTczOtHQ=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=GSIwZsMqOk3rTpue1ACpslL906RcvAyvEfcNcnjGo5EaZkitN25x8swtZ/JuR9RKw
         1wWbG1RMCH5NQ5//BCKbEi6Tdq6uDH9Z6N6QUSORDnsqnk3FQno6BbZBTz2PcLaAS1
         8/zCek4WwxPW4AU9nr1CEykHIlL4JxDzzOxLGtBo=
In-Reply-To: <20210916092924.GB31336@salvia>
Content-Language: fr-FR
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Netfilter list <netfilter@vger.kernel.org>

Hello

Le 16/09/2021 à 11:29, Pablo Neira Ayuso a écrit :
> On Wed, Sep 08, 2021 at 11:33:02AM +0200, Daniel wrote:
>> Hi,
>>
>> I get the following error with the above nft version, lan being the
>> interface name:
>>
>> add element ip6 nat fwdtoip_tcp.lan { 1-65534 : 2001:db8:27b:10:ff9b::,
>> 1-65534 : 2001:db8:27b:ff9b::c0a8:ad1}
>>
>> with
>>
>> add map ipv6_addr nat fwdtoip_tcp.lan { type inet_service : ipv6_addr\;
>> flags interval\; }
>>
>> What's wrong here ? My goal being to redirect all (or range ports) external
>> traffic to another server.
> Could you develop what your use-case is?
The above example says -in my mind ;)- that everything coming from 
outside on ip

2001:db8:27b:10:ff9b:: should be redirect (symmetrical) to ip 2001:db8:27b:ff9b::c0a8:ad1

>
> Keys uniquely identify an entry in a map, if you define two entries
> with the same key, you hit this conflict interval error.
I see this like forward port:ip to port:anotherip

-- 
Daniel
