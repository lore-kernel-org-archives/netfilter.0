From: PayalR <payal@hotpop.com>
Subject: are these enough now?
Date: Fri, 4 Oct 2002 12:47:04 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <29706.0698424049$1033719511@news.gmane.org>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello,
I am providing webspace, email services etc. to few institutes. I have=20
drafted a firewall policy for my server. Can you please check if it is ri=
ght=20
and tell me if I have gone wrong anywhere? I have formulated suggestion b=
y=20
various list-members in past.

The script contains,

iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

iptables -A INPUT -i eth0 -p $proto --dport $port -j ACCEPT
To keep the script short in this e-mail I am replacing $proto with tcp an=
d=20
udp in each line of the actual script.
$port is replaced by,
21, 22, 23, 25, 53, 80, 110,143, 161, 162, 199, 953, ,993,3306, 8007, 800=
9
We are SNNP client, so I think I need 161 and 162 open, right?
Also, nmap shows that 2002/udp globe is oopen. Shall I close it?

So for e.g each line will actually look like this in the script,
iptables -A INPUT -i eth0 -p tcp --dport 25 -j ACCEPT
iptables -A INPUT -i eth0 -p udp --dport 25 -j ACCEPT

I understand that ACCEPT for udp for 21, 22, 23, 80, 3306 is not required=
=2E I=20
just wanted to confirm this from the list.

Also, I want to know if I should put the same rules for OUTPUT? Shall I j=
ust=20
copy the above rules and replace INPUT with OUTPUT in them?
Maciej had suggested this before,
iptables -P OUTPUT ACCEPT
iptables -A OUTPUT -s ! <your.real.ip> -j DROP
IS this enough for my present senario?

Also, do I set FORWARD to DROP?

I know that there must be a elegant way of doing this, but it is just a s=
tart=20
for me. For now, I want to get the whole thing working properly. I am los=
ing=20
bandwidth due to some stupid programs from inside and outside.

Please tell me if I am making a mistake anywhere. I will be remotely logi=
n in=20
the server to do this? I certainly don't want ssh to stop :)=20

Thanks a lot in advance and eagerly waiting for the replies (especially a=
bout=20
the OUTPUT part, of which I have some reservations which i will discuss=20
later).

Bye.
-Payal

