From: Philip Ho <cbho@ie.cuhk.edu.hk>
Subject: Re: libipq question
Date: Fri, 23 May 2003 16:22:47 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3ECDDA57.F90EC289@ie.cuhk.edu.hk>
References: <Pine.SOL.4.33.0305142100520.21590-100000@cheetah.cs.ucla.edu>
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
Content-Type: text/plain; charset="us-ascii"
To: Shirshanka Das <shanky@cs.ucla.edu>
Cc: netfilter@lists.netfilter.org, Philip <cbho@ie.cuhk.edu.hk>

Hi Shirshanka

I have the exact question as you. I can get the packet to Perl userspace,
but don't know how to modify the packet and put it back into socket. Do you
know the answer?

Regards,
philip



Shirshanka Das wrote:

> Hi all,
>   I'm new to lipipq...
>   I tried using the perlipq module.. but I'm unable to figure out
>   how to write a "modified" packet back to the queue..
>   the documentation says :
>   set_verdict(id,verdict,len,buf)
>
>   $msg = $queue->get_message() gives me the packet (i hope)..
>   however trying to do
>   set_verdict(id,NF_ACCEPT,len,$msg)
>   does not work properly...
>
>   does anyone have a piece of working code.. that mangles something in a
> packet.. and then writes it out ?
>
> Thanks,
> Shanky


