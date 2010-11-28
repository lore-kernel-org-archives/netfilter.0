From: "Secure-SIP-Server" <info@secure-sip-server.net>
Subject: Denial-of-Service attack on UDP-port 5060 (SIP/VoIP)
Date: Sun, 28 Nov 2010 17:02:56 +0100
Message-ID: <C426DC428D95484BB7DF53F6DA1B34DB@gericomfx5600>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"; format="flowed	reply-type=original"
To: netfilter@vger.kernel.org

Hi,

I'm suffering on a Denial-of-Service attack on my SIP(VoIP) UDP port 50=
60,=20
getting more then 70 REGISTER requests per second since yesterday. All=20
comming from the Japanese IP 59.146.75.111:5088.

=46irst I wrote into my iptable:
=2E...
/sbin/iptables -P INPUT DROP
/sbin/iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
=2E...
/sbin/iptables -A INPUT -p udp --dport 5060 -s 59.146.75.111 -j REJECT
=2E...

but it didn't work.
1st Question:
Why??

Then I wrote:
=2E...
/sbin/iptables -P INPUT DROP
/sbin/iptables -A INPUT -m state --state ESTABLISHED -j ACCEPT
/sbin/iptables -A INPUT -p udp --dport 5060 -s 59.146.75.111 -j REJECT
/sbin/iptables -A INPUT -m state --state RELATED -j ACCEPT
=2E...

Nothing changed, still receiving this REGISTER requests on my server.
Then I did:
=2E...
/sbin/iptables -P INPUT DROP
/sbin/iptables -A INPUT -p udp --dport 5060 -s 59.146.75.111 -j REJECT
/sbin/iptables -A INPUT -m state --state ESTABLISHED -j ACCEPT
/sbin/iptables -A INPUT -m state --state RELATED -j ACCEPT
=2E...

This worked! All requests from that IP are rejected, all others reach m=
y=20
server as ever.

/sbin/iptables -L --line-numbers -v -n
shows me an rapidly increasing number of packages and bytes rejected by=
 the=20
first statement.

Now my 2nd question:
How can this requests (UDP) be from a ESTABLISHED connection??? They pa=
ssed=20
the firewall in the first two examples and therefore they must be=20
ESTABLISHED!?!

3rd question:
Is there a way to tell iptables to lock only a specific IP:PORT for a w=
hile=20
if this IP transmits more then 50 requests per second? If so, how?

Thanks and regards

Detlef Pilzecker
Weitlahnerstra=DFe 8
D - 83209 Prien am Chiemsee=20

