From: "Schrader, Jochen" <joSchrader@TundO.de>
Subject: AW: Weird behavior on simple -j MASQUERADE
Date: Wed, 19 Jun 2002 16:02:26 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <3D5DCAD22EE2D41194B800D0B7A9B841289D6D@EXCHANGE>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: 'Valentin LAB' <vaab@wanadoo.fr>, netfilter@lists.samba.org

Hallo!

It could be, that you don't really have a netfilter problem. Some DSL
Providers tell your PPP the wrong MTU. This leads to the same problems =
you
described. An upgrade of your pppd should solve the problems. Just =
check the
version of your pppd - should be 2.4.1-170 or higher.

OK. This is only an asumption, that the providers in France have the =
same
problems as in Germany.

Bye,
Jochen Schrader

-----Urspr=FCngliche Nachricht-----
Von: Valentin LAB [mailto:vaab@wanadoo.fr]=20
Gesendet: Freitag, 24. Mai 2002 09:02
An: netfilter@lists.samba.org
Betreff: Weird behavior on simple -j MASQUERADE


Hi

    I made a complex firewall script that had very strange problems. I=20
took plenty of time trying to find out what was wrong until I found =
that=20
even this simple script (that is said to be working in NAT-HOWTO on=20
netfilter website) had the same problems :


# Begin script

iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE

# Turn on IP forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward

# End script


    These are the strange behavior :

- Can access some http website (www.lemonde.fr www.google.com ...)
- Can't access some http website (www.yahoo.fr www.meteo-france.fr ..)
- Some apps that were working under a firewall under ipchains (the=20
roaring penguin ADSL firewall script) do not work any more.

    I tried a simple "telnet www.yahoo.fr 80" to see what was wrong,=20
connection was accepted, I typed "GET" and i received the HTML code to=20
the ending "</html>", but it didn't close the connection as they did =
for=20
the working website.
    A friend told me that it could be the website with cookies that are =

involved in the problem.

    My config :

Firewall :

    Processor : 486 DX 33 (is it enough ?)
    Connection type : ADSL (France telecom, modem ECI) on ppp0
    Kernel : Linux 2.4.18 + patch-o-matic 1.2.6a
    IPtable ver : 1.2.6a
    LAN device : NE2000 (10BASET) compatible device on eth0

LAN computer :

    Linux or win2000, with bigger config than Firewall connected on 100 =

Mbits network device.
    DNS are those of the provider or an internal DNS. (that doesn't=20
change anything to my problems)

I would appreciate a quick help. I'm quite new to firewall and =
iptables, so
even if you haven't the solution, i'll be glad to learn more. Do not=20
hesitate to answers if you have something in mind.

                         Valentin LAB
                         mail : vaab at wanadoo.fr




