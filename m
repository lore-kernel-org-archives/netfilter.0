From: Stephen Satchell <list@satchell.net>
Subject: Re: Reload IPtables
Date: Sun, 27 Jun 2021 12:43:56 -0700
Message-ID: <e4a491da-fd8c-552e-d40d-2581cb4c4242@satchell.net>
References: <08f069e3-914f-204a-dfd6-a56271ec1e55.ref@att.net>
 <08f069e3-914f-204a-dfd6-a56271ec1e55@att.net>
 <4ac5ff0d-4c6f-c963-f2c5-29154e0df24b@hajes.org>
 <6430a511-9cb0-183d-ed25-553b5835fa6a@att.net>
 <877683bf-6ea4-ca61-ba41-5347877d3216@thelounge.net>
 <d2156e5b-2be9-c0cf-7f5b-aaf8b81769f8@att.net>
 <20210627191107.79ca63b9cf4dfe9028649524@plushkava.net>
 <227edb33-b86d-2310-bc63-c6d903bea95d@att.net>
Reply-To: list@satchell.net
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <227edb33-b86d-2310-bc63-c6d903bea95d@att.net>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

On 6/27/21 11:32 AM, slow_speed@att.net wrote:
> As it turns out, I am learning two ways at once.  One is my desktop 
> computer running Debian 10 which used nftables (and I believe 
> nftables-persistent is built-in to the nftables mechanism).  The other 
> is a little Raspian server which is based on Debian 10, but does not use 
> nftables.

I've only got started with nftables, which is why I bought the latest 
edition of Linux Firewalls.  In particular, I wanted to duplicate 
reverse packet filtering, but in both IPv4 and IPv6.  So I don't know 
the toolset for nft yet.

> In the second case, one must reload iptables when changes are made to 
> it.  If I correctly understand, one must use sudo iptables -F, followed 
> by sudo iptables-restore < /etc/iptables.up.rules (or wherever they 
> are).  Doesn't it need the little left arrow/less-than sign?  Does that 
> sound correct?

Yes.  What you are doing with iptables-restore (and ip6tables-restore) 
is presenting the contents of a file originally created by 
ip[6]tables-save to stdin of the -restore programs.

By the way, if I'm reading the man page correctly  ip[6]tables-restore 
does the -F for you, unless you tell it not to.  You can also restore 
only a single table from the collected rules.  Details on the man page.
