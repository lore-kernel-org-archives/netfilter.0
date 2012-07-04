From: Amos Jeffries <squid3@treenet.co.nz>
Subject: Re: Bypassing TPROXY bridge intercept.
Date: Wed, 04 Jul 2012 13:00:39 +1200
Message-ID: <de688f5e931e9a9b52ea990a067d03d2@treenet.co.nz>
References: <CANEj=C5LMqrSCbRva_v4iS7yA0CmTtZqfsS_wXBN-sLof4WENw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CANEj=C5LMqrSCbRva_v4iS7yA0CmTtZqfsS_wXBN-sLof4WENw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Daryl Radivojevic <daryl.radivojevic@contentkeeper.com>
Cc: netfilter@vger.kernel.org

On 04.07.2012 12:49, Daryl Radivojevic wrote:
> Hi all,
>
> I have a question about bypassing TProxy intercept.
> I am using http://wiki.squid-cache.org/Features/Tproxy4 for
> transparent interception of SSL traffic. It works fine.
>
> During operation of the tproxy interception, some sites that users
> connect to like banking when discovered are placed in the ebtables
> BROUTE table before the DROP rules (as explained in the Tproxy4
> document) like this:
>
> # ebtables -t broute -L
> -p IPv4 --ip-src 216.52.215.110 --ip-proto tcp --ip-sport 443 -j 
> ACCEPT
> -p IPv4 --ip-dst 216.52.215.110 --ip-proto tcp --ip-dport 443 -j 
> ACCEPT
> etc.
>
> This all works fine.
>
> My concern is when there is a huge amount of such destinations. Is
> there a way
> to put these tproxy bypass exceptions in its own separate table and 
> how?
>
> My other question is how to prevent the existing chain counters being
> zeroed when
> and new destination is added to the chain?
>


I'll leave someone more familiar with ebtables to answer those specific 
questions.

At worst, there is also the option of iptables chains with an ipset 
rule bypassing the -j TPROXY target rule. This just means routing those 
packets instead of bridging. The resulting asymmetrical route path does 
not matter for these packets.

AYJ

