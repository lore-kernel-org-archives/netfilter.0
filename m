From: MAB <mabaeyens@eresmas.com>
Subject: Re: iptables and http port(80)
Date: Tue, 14 Jan 2003 20:14:05 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200301142014.05682.mabaeyens@eresmas.com>
References: <20030114184338.80245.qmail@web14606.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030114184338.80245.qmail@web14606.mail.yahoo.com>
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
To: gonet wireless <gonet_noc@yahoo.com>, netfilter@lists.netfilter.org

El Mar 14 Ene 2003 18:43, gonet wireless escribi=F3:

> I have a link on my web server router linux mandrake 8.2 which shows
> nothing(white page) inside and outside of my network. I add INPUT( -A I=
NPUT
> -i eth1 -p tcp -m tcp --dport 80 -j ACCEPT) rule in my firewall(iptable=
s
> 1.2.5) and now i can browse this link inside my network but none outsid=
e. I
> add OUTPUT( -A OUTPUT -o eth0 -p tcp -m tcp --dport 80 -j ACCEPT)  rule=
 but
> I'm not able to browse this link outside my network. I don't catch what=
's
> wrong

If trouble isn't in yor web server configuration for that link or <direct=
ory>=20
directive, and, as I can see in your rules, you have at least two etherne=
t=20
devices _eth0_ for output packets and _eth1_ in the input rule, you shoul=
d=20
indicate the script that IP address against you want connection packets w=
ill=20
be head for.

If I am in mistake, please correct me.=20

Regards

-Miguel Angel Baeyens

KeyID: 0x6FB7A511 en rediris.es

