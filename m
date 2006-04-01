From: "Carlos Pastorino" <carlos.pastorino@gmail.com>
Subject: Re: It seems I've found why conntrack blocks some packets
Date: Sat, 1 Apr 2006 17:59:43 -0300
Message-ID: <cc4fcc140604011259m3ee3a19coa5aac5a34ba3f66e@mail.gmail.com>
References: <57F9959B46E0FA4D8BA88AEDFBE582901674BC@pxtbenexd01.pxt.primeexalia.com>
	<cc4fcc140603300601j169864eexddc8fe3dd06c1a24@mail.gmail.com>
	<442D2C8F.1020505@SCampbell.net> <442D320E.7070301@SCampbell.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <442D320E.7070301@SCampbell.net>
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
Content-Type: text/plain; charset="us-ascii"
To: Steven M Campbell <Netfilter@scampbell.net>
Cc: netfilter@lists.netfilter.org

Now, commenting on this message: I actually didn't know that the
conntrack table had a limit. Learning something every day. I will
check its value on Monday, during peak time.

Another thought: if the ACKs that are being blocked are for some
reason malformed, wouldn't they be blocked as well by the last rule?

> One other thought to this, if I were to presume the ${variables} and ...i=
p's then I would presume that the RELATED rules should allow these ack's to=
 go through.  The only reason I know of for them not do (again, assuming al=
l the addressing is really ok) would be that the conntrack table has filled=
 up.
>
> To see the maximum connnections that can be tracked:
>
> # cat /proc/sys/net/ipv4/ip_conntrack_max
> 32760
>
> To see how many you are using at a given moment
>
> # wc  -l /proc/net/ip_conntrack
> 16 /proc/net/ip_conntrack
>
>
> This from my house and there really isn't all that much going on, I would=
 expect far larger counts, you may need to up ip_conntrack_max.  This reall=
y out in the SWAG arena because I can't see the details of your installatio=
n.
>
>

