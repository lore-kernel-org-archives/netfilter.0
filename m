From: "Stephan Higuti" <higuti.sam@gmail.com>
Subject: Re: Firewall L7
Date: Fri, 11 May 2007 14:53:18 -0300
Message-ID: <3da957060705111053o72da3957q7887879d7e9cc87d@mail.gmail.com>
References: <3da957060704180538m12ec86edr2536867007a8d05@mail.gmail.com>
	<462612C7.3090504@solutti.com.br>
	<3da957060704191115v62303fdh838beab7328ed331@mail.gmail.com>
	<6bb85d880704191258r4b3638adye6669cee42b16485@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=MDPXBlaXwhjS7gSVZ6lpwCWuKvczdETsjEg4VpDOj/ys5SsjFGB2m3wNHLFyAEVhvvva8gPvYVKaRiwVMn/KHcqZ8cnxowgRfo/qY1TstFk0Q8CU2rxDhNpE2CTnyjcvI/4MlFaWmxbSToS2RdNi2H0AGU7NchiYLo0etoQ+14I=
In-Reply-To: <6bb85d880704191258r4b3638adye6669cee42b16485@mail.gmail.com>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Juan_Le=F3n?= <debjuanca@gmail.com>
Cc: netfilter@lists.netfilter.org

Thanks for help guys!
It works!
Just another question....
What I do to let a free IP behind my Bridge firewall (L7)?
I need an Ip that can acess all.......

Best Regards

Stephan

On 4/19/07, Juan Le=F3n <debjuanca@gmail.com> wrote:
>
> Hi Stephan, with my experience firewalling, you can try using this rules
> with yours.
>
> Lets take a close  look of your rules.
>
>
> #iptables -t filter -A FORWARD -m string --string "orkut" -j DROP --algo =
bm
>
> Maybe this line is associated with gmail, I suggest you use a proxy to ma=
tch
> strings like orkut.
> Read Oscar Adreasson's paragraph.
>
> "For example, if we use a string match and match for a specific string
> inside the packet, lets say get /index.html. Will that work? Normally, ye=
s.
> However, if the packet size is very small, it will not. The reason is tha=
t
> iptables is built to work on a per packet basis, which means that if the
> string is split into several separate packets, iptables will not see that
> whole string. For this reason, you are much, much better off using a prox=
y
> of some sort for filtering in the application layer"
>
>
> For hotmail your can add this line just above of every FORWARD line, see
> "-I",  the same with your mail.server.com
>
>  #iptables -I FORWARD -d www.hotmail.com -j ACCEPT
> #iptables -I FORWARD -d mail.server.com -j ACCEPT
>
>
> Hope this help.
>
>
>
> 2007/4/19, Stephan Higuti <higuti.sam@gmail.com>:
> > My rulez....
> >
> > ## Limpando as regras do IPTABLES
> > iptables -F
> > iptables -t nat -F
> > iptables -t mangle -F
> >
> > ## Ativando repasse de pacotes ##
> > echo 1 > /proc/sys/net/ipv4/ip_forward
> >
> > ## instalando modulos do IPTABLES ##
> > modprobe iptable_nat
> > modprobe ip_nat_ftp
> > modprobe ip_conntrack
> > modprobe ipt_conntrack
> > modprobe ip_conntrack_ftp
> > modprobe ip_tables
> > modprobe ipt_LOG
> > modprobe ipt_limit
> > modprobe ipt_REJECT
> > modprobe ipt_layer7
> >
> > # Criando NAT para toda a rede.
> > #iptables -t nat -A POSTROUTING -s 192.168.0.0/24 -o eth1 -j MASQUERADE
> >
> > ## Ativando regras do Layer 7
> > # Bloqueando de skype para skype
> > iptables -A FORWARD -m layer7 --l7proto skypetoskype -j DROP
> >
> > # Bloqueando o Skypeout
> > iptables -A FORWARD -m layer7 --l7proto skypeout -j DROP
> >
> > # Bloqueando o Messenger
> > #iptables -A FORWARD -m layer7 --l7proto msnmessenger -j DROP
> > #iptables -A PREROUTING -m layer7 --l7proto msnmessenger -j DROP
> > iptables -t filter -A FORWARD -m layer7 --l7proto msnmessenger -j DROP
> >
> > #Bloqueando o Goddamn ORKUT por string usando o Algoritmo bm (pode-se
> > usar o km tambem)
> > iptables -t filter -A FORWARD -m string --string "orkut" -j DROP --algo=
 bm
> >
> > #Bloquendo torrents
> > iptables -t filter -A FORWARD -m layer7 --l7proto bittorrent -j DROP
> >
> > # Mudando para Statefull
> > #iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
> >
> >
> > These rules are blockin' gmail, hotmail and my mail server.....
> > But its just a few rulez....
> > Some wrong?
> >
> > Cheers
> >
> > Stephan
> >
> > --
> >
> ---------------------------------------------------------------------
> > Stephan Higuti
> > MSN: higutisam@hotmail.com
> > Email: higuti.sam@gmail.com
> >
> ---------------------------------------------------------------------
> >
> >
>
>


--=20
---------------------------------------------------------------------
Stephan Higuti
MSN: higutisam@hotmail.com
Email: higuti.sam@gmail.com
---------------------------------------------------------------------

