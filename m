From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: DNS - Firewall - Gateway - and services ...
Date: Sat, 11 Jan 2003 03:53:01 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200301110353.01397.netfilter@newkirk.us>
References: <F31gK47OMbrwnBIaUD00002474b@hotmail.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F31gK47OMbrwnBIaUD00002474b@hotmail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: lawrence Of Arabia <zo2000@hotmail.com>, netfilter@lists.netfilter.org

On Saturday 11 January 2003 03:10 am, lawrence Of Arabia wrote:

I am running quite a similar arrangement, everything on a RedHat 7.3 box.=
 =20
I'm off to bed at the moment, but sometime late tomorrow I will email=20
you (off the list) regarding this.  Apart from the firewalling script=20
itself, what you are interested in doesn't belong here anyway.

If you want to send me an email privately of what services you want to=20
run, and what zoneedit is currently handling,  I can perhaps help out=20
some.  Otherwise (unless you ask me not to) I'll write up a brief=20
explanation of what I have set up and how it works.

BTW, I'm not familiar with zoneedit.com's services, I use others, but the=
=20
net effect is the same, so my experiences should still prove helpful.

j

> Hey everyone,
>
> i have a slight problem. there is none yet, i just dont have a
> solution.
>
> i have a dsl connection with dynamic IP. i run an apache box 24/7 and
> mail. i have a domain. up to here it has been easy, all from zoneedit.
> but this does not offer me great security. so i look around and
> thought i would go with the linux box as a gateway/firewall option.
> because it seems the most secure, scalable solution. For someone not
> running services, this is rather simple. but since i will be offering
> services, it gets a little more complicated.
>
> in a perfect world, i would have one public ip, and a NAT lan ...
> all services would be run on nat and access the net from the linux
> gateway. up to here, its simple, port forwarding.
>
> BUT! i do not want to use port forwarding, one reason of many, i
> cannot add to many services of the same kind, AND it forces me to deal
> extensively with zoneedit. (i want total control, it would be PERFECT
> if zoneedit was out of the story) ...
>
> i also want hostname recognition, every box will have ftp and ssh
> anyway (plus http or pop3/imap depending) ...
>
> i want to be able to call john smith who works for bell south to talk
> to him about my credit status or his kids! not just ask the accounting
> department.
>
> well ...
>
> i have been looking into this for a while, and feel closer to it. I
> KNOW THERES A WAY! i just dont know it!
>
> i would greatly appreciate comments, suggestions, if you have a
> solution, it being with iptables only, an dns server, a proxy or all
> of those ... i dont care, i wanna hear it!
>
> thanks people ...
>
> lawrence
>
>
>
>
> _________________________________________________________________
> MSN 8 with e-mail virus protection service: 2 months FREE*
> http://join.msn.com/?page=3Dfeatures/virus


