From: Ulysses Almeida <ulysses.almeida@gmail.com>
Subject: Re: how to use NF_QUEUE
Date: Wed, 9 Feb 2005 14:37:57 -0300
Message-ID: <d64535605020909372c5de863@mail.gmail.com>
References: <20050209111625.40750.qmail@web50409.mail.yahoo.com>
Reply-To: Ulysses Almeida <ulysses.almeida@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20050209111625.40750.qmail@web50409.mail.yahoo.com>
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
To: vinay mathew <vinaymathew80@yahoo.com>
Cc: netfilter@lists.netfilter.org

Hi,

  Some time ago I wrote this tutorial
(http://munky.maluco.com.br/libipq.html) It uses libipq with NF_QUEUE
hook, to show some packet infos on the screen, it's very simple
example. Main problem, it's on pt_BR, but you can take a look on
"LibIPQ by example" section, it's kind of self-explanatory.
  Any doubt about translation or libipq, you can write me (pvt)

  Regards.

On Wed, 9 Feb 2005 03:16:24 -0800 (PST), vinay mathew
<vinaymathew80@yahoo.com> wrote:
> Hi,
> I am a newbie regarding Netfilter.I need to use the
> Netfilter hooks for a project. I have tried out the
> hook functions using NF_ACCEPT, NF_DROP.I need to use
> NF_QUEUE to queue certain packets to the user space
> where i need to process them further and then send
> these packets back into the network stack.
> I have not done this before so does anyone have some
> simple sample code using this option so that i can get
> a start on how its done.
> Thanx in advance ,
> regards
> vinay
> 
> 
> __________________________________
> Do you Yahoo!?
> The all-new My Yahoo! - Get yours free!
> http://my.yahoo.com
> 
> 


-- 
 - Ulysses Almeida

