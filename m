From: Atilla <theatilla@gmail.com>
Subject: Re: Weird behaviour when compiling iptables
Date: Tue, 25 Jan 2005 16:24:32 +0200
Message-ID: <b53c932d05012506247bd8ed@mail.gmail.com>
References: <b53c932d0501240507143cd370@mail.gmail.com>
Reply-To: Atilla <theatilla@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <b53c932d0501240507143cd370@mail.gmail.com>
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

Ok, I got some progress (i think). I got the 2.6.10 kernel, and
compiled it and replaced the old one with it. With and without
patching the kernel and the iptables source i get the same thing:
"Making dependencies, please wait..." and it stays there. CPU usage is
100%, with make forking to cpp0 and cc processes all the time - at
least that's what i got from what TOP shows. I ran STRACE on this -
it's a loooong sequence of things i don't understand but at least i
know it doesn't hang - ot loops continuously doing something.

Now - I'm doing this on a Pentium II 400mhz machine with 128RAM and
1GB swap. The ram usage is VERY low when doing this. I don't know how
much the process should take but I left it yesterday for hours and it
was still doing the same thing. A kernel compile, for example, takes
it like 1/2 an hour.  Oh - and iptables 1.3.0 does the same thing -
"making dependencies, please wait... " - i thought it might do some
difference - it didn't.  So i'm stuck at this point. Apparently i did
something to the system, but i can't figure out what. I haven't been
changing any important things like compilers and libraries and the
such, that's for sure.

I'm kind of new to all this but I figure I'm way too stuck on this
one. Any further clues are highly appreciated.

