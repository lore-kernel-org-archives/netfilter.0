From: =?unknown-8bit?q?J=F6rgen?= Danielsson <jorgen_d@yahoo.com>
Subject: Re: Masquerading problems (fix)
Date: Wed, 3 Jul 2002 09:02:29 -0700 (PDT)
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020703160229.23991.qmail@web9902.mail.yahoo.com>
References: <200207030613.59855.davidgr@interlap.com.ar>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200207030613.59855.davidgr@interlap.com.ar>
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
Content-Transfer-Encoding: quoted-printable
To: davidgr@interlap.com.ar, netfilter@lists.samba.org

This is how i have it

### Allow masquerading for internal boxes ###
iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
echo 1 > /proc/sys/net/ipv4/ip_forward

### Make sure mtu is never changed=20
iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN -j
TCPMSS --clamp-mss-to-pmtu


Had the same problem as you earlier, that fixed the
prob.

/J=F6rgen

--- David Gaston Rodriguez <davidgr@interlap.com.ar>
wrote:
> Sorry! i wrote bad. here is the correction:
> Hi!, i am new in the list, i am from argentina, this
> is mi problem:
> I have a small LAN with a server doing masquerading,
> I used the kernel 2.2.20 and
> did not have any problem, now i decided to use the
> kernel 2.4.18, i set iptables=20
> to make the masquerading, but now there are web
> pages which i can NOT enter from=20
> workstations, like for example www.mixmail.com or
> www.yahoo.com, and from the server
> i can enter to this pages. I using 2 interfaces,
> eth0: external, eth1: internal, the
> external interface is connect to ADSL Modem (PPPoE).
> Some idea on as could be mi problem?
> Thanks!!
>=20
>=20


__________________________________________________
Do You Yahoo!?
Sign up for SBC Yahoo! Dial - First Month Free
http://sbc.yahoo.com

