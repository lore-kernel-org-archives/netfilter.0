From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: iptables forwarding packets on the same interface
Date: Fri, 19 Nov 2010 00:24:12 +0100
Message-ID: <20101119002412.45660216@catus>
References: <AANLkTimDgcNAfVZa6tUpQZFMb-jRXbzsiaDSnCZmqTTe@mail.gmail.com>
	<20101118215623.6cd0bf50@catus>
	<AANLkTinGnb0B74tuXacopfgvdDgGajywGP7zmVRH394_@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTinGnb0B74tuXacopfgvdDgGajywGP7zmVRH394_@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Daniel Scott <djscott@MIT.EDU>
Cc: netfilter@vger.kernel.org

Hi,

> -A FORWARD -s 192.168.1.0/24 -d 192.168.10.0/24 -i eth1 -o eth1 -m
> state --state NEW -j ACCEPT 
>-A FORWARD -s 192.168.10.0/24 -d 192.168.1.0/24 -i eth1 -o eth1 -m
>state --state NEW -j ACCEPT

I think you're missing forwarding of ESTABLISHED,RELATED between
192.168.1.0/24 and 192.168.10.0/24. Try to change above rules to:

-A FORWARD -s 192.168.1.0/24 -d 192.168.10.0/24 -i eth1 -o eth1 -j ACCEPT 
-A FORWARD -s 192.168.10.0/24 -d 192.168.1.0/24 -i eth1 -o eth1 -j ACCEPT

Best regards,
Marek
