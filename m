From: "Nauman Malik" <naumanm@khi.wol.net.pk>
Subject: Re: What is the limitation of iptables's limit option?
Date: Sat, 27 Sep 2003 17:34:00 +0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200309271734000109.25CEADA3@smtp.khi.wol.net.pk>
References: <Law14-F491WYi3NndsD00022915@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Law14-F491WYi3NndsD00022915@hotmail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="big5"
To: Wu Nick <chundawu@hotmail.com>, netfilter@lists.netfilter.org

One more question related to this.
Can we limit no. of icmp packets per IP address?
Or shall it limit total no. of ICMP packets from all the source IP's.


 

*********** REPLY SEPARATOR  ***********

On 9/26/2003 at 6:52 AM Wu Nick wrote:

>Hi guys,
> 
> I had added a rule to my linux box to prevent "Ping flooding".
> Actually, i limit ICMP packet to be accepted 253 times at maximum
> within a second by the limit extension option. The rule looks like this
> "ipatbles -A INPUT -p icmp -m limit --limit 253/s -j ACCEPT"
> "ipatbles -A INPUT -p icmp -j DROP"
> But when i use packet generator with sniffer to test this fucntion, it
> doesn't always work. If i send each icmp packets with 10 millisecond
> delay within a second, it works fine, but when i doing this with each 
>packet less than 10
> millisecond delay within a second, it seems crash(only few packets match 
>the first rule,
> others will be matched by the second rule ).This seems that limit module 
>can only see 
>packet every 10 millisecond. Any ideas?
>
>Any comments will be very appreciated!
>
>Nick Wu
>
>_________________________________________________________________
>=B2{=A6b=B4N=A4W MSN=
 =B2=E1=A4=D1=AB=C7=A1G=A6b=BDu=A4W=B5=B2=A5=E6=B7s=AAB=A4=CD=A1A=BBP=A6h=
=A4H=A7Y=AE=C9=A4=AC=B0=CA=B9=EF=BD=CD 
>http://chat.msn.com?pgmarket=3Dzh-tw




