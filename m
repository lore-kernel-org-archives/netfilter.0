From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: iptables with alias again
Date: Mon, 7 Oct 2002 20:12:23 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021007191229.HKAQ28874.mta06-svc.ntlworld.com@there>
References: <001201c26e28$be880e50$3dd6a483@CBOOK>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001201c26e28$be880e50$3dd6a483@CBOOK>
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
To: netfilter@lists.netfilter.org

On Monday 07 October 2002 6:41 pm, Jeppe S=F8rensen wrote:

> Hello
> If I have a interface with e.g. 3 alias
> eth0
> eth0:0
> eth0:1
> eth0:2
>
> will this following rules apply on only eth0 and not eth0:0, eth0:1 and
> eth0:2 or will it apply on all of them
>
> iptables -A INPUT -i eth0 --dport 80 -j ACCEPT
> iptables -A INPUT -i eth0 -j DROP

It will apply to all of them.

Antony.

--=20

Having been asked to provide a reference for this man,
I can confidently state that you will be very lucky indeed
if you can get him to work for you.

