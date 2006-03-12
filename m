From: Kevin McConnell <kevymac@yahoo.com>
Subject: Re: defeat fingerprint
Date: Sat, 11 Mar 2006 18:45:15 -0800 (PST)
Message-ID: <20060312024515.73985.qmail@web50513.mail.yahoo.com>
References: <012201c64472$20f31580$2f00a8c0@TRINTASETE>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <012201c64472$20f31580$2f00a8c0@TRINTASETE>
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

    Hello Pedro,
When you say you want a tool to defeat fingerprints, I
assume that you mean a way to hide what OS you're
using when people scan your box with a tool like nmap.
Iptables doesn't need a tool to change it's behavior,
you can just call it from the command line. Also,
there are other kernel variables that you can change
using sysctl that will also effect the way the IP
stack behaves. You have to remember that if people
really want to figure out what kind of OS you're
running, they can check out other avenues, such as
services that you might be running on your machine,
etc....  A good start is looking at the documentation
that comes with the kernel and the documentation that
comes with iptables.
HTH

--- Pedro Drimel Neto <pedrodrimel@uol.com.br> wrote:

> Hi all,
> 
> I'm looking for a tool that defeat fingerprint... I
> found ippersonality 
> (http://ippersonality.sourceforge.net) but it has
> the patch only for kernel 
> 2.4.18...
> I also found the fingerprint scubber but it was
> testes on FreeBSD and his 
> funcional is like a firewall not only to defeat
> fingerprint...
> 
> Does iptables has this function to defeat tcp/ip
> stack fingerprint like nmap 
> does ?
> 
> Thanks...
> 
> Regards. 
> 
> 
> 


Kevin C. McConnell --RHCE # 805299480800193 since July 2, 1999-- <Red Hat Certified Engineer>
Freedom in software, now freedom in life.
http://www.freestateproject.org/

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

