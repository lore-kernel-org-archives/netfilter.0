From: Optimum Wireless Services <wilson@optimumwireless.com>
Subject: Re: Filter IP to use two ISP and make it failsafe
Date: Sun, 06 Feb 2011 19:48:55 -0400
Message-ID: <1297036135.3928.37.camel@debian-laptop.OptimumWireless>
References: <AANLkTi=W23VuvLzFzxXQXpxAwD6JzQjWBuzUFTXxhPpG@mail.gmail.com>
Reply-To: wilson@optimumwireless.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=W23VuvLzFzxXQXpxAwD6JzQjWBuzUFTXxhPpG@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Juan Araya Bravo <juan.araya@gmail.com>
Cc: netfilter@vger.kernel.org

Hola Juan.

Buscan en google un script que alguien creo, no recuerdo el nombre de la
persona, que se llama gwping. Lo use por un tiempo y funciona pero, si
tienes usuarios que usan el msn messenger entonces tendras problemas. El
messenger se desconecta frecuentemente cuando usas ese script. Debes
optar por un load balancer.

English:

Search google for a script named gwping. I've used it in the past and it
works ok except that the msn messenger tend to disconnect frequently
when the script is used. I had to buy a load balancer in order to avoid
that.

On Sun, 2011-02-06 at 20:40 -0300, Juan Araya Bravo wrote:
> Hi, this is my first message to the list and first of all i apologise
> for my very bad English.
> 
> The thing is i have one machine with three NIC cards acting as a
> gateway. One of the NIC (eth0) is connected to LAN and the others are
> connected to two different ISP (eth1 = ISP A and eth2= ISP B).
> 
> I was looking for a rule that let me determine specifically which IP
> can use the ISP A and let all the others to use the ISP B connection.
> 
> Also i need that when one of the connections fails all the traffic
> will be directed by the one which works.
> 
> Please help me with a link or something i can read to learn how to do it.
> 
> Thanks in advance.
> 
> ---
> Saludos, Juan Araya Bravo.
> juan.araya@gmail.com
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

