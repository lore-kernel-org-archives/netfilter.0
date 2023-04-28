From: Serg <seentr@at.encryp.ch>
Subject: Re: Possible to check if ip daddr belongs to an interface in the
 prerouting chain?
Date: Fri, 28 Apr 2023 13:05:17 +0300
Message-ID: <388bf505-89e7-a4c8-29c9-af7b784a3dd1@at.encryp.ch>
References: <D797AC4D-8B12-4F80-8C82-1591C3658D0B@gmail.com>
 <37bf019b-6c6e-4e97-a121-91a38270d845@at.encryp.ch>
 <9C3F0DD4-E1F2-4B21-AAF4-5779F0D9655E@gmail.com>
 <0f7066ff-d885-4726-80e8-31df1465a274@at.encryp.ch>
 <4F769A3B-272B-44A2-81A0-4B9AF437FA80@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=at.encryp.ch;
        s=flopster; t=1682676318;
        bh=uy0/bcoaZdZLNI6MhnQdX5fTJ+ELx3vOCcWE31H40xg=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To;
        b=hBDuholsQc6G66e3Q1cR2aMWHdr1jJytfzpdB5n/RCJZgjTSVnt1gZpLl3rLyCpuI
         7UhMAIj+zBzUjb/mJnXyKg94QrmouVVUXKS1bdDbk14HAN3KGyH85ix4keXeoNQpF6
         E5qKAnEMF8eTlshdgBSvz2NKFpvdQt67if+1hi0A=
In-Reply-To: <4F769A3B-272B-44A2-81A0-4B9AF437FA80@gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Glen Huang <heyhgl@gmail.com>
Cc: netfilter@vger.kernel.org

On 4/28/23 11:59, Glen Huang wrote:
>> nft add rule x prerouting fib daddr . iif type local accept
> “local" is very close to what I’m after, but from my test, it doesn’t match. The linked wiki seems to suggest that “local” means the same interface a packet originates from?
> 
> I wonder if there is an address type that denotes any IP that is hosted on local interfaces.

I am using the following ruleset to bypass nf_conntrack for traffic 
which neither originating from local IP nor destined to a locally 
configured IP addresses:

> table inet nftables_svc {
>   chain untrack_in {
>     type filter hook prerouting priority raw - 10; policy accept;
>       fib daddr . iif type != local notrack
>   }
> 
>   chain untrack_out {
>     type filter hook output priority raw + 10; policy accept;
>     fib saddr . oif type != local notrack
>   }
> }
Basically, what it does is lookup at "local" routing table - you may 
inspect it yourself using this command:
> ip route list table local
