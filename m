From: =?iso-8859-1?q?Giancarlo=20Boaron?= <gboaron@yahoo.com.br>
Subject: Problems with connection
Date: Mon, 13 Sep 2004 18:01:15 -0300 (ART)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040913210115.54459.qmail@web50202.mail.yahoo.com>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hello!

I have a client in my LAN that must access a server on
the Internet listening for requests on 3456 port.

Using the FORWARD chain (default police =3D DROP) I have
the following lines:

iptables -A FORWARD -m state ESTABLISHED,RELATED -j
ACCEPT

<... my rules ...>

iptables -A FORWARD -d X.Y.0.0/16 -p tcp --dport 3456
-j ACCEPT

(the IP_server is inside the X.Y.0.0/16 IP range)

However, my client application can access the server
on Internet but it can't send the desired data, since
the application returns some error messages.

I logged the traffic with "tcpdump -i eth1 src or dst
IP_client" (where eth1 is my LAN interface) and that
was the result:

11:22:09.252058 IP_client.2611 > IP_server.3456: S
9014409:9014409(0) win 8192 <mss 1460,nop,nop,sackOK>
(DF)
11:22:09.327363 IP_server.3456 > IP_client.2611: S
1138155720:1138155720(0) ack 9014410 win 65535 <mss
1460,nop,nop,sackOK> (DF)
11:22:09.327650 IP_client.2611 > IP_server.3456: . ack
1 win 8760 (DF)
11:22:09.410734 IP_server.3456 > IP_client.2611: P
1:140(139) ack 1 win 65535 (DF)
11:22:09.559431 IP_client.2611 > IP_server.3456: . ack
140 win 8621 (DF)
11:22:09.565804 IP_client.2611 > IP_server.3456: P
1:140(139) ack 140 win 8621 (DF)
11:22:09.656090 IP_server.3456 > IP_client.2611: P
140:154(14) ack 140 win 65396 (DF)
11:22:09.656516 IP_client.2611 > IP_server.3456: F
140:140(0) ack 154 win 8607 (DF)
11:22:09.737150 IP_server.3456 > IP_client.2611: . ack
141 win 65396 (DF)
11:22:09.737357 IP_server.3456 > IP_client.2611: F
154:154(0) ack 141 win 65396 (DF)
11:22:09.737471 IP_client.2611 > IP_server.3456: . ack
155 win 8607 (DF)

It means that my client can reach the server, a
connection is established, they send some data but
they close the connection very fast.
Besides, it repeats this traffic about 10 times, with
the client application changing its source port
number, and then it returns the error messages.

Does it mean that the server is trying to start a new
back connection to the client and my DROP policy is
applied? (since I don't permit new incoming
connections?)

I read the application documents and it only says that
I must allow outgoing traffic to and from
X.Y.0.0/16:3456 using TCP protocol.

So, what do you think about some HELP!!!!!!!! :)

See ya=20
Giancarlo


=09
=09
	=09
_______________________________________________________
Yahoo! Messenger 6.0 - jogos, emoticons sonoros e muita divers=E3o. Insta=
le agora!
http://br.download.yahoo.com/messenger/

