From: Angel <a.alvarez@uah.es>
Subject: Re: iptables: invalid arguement with kernel 2.6.5
Date: Tue, 4 May 2004 13:31:29 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405041331.29315.a.alvarez@uah.es>
References: <002e01c431c7$09cfe910$440997cb@GINA>
Reply-To: a.alvarez@uah.es
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <002e01c431c7$09cfe910$440997cb@GINA>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="johab"
To: netfilter@lists.netfilter.org

on the mangle table?=20
i think it should be on the nat table?

El Martes, 4 de Mayo de 2004 13:00, Det Buaklee escribi=C3=B3:
> Hi
>
> I am very new in configuring iptables with bridge software. I want to do
> a transparent proxy with iptables and squid and running a firewall
> bridge on the squid box. I have upgraded my kernel to 2.6.5 (to get the
> firewall-bridge) and I have already tried compiled iptables 1.2.9 with
> the kernel src directory. My problem is when I tried something like
>
> /sbin/iptables -A PREROUTING -t mangle -i eth0 -p tcp --dport 80 -j
> REDIRECT --to-port 8080
>
> or
>
> /sbin/iptables -t mangle -A PREROUTING -m physdev --physdev-in eth0 -p
> tcp --dport 80 -j REDIRECT --to-port 8080
>
> and iptables just return
>
> iptables: invalid argument
>
> Any help or pointer to some documents would be much appreciated.
>
> Det Buaklee

=2D-=20
=2D-------------------------------------------------------
Angel J. Alvarez Miguel
Secci=C3=B3n de Sistemas, Servicio de Explotaci=C3=B3n
Servicios Informaticos, Universidad de Alcal=C3=A1
Tfno: +34 91 885 47 04, Fax: +34 91 885 51 11
=2D-------------------------------------------------------

