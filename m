From: "Ranjeet Shetye" <ranjeet.shetye@zultys.com>
Subject: RE: Link time problems with libipq example code
Date: Mon, 23 Dec 2002 11:05:06 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003001c2aab6$352a7560$0100a8c0@zultys.com>
References: <Pine.LNX.4.43.0212211048490.286-100000@abodh.pesit.deeproot.co.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.43.0212211048490.286-100000@abodh.pesit.deeproot.co.in>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


Hi Narendra,

The behaviour you are observing is related to the way gcc resolves
sumbols while compiling code.

http://webclub.kcom.ne.jp/ma/colinp/win32/tools/link.html

"
gcc checks libraries in the order they appear, and it will only resolve
references to symbols in libraries earlier on the command line if the
object containing the symbol definition was already included for some
other reason. Thus if foo.o uses a function in libstuff.a the following
command line will fail:

gcc -o foobar.exe -lstuff foo.o bar.o
"

Which is what you guys are running into.

Ranjeet Shetye
Senior Software Engineer
Zultys Technologies
771 Vaqueros Avenue
Sunnyvale  CA  94085
USA
Ranjeet.Shetye@Zultys.com
http://www.zultys.com/

 


> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org 
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of 
> Narendra Prabhu. B
> Sent: Friday, December 20, 2002 9:30 PM
> To: Craig Davison
> Cc: netfilter@lists.netfilter.org
> Subject: Re: Link time problems with libipq example code
> 
> 
> Hi,
> 
> Yes, even I have come across such problems.... I just 
> complied it using the following command.
> 
> $gcc -I/usr/local/include -L/usr/local/lib -o ipqtst ipqtst.c -lipq
> 
> Just notice that I have put "-lipq" in the end... Well, I 
> have not been able to reason, why it works this way. Its 
> probably the gcc issue.
> 
> Hope this helps.
> 
> Bye,
> Narendra.
> 
> 
> On Fri, 20 Dec 2002, Craig Davison wrote:
> > Hello,
> > I've been trying to compile the libipq example code in the 
> libipq man 
> > page.
> >
> > My kernel is 2.4.18, distributed by RedHat as 2.4.18-14. I made a 
> > symlink to the kernel source at /usr/src/linux. I built ipchains 
> > 1.2.7a as follows: make su
> > make install-devel
> >
> > I copied the code from the man page into a file called ipqtst.c and 
> > compiled: gcc -I/usr/local/include -L/usr/local/lib -lipq -o ipqtst 
> > ipqtst.c
> > /tmp/ccGDqSOi.o: In function `die':
> > /tmp/ccGDqSOi.o(.text+0xf): undefined reference to `ipq_perror'
> > /tmp/ccGDqSOi.o(.text+0x1d): undefined reference to 
> `ipq_destroy_handle'
> > /tmp/ccGDqSOi.o: In function `main':
> > /tmp/ccGDqSOi.o(.text+0x49): undefined reference to 
> `ipq_create_handle'
> > /tmp/ccGDqSOi.o(.text+0x81): undefined reference to `ipq_set_mode'
> > /tmp/ccGDqSOi.o(.text+0xb8): undefined reference to `ipq_read'
> > /tmp/ccGDqSOi.o(.text+0xe4): undefined reference to 
> `ipq_message_type'
> > /tmp/ccGDqSOi.o(.text+0x116): undefined reference to 
> `ipq_get_msgerr'
> > /tmp/ccGDqSOi.o(.text+0x141): undefined reference to 
> `ipq_get_packet'
> > /tmp/ccGDqSOi.o(.text+0x166): undefined reference to 
> `ipq_set_verdict'
> > collect2: ld returned 1 exit status
> >
> > I get the same errors when I compile statically:
> > gcc -static -I/usr/local/include -L/usr/local/lib -lipq -o ipqtst 
> > ipqtst.c
> >
> > Is libipq not the right thing to link against? Am I doing something 
> > else wrong (did I build ipchains incorrectly?)
> >
> > --
> > Craig Davison
> > Symantec Corporation
> > +1 (403) 213-3939 ext. 228
> >
> >
> 
> In the middle of difficulty..... lies Opportunity. (Albert Einstein)
> --------------------------------------------------------------------
> Narendra Prabhu. B             Free Software at its product-ive best.
> DeepRoot Linux                             http://www.deeproot.co.in
>                 ---- Server Appliances ----
>              ---- Linux Support and Services ----
> -------------------------------------------------------------------
> 
> 
> 


