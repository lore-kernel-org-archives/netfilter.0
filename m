From: Matt Kotich <matt@yourhost.com>
Subject: Re: Iptables issue with EPSV FTP
Date: Mon, 3 Nov 2003 15:10:48 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F64DE249-0E52-11D8-9512-0050E425B26F@yourhost.com>
References: <659503E2-0E4F-11D8-9512-0050E425B26F@yourhost.com> <20031103235737.0bb8b430.netfilter@schuetter.org>
Mime-Version: 1.0 (Apple Message framework v606)
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031103235737.0bb8b430.netfilter@schuetter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?J=F6rg_Sch=FCtter?= <netfilter@schuetter.org>
Cc: netfilter@lists.netfilter.org

[root@server root]# modprobe ip_conntrack_ftp
[root@server root]#

Got nothin'

What should I do now?

PS: This is IPTables 1.2.8-8.72.3 on Linux 2.4.20-20.7smp

--=20

Matt Kotich
Yourhost.com CTO
email: matt@yourhost.com
phone: 714.842.8511x125

On Nov 3, 2003, at 2:57 PM, J=F6rg Sch=FCtter wrote:

> Hallo Matt,
>
> On Mon, 3 Nov 2003 14:45:17 -0800
> Matt Kotich <matt@yourhost.com> wrote:
>
>> Hello,
>>
>> I'm running into some problems with FTP when I fire up my iptables on
>> RedHat 7.3.. basically, here's what happens:
>>
>> 220 server.yourhost.com FTP server ready
>> Name (server.yourhost.com:matt): matt
>> 331 Password required for matt.
>> Password:
>> 230 User matt logged in.
>> Remote system type is UNIX.
>> Using binary mode to transfer files.
>> ftp> ls
>> 500 EPSV not understood
>> 227 Entering Passive Mode (xxx,xxx,xxx,xxx,xxx,xx).
>> -------System hangs here until I Ctrl+C
>>
> [...]
>>
>> I can't figure out why these would break for just OS X, my only guess
>> is that it doesn't like the EPSV, however, I thought the "sate
>> RELATED,ESTABLISHED" would fix that.. i'd even tried adding a rule =
for
>> allowing "! --syn" but that didn't help either... Any idea what I=20
>> could
>> be doing wrong here?
>
> modprobe ip_conntrack_ftp
>
>
> J=F6rg
>
> --=20
> J=F6rg Sch=FCtter           http://www.lug-untermain.de/
> joerg@schuetter.org     http://www.schuetter.org/joerg/
> ICQ: 298982789          http://mypenguin.bei.t-online.de/
>
>


