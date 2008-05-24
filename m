From: challado@ibocchi.com.br
Subject: Re: DNAT iptables bug or connection tracking issue?
Date: Sat, 24 May 2008 11:52:40 -0300 (BRT)
Message-ID: <20080524145316.20F0C33E69@www.ibocchi.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: 

Hello, Josh! How are you? :)

=2E.
Typically when you have a LAN behind NAT you use either MASQUERADE or=20
SNAT on all packets going out the public interface.  It doesn't make=20
sense to do so only for certain packets; if you intend to filter traffi=
c=20
to prevent it from going out to the Internet you should do so in the=20
filter table, not by preventing NAT from occurring (which won't=20
necessarily stop the packet from being forwarded.)=20
=2E.

Ok, I understand. Really, is intetional that the packets pass without f=
ilter by the firewall, because I use the tcpdump to discover a "little =
tricks" in the ISP,
because the ISP administrator block intetionally any ports and we have =
problems with these... I need these to make a test. Problably, when I c=
hange my ISP, I'll write
more efficient rules in FORWARD table to block all traffic and only pas=
s the really important traffic.

But, my question is: how the DNAT rule works, in the kernel level, to d=
o the NAT without the MASQUERADE rule?
It's automatic? Because I won't insert the nat rule... I only insert th=
e DNAT rule and all works!
This is the question that I can't understand!

=2E.
The easiest way is probably to create a user-defined chain containing=20
tests for the IP's you want to allow to connect to this port.  If you=20
include a rule to allow ESTABLISHED traffic prior to the jump to=20
vnc_access only the first packet in the connection will need to travers=
e=20
the list of IP's to allow.  Something like this should accomplish the=20
task (along with the NAT rule you listed above):

iptables -N vnc_access
iptables -A vnc_access -s server_a_addr -j ACCEPT
iptables -A vnc_access -s server_b_addr -j ACCEPT
iptables -A vnc_access -s server_c_addr -j ACCEPT
iptables -A vnc_access -j DROP

[... other rules may go here ...]

iptables -A FORWARD -d <internal addr> -p tcp --dport 5900 -j vnc_acces=
s

If you have many IP's you want to add to the vnc_access chain, another=20
way to write that first portion by using a bash for-loop might be as=20
follows:

my_servers=3D"server_a_addr server_b_addr server_c_addr"
iptables -N vnc_access
for ip in $my_servers; do
    iptables -A vnc_access -s $ip -j ACCEPT
done
iptables -A vnc_access -j DROP

=46or many hundreds or thousands of IP's you probably want to look at=20
ipsets for a performance increase when processing that many rules.
=2E.

YEAH! Here, in my city, the people always say:

"If you know, you know. If you won't know, you are nothing..."=20
I work with iptables for long years. I never see this easily and intell=
igent way to write the firewall.
This little example shows the necessity to READ THE FUCK MANUAL, to all=
 of us! If I read with attention and patience the manual, I believe tha=
t I'll find these
way to to the job. Sorry so much. I'm stupid, I agree... :'(

=2E.
=46inally, note that this will only cause packets to be dropped that ar=
e=20
sourced from IP's not in your list.  The standard VNC protocol has=20
inherently weak security and would still be vulnerable to a=20
man-in-the-middle attack potentially exposing your VNC password.  An=20
encrypted tunnel such as a VPN or ssh port-forwarding would secure the=20
VNC data cryptographically.

Yeah, I understand. Really, I have very much vpn's along these server, =
and only few servers in this network can access the server. I know that=
 this protocol is unsecure, and
I only access my machines using vnc under VPN connections.

Thanks a lot for your attention in these question.


------------------------------------------------
Os e-mails enviados por este dom=EDnio s=E3o verificados
por sistemas antiv=EDrus e antispam, visando a prote=E7=E3o
dos usu=E1rios e dos equipamentos de nossa empresa, bem como
para proteger o conte=FAdo e o trabalho de outros que
por ventura venham receber e-mails deste dom=EDnio.

O Grupo Bocchi se reserva no direito de, a qualquer
momento, bloquear ou inutilizar conte=FAdo de e-mails
que venham a ser prejudiciais para o ambiente de trabalho.

Caso este e-mail n=E3o possua conte=FAdo que seja relevante
=E0 sua atividade profissional, ou a do usu=E1rio que a enviou,
por favor, delete-o imediatamente.

O Grupo Bocchi n=E3o se responsabiliza por qualquer dano=20
ou preju=EDzo que a utiliza=E7=E3o indevida deste e-mail
possa causar a voc=EA ou sua empresa.

Em caso de d=FAvidas, favor entrar em contato.
---------------------------------------------


Grupo Irm=E3os Bocchi & Cia Ltda

http://www.ibocchi.com.br

