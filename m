From: Giles Coochey <giles@coochey.net>
Subject: Re: Masquerade UDP doesn't work
Date: Thu, 09 Feb 2012 11:05:12 +0000
Message-ID: <8109c5112723b9bd7a946951e69bffd2@www.coochey.net>
References: <29809830.2793.1328765747294.JavaMail.root@ixer.mx>
Reply-To: <giles@coochey.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <29809830.2793.1328765747294.JavaMail.root@ixer.mx>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ehuerta@ixer.mx
Cc: netfilter@vger.kernel.org

On 2012-02-09 05:35, Enrique Huerta de la Fuente wrote:
> Hello,
>
> Masquerade do not work at a UDP port, but if it works at a TCP port.
>
> (works) iptables -t nat -I POSTROUTING -m tcp -p tcp --dport 22 -o
> ppp0 -j MASQUERADE
> (not working) iptables -t nat -I POSTROUTING -m udp -p udp --dport
> 1195 -o ppp0 -j MASQUERADE
>

The "-m udp" confuses me. Do you really need to specify that module, 
try it without the -m option for UDP, I don't tend to use it for TCP 
either, but if it's not broken, don't fix it...

-- 
Message sent via my webmail account.
