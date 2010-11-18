From: Daniel Scott <djscott@MIT.EDU>
Subject: Re: iptables forwarding packets on the same interface
Date: Thu, 18 Nov 2010 18:39:30 -0500
Message-ID: <AANLkTimK+e-gx1kZW2At0Of_P8x6v=TBnM-7jfT_M2uA@mail.gmail.com>
References: <AANLkTimDgcNAfVZa6tUpQZFMb-jRXbzsiaDSnCZmqTTe@mail.gmail.com>
 <20101118215623.6cd0bf50@catus> <AANLkTinGnb0B74tuXacopfgvdDgGajywGP7zmVRH394_@mail.gmail.com>
 <20101119002412.45660216@catus>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20101119002412.45660216@catus>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marek Kierdelewicz <marek@piasta.pl>
Cc: netfilter@vger.kernel.org

Hi,

On Thu, Nov 18, 2010 at 18:24, Marek Kierdelewicz <marek@piasta.pl> wrote:
>> -A FORWARD -s 192.168.1.0/24 -d 192.168.10.0/24 -i eth1 -o eth1 -m
>> state --state NEW -j ACCEPT
>>-A FORWARD -s 192.168.10.0/24 -d 192.168.1.0/24 -i eth1 -o eth1 -m
>>state --state NEW -j ACCEPT
>
> I think you're missing forwarding of ESTABLISHED,RELATED between
> 192.168.1.0/24 and 192.168.10.0/24. Try to change above rules to:
>
> -A FORWARD -s 192.168.1.0/24 -d 192.168.10.0/24 -i eth1 -o eth1 -j ACCEPT
> -A FORWARD -s 192.168.10.0/24 -d 192.168.1.0/24 -i eth1 -o eth1 -j ACCEPT

Excellent. That seems to have fixed it, thanks.

Dan
