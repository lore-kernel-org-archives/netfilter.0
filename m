From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: IPSec - IPTables issues
Date: Wed, 05 May 2004 10:01:17 -0500
Sender: linux-net-owner@vger.kernel.org
Message-ID: <409901BD.10603@pbl.ca>
References: <20040502155538.GD515@schottelius.org> <4096317F.8020609@eurodev.net> <20040504211557.GA236@schottelius.org> <4098FE7A.8070707@pbl.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-net-owner@vger.kernel.org>
In-Reply-To: <4098FE7A.8070707@pbl.ca>
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Cc: Nico Schottelius <nico-linux-net@schottelius.org>, Pablo Neira <pablo@eurodev.net>, netfilter@lists.netfilter.org, gregor-net@paasch.name, linux-net@vger.kernel.org

Aleksandar Milivojevic wrote:
> Nico Schottelius wrote:
>> - allow AH, ESP, UDP/500, deny rest on eth0
>> - allow IPs/networks, etc. on ipsec0
> 
>   - allow hosts/networks on eth0 (in Netfilter part of kernel)
>   - setup IPSec policies so that traffic from allowed hosts/networks is 
> required to be encrypted (in IPSec part of kernel)

One thing that just came to my mind.  The unencrypted packet is 
obviously related to the encrypted packet.  I don't know if IPSec part 
of kernel is aware of Netfilter part of kernel, and I have no idea how 
Netfilter (or kernel) is internally tracking packtes, but a thing to try 
(might work, or might fail misserably) in exactly this order:

- allow hosts/networks if state is RELATED
- allow AH, ESP, UDP/500 if state is NEW or ESTABLISHED

Once again, I have no idea if your assumption that encrypted packtes are 
traversing Netfilter tables twice is correct, so above might just be me 
blabing about something I have no idea how it works.  Consider this to 
well intended brainstorming (just some ideas from back of my head, that 
might not have any support in reality).

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7
