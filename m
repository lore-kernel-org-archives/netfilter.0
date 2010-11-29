From: "Secure-SIP-Server" <info@secure-sip-server.net>
Subject: Re: Denial-of-Service attack on UDP-port 5060 (SIP/VoIP)
Date: Mon, 29 Nov 2010 22:38:32 +0100
Message-ID: <90A4182DE3E342C191D86AE9095836B6@gericomfx5600>
References: <C426DC428D95484BB7DF53F6DA1B34DB@gericomfx5600> <4CF2A686.4000309@plouf.fr.eu.org> <72283C9ECA07450499E7F3DDA655791F@gericomfx5600>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"; format="flowed	reply-type=response"
To: netfilter@vger.kernel.org

Thanks to all your thoughts!

I found a solution on how to tell iptables not to see the continuous fl=
ow of=20
SIP-packets as an ESTABLISHED connection. I split
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
into
# iptables -A INPUT -p ! udp -m state --state ESTABLISHED -j ACCEPT
# iptables -A INPUT -m state --state RELATED -j ACCEPT
The ESTABLISHED rule has not to work for UDP, so I excluded it.
I don't know why iptables does not exclude it by default! Someone knows=
???

Now I can put below:
# iptables -A INPUT -p udp --dport 5060 -m recent --name=20
DENIAL_OF_SERVICE --update --seconds 1 --hitcount 20 -j REJECT --reject=
-with=20
icmp-admin-prohibited
# iptables -A INPUT -p udp --dport 5060 -m recent --name=20
DENIAL_OF_SERVICE --set -j ACCEPT

This works for me!!! < I'm happy!!! :-)) >
Now the malicious UDP-packet stream
- always pass the ESTABLISHED rule
- first pass the upper DENIAL_OF_SERVICE rule
- and some packets are accepted by the second DENIAL_OF_SERVICE rule (a=
bout=20
4 or 5 REGISTER requests)
- but then the first DENIAL_OF_SERVICE rule rejects all following spam =
from=20
this IP (requests from other IPs are still accepted!), and it is doing =
this=20
now since hours rejecting several hundred MB traffic received. All othe=
rs=20
with normal traffic can pass to my SIP-Server without problems!
@  marcos: Of course I could also drop the packets instead of rejecting=
=20
them, but I prefer this for the moment with: icmp-admin-prohibited.

----

I also noticed weeks before this attack happened that someone sends me=20
SIP-REGISTER requests, always with the same
User-Agent: friendly-scanner
and I didn't know why. I suppose it was the one that started the attack=
 now,=20
but I don't know because I don't remember the IPs of those first reques=
ts.

In the following links I found some interesting thoughts about this att=
acks=20
and a program to do those too!

blog of SIP-vicious
http://blog.sipvicious.org/

=46AQ to SIP-vicious:
http://code.google.com/p/sipvicious/wiki/FrequentlyAskedQuestions

Storming SIP Security (pdf-discussion on the problem):
http://resources.enablesecurity.com/resources/22_29_storming_sip.pdf


Programs like FAIL2BAN are a good idea to use in addition to the above=20
iptables rules, but fortunately I'm one of two coders writing scripts f=
or a=20
SIP-server in Perl (Net::SIP available at CPAN). I think I will write a=
=20
module to check the incoming SIP messages for recurring possibly malici=
ous=20
intentions, that module should drop identified attacks not rejected bef=
ore=20
by the firewall. I will think about the best way to do this.

Regards

Detlef Pilzecker
Weitlahnerstra=DFe 8
D - 83209 Prien am Chiemsee=20

