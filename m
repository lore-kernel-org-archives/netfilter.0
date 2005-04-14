From: Adrian Turcu <adrian.turcu@gmvinteractive.com>
Subject: Re: I need help with "CONNMARK --set-mark"
Date: Thu, 14 Apr 2005 14:25:06 +0100
Message-ID: <200504141425.08821.adrian.turcu@gmvinteractive.com>
References: <200504111134.26674.adrian.turcu@gmvinteractive.com>
	<20050414124539.GA1297@bender.817west.com>
	<9151ac2a0504140609156b7008@mail.gmail.com>
Reply-To: adrian.turcu@gmvinteractive.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <9151ac2a0504140609156b7008@mail.gmail.com>
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
To: netfilter@lists.netfilter.org
Cc: Filip Sneppe <filip.sneppe@gmail.com>

Hi Filip,

On Thu 14 Apr 2005 14:09, Filip Sneppe wrote:
>
> I haven't followed this in great detail either, but I do know that
> some people reported problems with the firewall MARK in combination
> with tc filter ... fwmark on the LARTC mailing list. I do remember someone
> explicitly using a u32 mark match too.
>
> I don't know what the details were, but could you give a different kernel
> a try ? Sorry, I thought I kept the exact mail thread in my mailbox, but I
> must have deleted it... You may want to check the LARTC archives for more
> info.
>
> So try a different kernel first, if the problem persists and you're
> convinced that this is a bug, you may want to take this to the -devel
> mailing list, where the author of the CONNMARK patch also hangs out.
>
> Regards,
> Filip

I have tried with 2 different kernels 2.6.10 and 2.6.11.6 and 2 different 
iptables 1.3.0 and 1.3.1.  The behaviour is the same, most of the time the 
CONNMARK does not work.
I posted the 2.6.11.6 kernel with 1.3.1 iptables, 'cause I intend to use the 
latest stable versions for both.

I cannot say if this is a bug or not after reading through the message posted 
by Jason. Although, if you go to the link posted by Jason, it looks like the 
options of setting/saving the marks that CONNMARK has, they don't work as 
most people will expect to (set mark to the connection and _save_ it 
afterward inside the connetion, not resetting to zero and save it).

I can post the original message to the devel list, maybe I'll get a different 
twist from the author (if still there)


Regards,
Adrian

