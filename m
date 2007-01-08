From: nawawi <mohd.nawawi@gmail.com>
Subject: Fwd: Limit IP
Date: Mon, 8 Jan 2007 20:24:35 +0800
Message-ID: <562d10500701080424h5fe51f8fk5f2ff5b51c4fe260@mail.gmail.com>
References: <562d10500701080045t1c33b4f7v607c1630da710d7e@mail.gmail.com>
	<002e01c73307$596ea6c0$0b0ffe0a@NS006819>
	<562d10500701080421o2630e33s11d533a1ecc72ff5@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <562d10500701080421o2630e33s11d533a1ecc72ff5@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

---------- Forwarded message ----------
From: nawawi <mohd.nawawi@gmail.com>
Date: Jan 8, 2007 8:21 PM
Subject: Re: Limit IP
To: Rob Sterenborg <rob@sterenborg.info>


Hi,
Thank you for your prompt reply, btw,
It's not like range limit, I'm just want to know if there any solution
can limit IP.
The scenario like this:

1)      My LAN have 254 ip's (192.168.0.0/24)
2)      LAN user used both DHCP and static IP
3)      By right total ip's can go out to internet 254 ip's

From above, im just want to limit the connection/ip go out to
internet, let say 10 ip's and
The 10 ip's will come from range 192.168.0.1 to 192.168.0.254.

Regards,
nawawi


On 1/8/07, Rob Sterenborg <rob@sterenborg.info> wrote:
> netfilter-bounces@lists.netfilter.org wrote:
> > Hi,
> >
> > does anyone know how to limit the IP connection from going out to
> > internet?
> >
> > example:
> > LAN: 192.168.0.0/24
> >
> > but im only want to give 10 IP's go out to internet
>
> You can:
>
> - if these IP's are random in 192.168.0.0/24, put 10 rules in place
> which each describe which 192.168 ip can be forwarded.
>
> $ipt -A FORWARD -s 192.168.x.x [...] -j ACCEPT
> ...
>
> - if these IP's form a range in 192.168.0.0/24, use the range match to
> describe a range of ip's that can be forwarded. However, the range match
> is in POM-ng so you'll have to check if your install supoprts it.
> http://www.netfilter.org/projects/patch-o-matic/pom-base.html#pom-base-i
> prange
>
> Gr,
> Rob
>
>
>
>

