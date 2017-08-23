From: Jeff Kletsky <netfilter@allycomm.com>
Subject: Re: Hints needed to find causes of non-specific error messages
Date: Wed, 23 Aug 2017 14:00:46 -0700
Message-ID: <7c9cc6db-30be-5b89-7030-5ea3bec04c8b@wagsky.com>
References: <0628e05b-00cb-0135-3ffc-c44dcb4634b3@wagsky.com>
 <0ea79422-035e-6a2a-d416-937f32615e89@wagsky.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <0ea79422-035e-6a2a-d416-937f32615e89@wagsky.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Jeff Kletsky <netfilter@allycomm.com>, Netfilter Users Mailing list <netfilter@vger.kernel.org>

Found the root cause -- duplicate chain name (prer_r) within the same 
table after all the sed-ing to shorten things.

The error messaging truly needs to be a lot better.


The question of the permitted identifier length is still outstanding.


Jeff



On 8/23/17 12:57 PM, Jeff Kletsky wrote:
> I've now tried striping everything out of the chains, except for a 
> lone "accept" statement, as well as rebooting.
>
> sudo nft list ruleset # returns nothing
>
> Still getting
> nftables.conf:3:1-14: Error: Could not process rule: Device or 
> resource busy
> flush ruleset
> ^^^^^^^^^^^^^^
>
> Have I just been staring at this for too long and am missing something 
> obvious?
>
> Jeff
>
>
> P.S. Please forgive the horrendous names, not much you can do with 16 
> characters
>
>
> $ cat nftables.conf
> #!/usr/sbin/nft -f
>
> flush ruleset
>
> table inet global {
>
>     chain prer_r {
>         type filter hook prerouting priority -175
>         policy drop
>
>         accept
>
>     } # chain prer_r
>
>     chain prer_r {
>         type filter hook prerouting priority -50
>         policy drop
>
>         accept

