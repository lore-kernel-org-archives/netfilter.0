From: MAB <mabaeyens@eresmas.com>
Subject: Re: New chain
Date: Sun, 12 Jan 2003 01:54:06 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200301120154.06722.mabaeyens@eresmas.com>
References: <3E20AFBE.5060404@mattiamartinello.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E20AFBE.5060404@mattiamartinello.com>
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
To: Mattia Martinello <mattia@mattiamartinello.com>, netfilter@lists.netfilter.org

El S=E1b 11 Ene 2003 23:58, Mattia Martinello escribi=F3:

If I am not wrong, chains are read sequentially. If you say first:

> iptables -A LOG_DROP -j DROP

and then you add "new" rules to your firewall script:

> iptables -A LOG_DROP -s 192.168.1.0/24 -d 192.168.1.254/255.255.255.255
> -j ACCEPT
> iptables -A LOG_DROP -s 192.168.1.254/255.255.255.255 -d 192.168.1.0/24
> -j ACCEPT

it wont work, because everything before the DROP rule will NOT be parsed.=
 I'm=20
my particular case, I should "insert" those rules you want to be accepted=
=20
before de DROP one. That's why I set my LOG and DROP rules in the last li=
nes=20
of the script.

Please, correct me if I am in mistake, and sorry my bad english.

Regards.

-Miguel Angel Baeyens

KeyID: 0x6FB7A511 en rediris.es

