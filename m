From: =?ISO-8859-15?Q?J=F6rg_Sch=FCtter?= <netfilter@schuetter.org>
Subject: Re: Help! NAT unable to routing
Date: Fri, 31 Oct 2003 18:03:26 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031031180326.1f027485.netfilter@schuetter.org>
References: <BEA73FB6B8F62545A5B2818724D0DF2902E70843@u.library.Arizona.EDU>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BEA73FB6B8F62545A5B2818724D0DF2902E70843@u.library.Arizona.EDU>
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

Hallo Yan,

On Thu, 30 Oct 2003 17:12:47 -0700
"Han, Yan" <hany@u.library.arizona.edu> wrote:

> # what is wrong ??
> iptables -t nat -A PREROUTING -i eth0 -p tcp -d 150.135.44.245 --dport 80=
 -j
> DNAT --to 150.135.45.96

what does "iptables -t nat -L -n -v" show? Is the counter (first column)
increased every time you try to connect your webserver?
What does "cat /proc/sys/net/ipv4/ip_forward" show?


  J=F6rg

--=20
J=F6rg Sch=FCtter           http://www.lug-untermain.de/
joerg@schuetter.org     http://www.schuetter.org/joerg/
ICQ: 298982789          http://mypenguin.bei.t-online.de/


