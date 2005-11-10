From: <luisccmail-netfilter@yahoo.com.br>
Subject: Help on port forwarding + Origin and Destination IP rewriting...
Date: Thu, 10 Nov 2005 14:14:58 +0000 (GMT)
Message-ID: <20051110141458.87269.qmail@web60024.mail.yahoo.com>
Reply-To: luisccmail-netfilter@yahoo.com.br
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

  Dear Netfilter list people

  I'm trying to build some netfilter rules so my linux box can forward a te=
lnet connection made on
a machine on my network (lets say "Box-A") to another machine in my network=
 (lets say "Box-B").

  Box-A is just another server in the network, but Box-B is special: its a =
firewalled access
gateway to a client's network, and it is setted up in a way that only telne=
t connections from
Box-A are accepted (that's my client's security policy, and I don't have an=
y chances on change
this).

  On the other hand, many folks from my company need access to that client =
network, and I don't
want everybuddy needing access to Box-B to connect on Box-A (thats local se=
curity policy).
=20
 So I tried to use two simple rules that could allow me to forward the conn=
ections:

  ###################################
  # /etc/hosts file
  # This aliases are in /etc/hosts format, to easy comprehension
  box-a.local 192.168.0.6
  box-b.local 192.168.0.34
  # EOF #############################

  ###################################
  # Redirection script file
  # This should re-write incomming connections before routing
  # after routing process, they should go to the right host.
  iptables -t nat -A PREROUTING -p tcp \
           -d box-a.local --destination-port 2200 \
           --jump DNAT --to-destination box-b.local:2222

  # This should re-write outgoing connections after routing,
  # so they appear to originate from the Box-A host.
  iptables -t nat -A POSTROUTING -p tcp \
           -d box-b.local --destination-port 2222 \
           --jump SNAT --to-source box-a.local
  # EOF #############################

  Oh, well, now begin my problem: this doesn't work, and I don't have any i=
deas to correct the
problem. I even know what is broken, sadly... :-/ Please help me.

  Thank you all very much for desining, maintaining and supporting such a n=
ice tool like
Netfilter.=20

  Best regards.


=09



=09
	=09
_______________________________________________________=20
Yahoo! Acesso Gr=E1tis: Internet r=E1pida e gr=E1tis.=20
Instale o discador agora!
http://br.acesso.yahoo.com/


