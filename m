From: Alin Nastac <mrness@technosoft.ro>
Subject: Re: alias
Date: Mon, 03 Jun 2002 23:56:47 +0300
Sender: netfilter-admin@lists.samba.org
Message-ID: <3CFBD80F.5080105@technosoft.ro>
References: <20020603195921.84898.qmail@web9908.mail.yahoo.com>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?J=F6rgen?= Danielsson <jorgen_d@yahoo.com>
Cc: netfilter@lists.samba.org

There is a solution:
    ip addr add w.x.y.z/bits dev eth0 label eth00

and use -i/-o eth00 in iptables.

In fact, I believe you could use any alphanumeric characters after=20
'eth0'. I'm not sure.

J=F6rgen Danielsson wrote:

>Hello
>
>I have a little question that perhaps someone knows
>the answer to.
>
>Is it inpossible to use a alias in a rule. With that I
>mean refer to a interface called eth1:0.
>
>I get this from every version of iptable i have tried
>(1.2.2, 1.2.4, 1.2.6a):
>
>Warning: wierd character in interface `eth1:0' (No
>aliases, :, ! or *).
>
>/J=F6rgen
>
>__________________________________________________
>Do You Yahoo!?
>Yahoo! - Official partner of 2002 FIFA World Cup
>http://fifaworldcup.yahoo.com
>



