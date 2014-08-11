From: Vigneswaran R <vignesh@atc.tcs.com>
Subject: Re: a missing rule / incomplete routing
Date: Mon, 11 Aug 2014 17:24:08 +0530
Message-ID: <53E8AEE0.60800@atc.tcs.com>
References: <53E8946F.2070403@yahoo.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <53E8946F.2070403@yahoo.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: lejeczek <peljasz@yahoo.co.uk>
Cc: netfilter <netfilter@vger.kernel.org>

On 08/11/2014 03:31 PM, lejeczek wrote:
> dear experts
>
> I'm looking for ideas/suggestion why the following does not work
>
> there is a:
> * box A - 172.17.166.199 --  then there is 172./8 net -- box B - 
> 172.25.12.101 (phys0), 192.168.2.100 (phys1) -- and one more net 
> behind 192.168.2.100
>
> a 192.168.2.81 from behind box B can ping172.17.166.199
> but not the other way around, box A cannot get to box B's phys1 but it 
> does get to phys0
>
> I can control box A but have no control over the nets between it and 
> box B's phys0
> I can control box B
>
> I thought my route rules on box B are complete, box A is a winbox
> I though box B' firewall is ready
> but I obviously miss something
>
> there is no masquerading for phys0 nor phys1 one box B

It looks like  the firewall (FORWARD chain) in B is not allowing NEW 
connections from phys0 to phys1; only allowing ESTABLISHED connections, 
which made the ICMP reply packets through.


Regards,
Vignesh

