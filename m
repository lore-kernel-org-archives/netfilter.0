From: "Narendra Prabhu. B" <naren@deeproot.co.in>
Subject: Re: Link time problems with libipq example code
Date: Sat, 21 Dec 2002 10:59:43 +0530 (IST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.43.0212211048490.286-100000@abodh.pesit.deeproot.co.in>
References: <20021220224405.GB28191@securityfocus.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021220224405.GB28191@securityfocus.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Craig Davison <cd@securityfocus.com>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

Hi,

Yes, even I have come across such problems.... I just complied it using
the following command.

$gcc -I/usr/local/include -L/usr/local/lib -o ipqtst ipqtst.c -lipq

Just notice that I have put "-lipq" in the end... Well, I have not been
able to reason, why it works this way. Its probably the gcc issue.

Hope this helps.

Bye,
Narendra.


On Fri, 20 Dec 2002, Craig Davison wrote:
> Hello,
> I've been trying to compile the libipq example code in the libipq man page.
>
> My kernel is 2.4.18, distributed by RedHat as 2.4.18-14. I made a symlink to the kernel source at /usr/src/linux.
> I built ipchains 1.2.7a as follows:
> make
> su
> make install-devel
>
> I copied the code from the man page into a file called ipqtst.c and compiled:
> gcc -I/usr/local/include -L/usr/local/lib -lipq -o ipqtst ipqtst.c
> /tmp/ccGDqSOi.o: In function `die':
> /tmp/ccGDqSOi.o(.text+0xf): undefined reference to `ipq_perror'
> /tmp/ccGDqSOi.o(.text+0x1d): undefined reference to `ipq_destroy_handle'
> /tmp/ccGDqSOi.o: In function `main':
> /tmp/ccGDqSOi.o(.text+0x49): undefined reference to `ipq_create_handle'
> /tmp/ccGDqSOi.o(.text+0x81): undefined reference to `ipq_set_mode'
> /tmp/ccGDqSOi.o(.text+0xb8): undefined reference to `ipq_read'
> /tmp/ccGDqSOi.o(.text+0xe4): undefined reference to `ipq_message_type'
> /tmp/ccGDqSOi.o(.text+0x116): undefined reference to `ipq_get_msgerr'
> /tmp/ccGDqSOi.o(.text+0x141): undefined reference to `ipq_get_packet'
> /tmp/ccGDqSOi.o(.text+0x166): undefined reference to `ipq_set_verdict'
> collect2: ld returned 1 exit status
>
> I get the same errors when I compile statically:
> gcc -static -I/usr/local/include -L/usr/local/lib -lipq -o ipqtst ipqtst.c
>
> Is libipq not the right thing to link against? Am I doing something else wrong (did I build ipchains incorrectly?)
>
> --
> Craig Davison
> Symantec Corporation
> +1 (403) 213-3939 ext. 228
>
>

In the middle of difficulty..... lies Opportunity. (Albert Einstein)
--------------------------------------------------------------------
Narendra Prabhu. B             Free Software at its product-ive best.
DeepRoot Linux                             http://www.deeproot.co.in
                ---- Server Appliances ----
             ---- Linux Support and Services ----
-------------------------------------------------------------------



