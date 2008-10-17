From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: MAC Address masking/NAT
Date: Fri, 17 Oct 2008 12:15:03 -0500
Message-ID: <48F8C817.1090407@riverviewtech.net>
References: <1460c7de0810162313t28b5cd7ete6dda27e534ae55d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1460c7de0810162313t28b5cd7ete6dda27e534ae55d@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 10/17/08 01:13, Timothy Toole wrote:
> What I'd like to do is use iptables or ebtables to.... change the MAC 
> address of Host B as packets traverse the bridge. Host A will only see 
> the "changed" MAC address, not the actual one of Host B.
> 
> Here's a lame ascii art diagram:
> 
>               ____________________
>              |                    |
>              |        br0         |
>              |                    |
>              | eth0.1      eth0.2 |
>              |__/______________\__|
>                /                \
>               /                  \ <--- Translate MAC to
>              /                    \     11:11:11:22:22:22
>             /                      \
>            /                        \
>        ___|___                    ___|___
>       |       |                  |       |
>       |   A   |                  |   B   |
>       |_______|                  |_______|
> MAC: 00:11:22:33:44:55      MAC:55:44:33:22:11:00
> 
> Can this be done? Also, if I don't know the MAC address of either 
> host, can a rule be written as a "catch-all" to change any MAC that's 
> plugged in?


Yes this can.  I think you will be doing most of this work in EBTables 
rather than IPTables.  (IPTables can be made to work with ethernet 
frames, but it is nicer to use EBTables which does it directly.  Proper 
tool for the job and all.)

You can easily use EBTables to (S)NAT the frames ethernet MAC address.

As far as the catch all rule, you would have to use rules to act on the 
/known/ systems and then another ""catch all rule to act on /unknown/ 
systems.

If you need more help, just ask.  Though the EBTables mailing list might 
be a more appropriate and better place to get more help.

> Many Thanks.

*nod*



Grant. . . .
