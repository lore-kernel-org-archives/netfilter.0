From: "Kevin Saenz" <ksaenz@citistreet.com.au>
Subject: RE: Newbie Question -forcing to pass in squid
Date: Mon, 14 Oct 2002 14:46:14 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <771DD65729F96D41B132C6189EE644553D19CD@sydexch1>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: =?iso-8859-1?Q?Fl=E1vio_Brito?= <flavio@gral.com.br>, netfilter@lists.netfilter.org

I guess there are a few things I can see here, there are a number of =
solutions for this problem.

first you deny web access to all but one machine, through the firewall.
This will stop users from cheating by removing the proxy settings.

second, you could also install squid on your firewall and allow the =
users through that

-----Original Message-----
From: Fl=E1vio Brito [mailto:flavio@gral.com.br]
Sent: Monday, October 14, 2002 12:03 PM
To: netfilter@lists.netfilter.org
Subject: Newbie Question -forcing to pass in squid



Dear Friends

I have two machines, and I trying to force all port 80 traffic to pass
in SQUID 3128. But when people unset proxy in browser, they bypass SQUID
to the Internet . I cannot put transparent proxy, because SQUID is
authenticating.

Suggestions?

Thanks=20

Fl=E1vio =20
----------------------------------------------------------------------

FW
|-------------------------------|
|	eth0 - 200.1.2.3	|----------------------> [INTERNET]
|	eth1 - 192.168.1.1	|
|-------------------------------|
		|
		|
		SQUID
		|
|-------------------------------|
|	eth0 - 192.168.1.33	|
|-------------------------------|
		|
		|
	INTERNAL_LAN
		|
|-------------------------------|
|	192.168.1.0/24		|
|-------------------------------|


My Example


iptables -F
iptables -A INPUT -i lo -p all -j ACCEPT                    #   - Allow
self access by loopback interface
iptables -A OUTPUT -o lo -p all -j ACCEPT
iptables -A INPUT -i eth0 -m state --state ESTABLISHED,RELATED -j ACCEPT
#- Accept established connections
iptables -A FORWARD -o eth0 -j ACCEPT
iptables -t nat -A POSTROUTING -s $INTERNAL_NET -o $EXT -j MASQUERADE
iptables -t nat -A PREROUTING -p tcp --dport 80 -j ACCEPT  -d
192.168.1.33
iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 80 -j REDIRECT
--to-port 3128





