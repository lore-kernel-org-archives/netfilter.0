From: Stephen Satchell <list@satchell.net>
Subject: Re: Reload IPtables
Date: Sun, 27 Jun 2021 12:56:18 -0700
Message-ID: <b18dbd3a-3154-5f2e-20ea-2df5f787f33c@satchell.net>
References: <08f069e3-914f-204a-dfd6-a56271ec1e55.ref@att.net>
 <08f069e3-914f-204a-dfd6-a56271ec1e55@att.net>
 <4ac5ff0d-4c6f-c963-f2c5-29154e0df24b@hajes.org>
 <6430a511-9cb0-183d-ed25-553b5835fa6a@att.net>
 <877683bf-6ea4-ca61-ba41-5347877d3216@thelounge.net>
 <d2156e5b-2be9-c0cf-7f5b-aaf8b81769f8@att.net>
 <20210627191107.79ca63b9cf4dfe9028649524@plushkava.net>
 <227edb33-b86d-2310-bc63-c6d903bea95d@att.net>
 <20210627200752.694217a849963715fd782049@plushkava.net>
Reply-To: list@satchell.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20210627200752.694217a849963715fd782049@plushkava.net>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux Netfilter Users List <netfilter@vger.kernel.org>

On 6/27/21 12:07 PM, Kerin Millar wrote:
> Use of shell redirection is optional in this case but I would caution
> against making it a habit in conjunction with the use of sudo.

I believe your statement is not distribution-safe.  Red Hat's 
implementation of ip[6]tables-restore does not implement reading a file. 
  Ubuntu's implementation of ip[6]tables-restore does.

This observation is backed up by viewing "iptables-restore -h".

That said, I suspect that Debian would use substantially the same 
version of iptables-restore that Ubuntu does, so your observation would 
be applicable.

(I spend two decades in the Red Hat universe.  Then CentOS happened. 
Moving all my servers to Ubuntu server edition.)
