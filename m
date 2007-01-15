From: Anil Gunturu <anil@mistletoetech.com>
Subject: Re: tcp conn tracking
Date: Mon, 15 Jan 2007 08:57:20 -0800 (PST)
Message-ID: <25296252.199981168880240692.JavaMail.root@smtp1.mistletoetech.com>
References: <Pine.LNX.4.64.0701150843190.9059@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.64.0701150843190.9059@blackhole.kfki.hu>
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
To: netfilter@lists.netfilter.org
Cc: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>

Thank you for the response. 

So, ftp connection tracking doesn't work always. Just curious about what is the rationale for such a solution? Is it assumed that if the packet with PORT command is fragmented someone is deliberatly attacking the system?

Cheers,

-Anil

----- Original Message -----
From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
To: Anil Gunturu <anil@mistletoetech.com>
Cc: netfilter@lists.netfilter.org
Sent: Sunday, January 14, 2007 11:47:23 PM GMT-0800 US/Pacific
Subject: Re: tcp conn tracking

On Sun, 14 Jan 2007, Anil Gunturu wrote:

> Does the tcp connection tracking reorder and reassemble the tcp data. I 
> am particularly interested in how ip_conntrack_ftp works, if the tcp 
> data for port commnad comes in two different out-of-order segments.

The connection tracking in netfilter defragments fragmented packets but 
does not reorder out of order packets. Moreover FTP connection tracking 
won't work on PORT/etc commands which arrive in multiple (not fragmented) 
packets, even if those are in order.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
           H-1525 Budapest 114, POB. 49, Hungary


