From: Roberto Nibali <ratz@tac.ch>
Subject: Re: About loadable kernel modules
Date: Mon, 07 Oct 2002 18:17:21 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DA1B391.9090103@tac.ch>
References: <001001c26a3e$1900bab0$c5327d9e@alex>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Alexandros Fragkiadakis <A.Fragiadakis@lboro.ac.uk>
Cc: netfilter@lists.netfilter.org

Hello,

>  I also have a user process thas loads and unloads this loadable kernel 
> module using the commands:
> system("insmod kernel_module.o")
> system("rmmod kernel_module") respectively.

Ok.

>  I'd like to pass parameters to the loadable module, hence having a more 
> flexible user process.
>   So, instead of using the command /system("insmod kernel_module.o"),/
> i'd like to use: /system("insmod kernel_module.o <param1> 
> <param2>...<param n>")/
> , hence passing command line parameters to my loadable module.
>  
> Do you know if it is possible?

You definitely want the know about the MODULE_PARM() macro. Get more information 
by reading an existing module like for example:

grep ^MODULE_ /usr/src/linux/drivers/net/3c59x.c

Best regards,
Roberto Nibali, ratz
-- 
echo '[q]sa[ln0=aln256%Pln256/snlbx]sb3135071790101768542287578439snlbxq' | dc


