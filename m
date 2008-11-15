From: sebastien <sebastien@sriliam.webhop.net>
Subject: Subscribing and question on extern exec prog with iptables.
Date: Sat, 15 Nov 2008 07:31:31 +0100
Message-ID: <1226730691.4215.34.camel@lya14-2-82-232-125-204.fbx.proxad.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hi all,

=46irst of all, I try to subscribe to the netfilter mailing list with n=
o
success : 3 times with a webmail address 1 with a exim mail address (th=
e
one desserving this mail).

How subscribe to the mailing list ?

Second, why do not write my question here ?

I have a web server which send "wrong" html to the client and I would
like to be able to correct this "wrong" html by reforming packets and
send them an the network.

The problem is that iptables or ip6tables won't be natively able to sen=
d
me the original destination client's address and port of server's
answer : am I wrong ? iptables and ip6tables will form a new address an=
d
port destination and that'all.

If so, I need a way to send the exact port of the original packet to th=
e
corrective program : the one which will desserve transparently the
client called by ? ... iptables or ip6tables.



Legacy, with "wrong" html :

----------          --------------
+ Client +   <--->  + Web Server +
----------          --------------


Result, hopefully wanted, after transformation :

----------      --------------     ----------------------     ---------=
-
+ Client + -->  + Web Server + --> + corrective program + --> + Client =
+
----------      --------------     ----------------------     ---------=
-


As you can see, I have no way to see packet from Client to Server. I
suppose that the only "strange" packet from Client is a change port
asking which the server answer (tcp option). Corrective program will no=
t
touch thoses packets : it simply "re-arrange" packet at application
level to the client and deliver it to the good port (the one of the
server originaly send to).

Does iptables and ip6tables modules can do this ? Call a extern program
with the full packet content of the server.

Thanks by advance, best regards.
See ya.
S=C3=A9bastien

Nota : one can notice iptables and ip6tables mention. The production
server is on Ipv4 and I only can reproduce an Ipv6 laboratory. So, I
need a way to make the job with both protocols.
