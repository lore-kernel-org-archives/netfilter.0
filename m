From: "louie miranda" <lmiranda@chikka.com>
Subject: Re: Forwarding problem, :( port redirection!
Date: Wed, 26 Feb 2003 18:02:40 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <02ab01c2dd7e$3489f770$0b00000a@nocpc3>
References: <GNECLCLHIFNNAHMOKHDPEEEODFAA.list@davey.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: John Davey <list@davey.net.au>, netfilter@lists.samba.org

Still not working..

Does anyone have a step by step howto on this?


--
thanks,
louie miranda

----- Original Message -----
From: "John Davey" <list@davey.net.au>
To: "louie miranda" <lmiranda@chikka.com>; <netfilter@lists.samba.org>
Cc: "Rasmus B=F8g Hansen" <moffelist@amagerkollegiet.dk>
Sent: Monday, February 24, 2003 9:23 PM
Subject: RE: Forwarding problem, :( port redirection!


> Your FORWARD rule is still wrong. It's already been DNAT'd so forward it
> to the IP thats on the box..ie 10.0.0.11
>
> panic:/# iptables -A FORWARD -i eth0 -o eth1 -p tcp -d \
> 10.0.0.11 --dport 21 -j ACCEPT
>
> Also your firewall is on panic so NONE of the rules you have listed are
even
> used. When you telnet from panic to 10.0.0.11.
>
> http://www.netfilter.org/documentation/index.html#HOWTO
>
>
>
> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org]On Behalf Of louie miranda
> Sent: Monday, 24 February 2003 7:02 PM
> To: netfilter@lists.samba.org
> Cc: Rasmus B=F8g Hansen
> Subject: Re: Forwarding problem, :( port redirection!
>
>
> panic:/# iptables -t nat -A PREROUTING -i eth0 -p tcp -d
> 203.190.72.108 --dport 21 -j DNAT --to 10.0.0.11:21
> panic:/# iptables -A FORWARD -i eth0 -o eth1 -p tcp -d
> 203.190.72.108 --dport 21 -j ACCEPT
> panic:/# telnet 203.190.72.108 21
> Trying 203.190.72.108...
> telnet: Unable to connect to remote host: Connection refused
> panic:/# telnet 10.0.0.11 21
> Trying 10.0.0.11...
> Connected to 10.0.0.11.
> Escape character is '^]'.
> 220 Dynu FTP Server (Version 1.13)
> ^]
> telnet> q
> Connection closed.
> panic:/# telnet 203.190.72.108 21
> Trying 203.190.72.108...
> telnet: Unable to connect to remote host: Connection refused
> panic:/#
>
> Still no success! :(
>
>
>
> --
> thanks,
> louie miranda
>
>
> ----- Original Message -----
> From: "Rasmus B=F8g Hansen" <moffelist@amagerkollegiet.dk>
> To: "louie miranda" <lmiranda@chikka.com>
> Cc: <netfilter@lists.samba.org>
> Sent: Monday, February 24, 2003 4:25 PM
> Subject: Re: Forwarding problem, :( port redirection!
>
>
> On Mon, 24 Feb 2003, louie miranda wrote:
>
> > Im trying just to forward simple ftp, 21 request into my internal
machine.
> > Im typing this but it does not work..
>
> > iptables -t nat -A PREROUTING -i eth0 -p tcp -d 10.0.0.11 --dport 21 -j
> > DNAT --to 203.190.72.108:21
> > iptables -A FORWARD -i eth0 -o eth1 -p tcp -d 203.190.72.108 --dport
21 -j
> > ACCEPT
>
> Are you *sure* of those IP's? 10.0.0.11 is a private IP and is unusable
> on the internet - however your rules state that 10.0.0.11 is located on
> the internet. I'm pretty sure, you need to exchange the global and local
> IP.
>
> /Rasmus
>
> --
> -- [ Rasmus "M=F8ffe" B=F8g Hansen ] ------------------------------------=
---
> Drink wet cement: Get Stoned.
> ----------------------------------[ moffe at amagerkollegiet dot dk ] --
>
>
>
>
>
>


