From: Ulysses Almeida <ulysses.almeida@gmail.com>
Subject: Re: Two links and a SMTP sever.
Date: Mon, 7 Feb 2005 19:53:44 -0300
Message-ID: <d64535605020714533faf8400@mail.gmail.com>
References: <d645356050118053928226673@mail.gmail.com>
Reply-To: Ulysses Almeida <ulysses.almeida@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <d645356050118053928226673@mail.gmail.com>
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

  Some time ago, I wrote this e-mail below.  A lot of people tried to
help-me (thanks guys), but I couldn't find the problem. A week ago,
with help from someone on IRC I solved my problem (simple one). And I
finished my MiniHowTo.
http://munky.maluco.com.br/lar_with_smtp.html
  Maybe it won't tell you something new. But it's shorter do read
instead the whole LARTC documentation.
  This miniHowTo shows how to use iproute2 with iptables mark rule. I
think it's nice. If someone has something to say about it (in
private), I would thanks.

  PS: The problem was just Reverse Path Filtering enabled.

On Tue, 18 Jan 2005 10:39:04 -0300, Ulysses Almeida
<ulysses.almeida@gmail.com> wrote:
> Hi folks,
> 
>   I have an unsolved problem with iptables + iproute2 that I can't
> figure out how to solve it.
> 
>   I explaint it on the attachment (i sent this attachment, because I
> don't thin it will cause any trouble, since it's text/plain, if does,
> say and I won't send again). I wrote this as a mini-HowTo, and I
> pretend to publish this, but I need to solve the problem before doing
> this ;)
> 
>   The strange thing. I have almost the same scenario on other host,
> What differs is the fact that on the other host I have 4 Internet
> links, not only two, and everything works as I expected.  I tried the
> same solution on another two hosts, and on both I had this releated
> problem.
> 
>   If some one can help-me track this problem, I thank in advance.
> 
>   Regars.
> 
> --
>  - Ulysses Almeida
> 
> 
> 


-- 
 - Ulysses Almeida

