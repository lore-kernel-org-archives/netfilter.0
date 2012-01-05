From: "Rob Sterenborg (lists)" <lists@sterenborg.info>
Subject: Re: Advice on best way to set up multi-route NAT for lots of IPs
Date: Thu, 05 Jan 2012 09:59:05 +0100
Message-ID: <1325753945.2910.11.camel@ns014530.dcyb.net>
References: <CAKywjPrbjoLhcvPXVYg+8kZ53rPRJ5+dhePx4FB=OkpNjqUGxw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAKywjPrbjoLhcvPXVYg+8kZ53rPRJ5+dhePx4FB=OkpNjqUGxw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Sun, 2012-01-01 at 17:10 +0100, Anton Melser wrote:
> I thought that the best way to go would be to set up NAT using blocks
> in the 10.0.0.0 range. So say for each external IP I would have a /24,
> giving me up to 250-odd potential internal machines. So 10.1.1.1,
> 10.1.1.2, 10.1.1.3, etc. would map to 1.1.1.1; 10.1.2.1, 10.1.2.2,
> 10.1.2.3, etc. would map to 1.1.1.2, etc.
> I have been reading as many sites as I can but I can't work out the
> best way to go forward.

So, I think I understand that you want to SNAT a complete private subnet
to a corresponding public subnet. Is the NETMAP target usable for you,
or am I misunderstanding you completely?
Something like:

iptables -t nat -A POSTROUTING -s ${private_subnet} -j NETMAP --to
${public_subnet}


(http://www.frozentux.net/iptables-tutorial/iptables-tutorial.html#NETMAPTARGET)


--
Rob


