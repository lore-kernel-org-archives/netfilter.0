From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: iptables and mtu
Date: Mon, 10 Jun 2002 20:41:27 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206101941.g5AJfUA01453@Networker.rockstone.co.uk>
References: <20020610192851.52895.qmail@web9903.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020610192851.52895.qmail@web9903.mail.yahoo.com>
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
To: netfilter@lists.samba.org

On Monday 10 June 2002 8:28 pm, "J=F6rgen" Danielsson wrote:

> I'm using an adsl connection and have linux as
> router/firewall. The problem is that adsl uses a mtu
> that is 1492, standard for ethernet is 1500.
>
> Is there a way to make iptables "convert" packages to
> the masqed net to a mtu of 1500 instead ?

What is the MTU on the firewall interface connected to the ADSL ?

I would have thought that if this was set to 1492, then things should sort =

themselves out quite transparently...

> Right now i have to manually change the mtu to 1490 on
> the computers behind the linux router to be able to
> access all websites.

You *are* allowing the appropriate ICMP messages into / out of / through yo=
ur=20
firewall box, aren't you ?

=20

Antony.

