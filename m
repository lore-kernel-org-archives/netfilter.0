From: "Carl Holtje ;021;vcsg6;" <cwh0803@cs.rit.edu>
Subject: Re: executing a firewall script!!
Date: Tue, 26 Jul 2005 09:09:30 -0400 (EDT)
Message-ID: <Pine.GSO.4.58.0507260904550.2331@newavalon.cs.rit.edu>
References: <42e607e9.6446401e.6174.46a7SMTPIN_ADDED@mx.gmail.com> 
	<9927912d050726045775275c9b@mail.gmail.com>
	<Pine.GSO.4.58.0507260820580.2331@newavalon.cs.rit.edu>
	<9927912d0507260546168ad046@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <9927912d0507260546168ad046@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Visham Ramsurrun <vishamr2000@gmail.com>
Cc: netfilter@lists.netfilter.org

On Tue, 26 Jul 2005, Visham Ramsurrun wrote:

> Dear Carl,
>
> many thx for the reply...i too thought abt that..but i don't know how
> to do it. Here is my firewall script.
>
> #!/bin/bash
>
> IPT="/sbin/iptables"
>
> $IPT -F
> $IPT -Z
>
> if [ ! -r x ]; then
>
> # No value from previous run - initialize x
>  x=1
> else
>  x=$((`cat x`))
>  echo "Value of x from previous run = $x"
> fi
>
> if [ $x -eq 1 ]; then
>  #FW1 IP: 192.168.10.2
>  $IPT -A FORWARD -i eth0 -o eth0 -s 192.168.10.0/24 -d
> 192.168.10.0/24 -p icmp --icmp-type echo-request -j ACCEPT
>  $IPT -A FORWARD -i eth0 -o eth0 -s 192.168.10.0/24 -d
> 192.168.10.0/24 -p icmp --icmp-type echo-reply -j ACCEPT
>  x=0;
> else
>  #FW2 IP: 192.168.10.3
>  $IPT -A FORWARD -i eth0 -o eth1 -s 192.168.10.0/24 -d
> 192.168.10.0/24 -p icmp --icmp-type echo-request -j ACCEPT
>  $IPT -A FORWARD -i eth0 -o eth1 -s 192.168.10.0/24 -d
> 192.168.10.0/24 -p icmp --icmp-type echo-reply -j ACCEPT
>  x=1;
> fi

So you want FW1 to reply to allow every other ping, and FW2 to allow those
that FW1 ignores?

I'm sure there's a way, but I'm certainly not the authority on load
balancing. Others here I'm sure are more adept at fielding this sort of
question.

HTH.

Carl

- --

"There are 10 types of people in the world: Those who understand binary
and those that don't."

