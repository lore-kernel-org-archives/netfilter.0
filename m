From: Christian Theil <christiantheilhave@gmail.com>
Subject: Re: HEEEEEEEEEELP!!!! with ip_conntrack: table full,
	dropping packet.
Date: Thu, 27 Jan 2005 14:15:03 +0100
Message-ID: <33d4ee940501270515614644c6@mail.gmail.com>
References: <000301c503f1$9dbe6730$0b00a8c0@leeloo>
Reply-To: Christian Theil <christiantheilhave@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000301c503f1$9dbe6730$0b00a8c0@leeloo>
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
To: Pablo Vila <pvila@adinet.com.uy>, netfilter@lists.netfilter.org

Hi

You should provide some information on your setup (eg. iptables rules,
is it a router/firewall or a host?). Im assuming you're talking about
a router...

First of all, do you need conntrack? If not, don't load the module...

If You do, You can use the connlimit to limit the number of connections
(for instance, pr. IP address). using the connlimit match. 

for instance if you wan't to limit the number of connections initiated
by an IP address on an internal network, by doing something like

iptables -A FORWARD -m connlimit -s 192.168.1.xxx --connlimit-above 10 -j DROP

Sincerely,
Christian

On Wed, 26 Jan 2005 19:54:30 -0200, Pablo Vila <pvila@adinet.com.uy> wrote:
> I have the this problem, i have compiled and installed ok a new kernel
> (2.6.10)
> 
>  kernel: printk: 55 messages suppressed.
>  kernel: ip_conntrack: table full, dropping packet.
> 
> and this message repeats a lot, but i never have this problem with kernel
> 2.6.9-1-686, i have to compile a new one becouse i need suport for a new
> device scsi i have installed. but i can't fix this message and i don't know
> what is the problem.
> Some info:
> Proc: Celeron 333 Mhz
> Mem: 256 Mb
> if you need more info ask me!, thx to all!!!...
> 
> PS: Sorry my English
>                                            Pablo <===
> 
> -------------------------------------------
>   Pablo Francisco Vila Silveira     CX5CM
>      email: pvila@montevideo.com.uy
>             pvila@adinet.com.uy
>        sms: 94338237@sms.bellsouth.com.uy
>    Montevideo, Uruguay, America del Sur
> -------------------------------------------
> 
>

