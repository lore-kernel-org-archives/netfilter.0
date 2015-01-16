From: "U.Mutlu" <for-gmane@mutluit.com>
Subject: Re: IPTABLES + PREROUTING + --set-mark + Ubuntu
Date: Fri, 16 Jan 2015 03:35:03 +0100
Message-ID: <m99tcn$a38$1@ger.gmane.org>
References: <CAJb3rWCR1R0kmY9u+MUUvS7Eo133zcp4u63hBSwno2L+mbXEiw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAJb3rWCR1R0kmY9u+MUUvS7Eo133zcp4u63hBSwno2L+mbXEiw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

The Media Server wrote, On 01/16/2015 03:24 AM:
>> A hint:
>> I think you have to send packets from another host to this host
>> to let the pkts go thru the PREROUTING chain of the mangle table.
>
> I am accessing my port 81 from another computer via my public ISP address..
> http://198.xx.x.xx.x
>
> I can see my connection in tcpdump port 80 trying to get in and the
> MARK packet increasing in iptables -t mangle -nvL. But my connection
> is still timing out.
>
> my goal is to bypass my vpn for a specific port..

Does ssh login to your host from another host work? Ie.:
ssh -p22 username@hostname_or_ip
(change 22 if your ssh-server on your host is operating at an other port)


