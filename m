From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: iptables 1.2.10 and linux kernel 2.6.7 problems.
Date: Thu, 24 Jun 2004 10:34:25 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0406241032140.8190-100000@blackhole.kfki.hu>
References: <6BFFA187E8806C4E9740A353F715DDBDE57169@newmailer.terraplay.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <6BFFA187E8806C4E9740A353F715DDBDE57169@newmailer.terraplay.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: =?iso-8859-1?Q?P=E4r_H=E4ggblad?= <par.haggblad@terraplay.com>
Cc: netfilter@lists.netfilter.org

On Wed, 23 Jun 2004, [iso-8859-1] P=E4r H=E4ggblad wrote:

> I have used iptables 1.2.9 with kernel 2.4.x since a week ago.
> Now I'm using the new 2.6.7 kernel and iptables 1.2.10.

You did compile iptables 1.2.10 using the 2.6.7 source code, didn't you?

> modprobe ip_nat_ftp ports=3D ab,cde,fgh
                            ^
That space is illegal there |

> 2. $IPTABLES -v -A INPUT -i eth0 -p icmp -j DROP
>    Does not work. I can still ping my compu, the packets are not dropped.

If you list out the rules, you can see the same ones you fed into the
kernel?

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


