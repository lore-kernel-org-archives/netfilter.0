From: Alexey Talikov <alexey_talikov@texlab.com.uz>
Subject: Re: order of packets passing chains/tables
Date: Wed, 05 Jun 2002 10:52:27 +0500
Sender: netfilter-admin@lists.samba.org
Message-ID: <VQJI3ZYS2Y63WSSOICHB71Q6IGXR09.3cfda71b@ALEXEY>
References: <200206050155.49800.a9806056@unet.univie.ac.at>
Reply-To: alexey_talikov@texlab.com.uz
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200206050155.49800.a9806056@unet.univie.ac.at>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org, Christian Hubinger <a9806056@unet.univie.ac.at>

http://people.unix-fu.org/andreasson/iptables-tutorial/images/tables_traverse.jpg
05.06.2002 4:55:49, Christian Hubinger <a9806056@unet.univie.ac.at> wrote:

>Hi!
>
>I'm currently developing an iptables GUI interface (kmyfirewall) and i'm a 
>litttle bit confused about the different tables used by the iptables.
>There is p.e. a Chain called OUTPUT in the "filter", "mangle" and in the "nat" 
>table. 
>I know that these chains are independent but i couldn't find out the order in 
>which the packets pass the chains/tables.
>
>I would be very thankful if anyone could show me a diagramm (or where to find 
>one) of the netfilter achitectuer with all it's tables and chains and of 
>course the order in which the packetes are passing the chains/tables.
>
>thanks a lot
>
>greetings,
>		chris 
>
>
>-- 
>Windows is a 32 bit shell for a 16 bit extension to an 8 bit
>Operating System designed for a 4 bit microchip by a 2 bit
>company which can't stand one bit of cometition.
>
>

-----------------------------------
mailto:alexey_talikov@texlab.com.uz
BR
Alexey Talikov
FORTEK
-----------------------------------



