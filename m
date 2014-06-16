From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Default netfilter kernel buffer size?
Date: Mon, 16 Jun 2014 11:35:02 +0200
Message-ID: <20140616093502.GA8007@localhost>
References: <007501cf8685$69b9a460$3d2ced20$@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <007501cf8685$69b9a460$3d2ced20$@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cade Robinson <cade.robinson@gmail.com>
Cc: netfilter@vger.kernel.org

Hi,

I guess you're refering to libnetfilter_queue.

On Thu, Jun 12, 2014 at 04:29:36PM -0500, Cade Robinson wrote:
> I have been searching around and can't find it so maybe someone can tell me.
> 
> I am looking for the default size of the kernel queue netfilter uses and if
> there is a /proc file to see what the current setting is?
>  
> 
> The story is I have a program that marks packets coming into netfilter.
> 
> On slower devices while a blacklist loads I have run into ENOBUFS error from
> recv.
> 
> I am thinking that if I use nfq_set_queue_maxlen to set this to a higher
> number I won't get the ENOBUFS error but I can't find the default to know
> what may be a larger number.

Please, have a look at the documentation:

http://www.netfilter.org/projects/libnetfilter_queue/doxygen/

It refers to this problem.
