From: Arturo Borrero Gonzalez <arturo@netfilter.org>
Subject: Re: No interval possible on Concatenation-Sets
Date: Wed, 16 Sep 2020 15:05:51 +0200
Message-ID: <f293db98-c46e-f7f0-101f-e83992d545c8@netfilter.org>
References: <CAFJ60arM0h53jtvAb6FgzXYeySZ5L7X-_ApU9JbCMRBGi98soA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAFJ60arM0h53jtvAb6FgzXYeySZ5L7X-_ApU9JbCMRBGi98soA@mail.gmail.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Siebzehn <siebzehntausend@gmail.com>
Cc: netfilter@vger.kernel.org

On 2020-09-16 11:05, Siebzehn wrote:
> Hello,
> 
> I'm filtering Address-Ranges and Ports to let them though. However it
> doesn't seem to accept "flags intervals".
> Even the Example on the wiki isn't getting accepted!
> 
> Example from
> https://wiki.nftables.org/wiki-nftables/index.php/Concatenations#Network_addresses
> flush ruleset
> table inet mytable {
>     set myset {
>         type ipv4_addr . ipv4_addr
>         flags interval
>         elements = { 192.168.0.0/16 . 172.16.0.0/25,
>                      10.0.0.0/30 . 192.168.1.0/24,
>         }
>     }
> 
>     chain mychain {
>         ip saddr . ip daddr @myset counter accept
>     }
> }
> 

Make sure you are using:

* nftables >= 0.9.4
* kinux kernel >= 5.6

regards.
