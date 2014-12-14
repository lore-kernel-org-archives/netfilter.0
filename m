From: John Miller <johnmill@brandeis.edu>
Subject: Re: iptables DNAT algorithm -- another way?
Date: Sat, 13 Dec 2014 22:30:44 -0500
Message-ID: <CAGYMsbuidKXu-H55e8+JGqiVktEQM-GcObtOdTpkYVERM4rH9A@mail.gmail.com>
References: <548B8069.4020802@brandeis.edu>
	<201412121950.59768.neal.p.murphy@alum.wpi.edu>
	<548C0500.8030408@plouf.fr.eu.org>
	<CAGYMsbuauVpzw+sF8mfKxwT=NMVt3OgBEw7DvF-T=ewKk=doYQ@mail.gmail.com>
	<548CAFE5.3090308@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <548CAFE5.3090308@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: 
Cc: netfilter@vger.kernel.org

On Sat, Dec 13, 2014 at 4:30 PM, Pascal Hambourg <pascal@plouf.fr.eu.or=
g> wrote:
> John Miller a =C3=A9crit :
>>
>> iptables -t mangle -A OUTPUT -d 172.16.0.0/16 -j NETMAP --to 129.64.=
0.0/16
>
> The NETMAP target is valid only in the nat table.

Just had a look at the iptables-extensions(8) manpage.  You're
definitely correct:

NETMAP
       This  target  allows you to statically map a whole network of ad=
dresses
       onto another network of addresses.  It can only be used from  ru=
les  in
       the nat table.

Looks like the Frozentux tutorial
(https://www.frozentux.net/iptables-tutorial/iptables-tutorial.html#NET=
MAPTARGET)
made a typo in its example.  The nat table definitely makes more
sense; the mangle table wouldn't keep track of TCP streams, which is
the whole point.

I thank you for your correction and help: because of it, I've learned
more about iptables than I had in quite a while.

John
