From: John Haxby <john.haxby@oracle.com>
Subject: Re: randomly changing IPs from different subnets (Google Mail)
Date: Wed, 23 Jun 2010 14:52:32 +0100
Message-ID: <4C2211A0.9040007@oracle.com>
References: <B993B335-596D-48D3-9767-F3565C3B1112@gmail.com> <alpine.LSU.2.01.1006222018140.31071@obet.zrqbmnf.qr> <6BE62F49-0B12-4DCB-A421-7D90BDFF0615@gmail.com> <4C210C24.9050605@gmail.com> <DC83A9D5-A181-42B0-9FED-13EB46F2D24A@gmail.com> <4C21F56C.3070603@gmail.com> <alpine.LSU.2.01.1006231354010.14260@obet.zrqbmnf.qr> <4C22105A.70006@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C22105A.70006@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Lars Nooden <lars.curator@gmail.com>
Cc: Jan Engelhardt <jengelh@medozas.de>, netfilter@vger.kernel.org

On 23/06/10 14:47, Lars Nooden wrote:
> Perhaps the manual pages are out of date then.  There appears to be no 
> mention of the option -S in the manual page for iptables v1.2.10 or on 
> this web page:
>
>     http://linux.die.net/man/8/iptables
>
> % iptables -S
> iptables v1.2.10: Unknown arg `-S'
> Try `iptables -h' or 'iptables --help' for more information.
>
> Where are you finding -S ?

% iptables -V
iptables v1.4.7

% iptables -S
-P INPUT ACCEPT
...

% man iptables
...
        -S, --list-rules [chain]
               Print all rules in the selected chain.  If no chain is 
selected,
               all chains are printed like iptables-save. Like every 
other ipt-
               ables  command, it applies to the specified table (filter 
is the
               default).


jch
