From: Ulysses Almeida <ulysses.almeida@gmail.com>
Subject: Re: Two links and a SMTP sever.
Date: Wed, 19 Jan 2005 09:26:32 -0300
Message-ID: <d645356050119042639935f07@mail.gmail.com>
References: <d645356050118053928226673@mail.gmail.com>
	<26550.142.169.215.10.1106081679.squirrel@142.169.215.10>
	<d645356050118125243d12dfb@mail.gmail.com>
	<28693.142.169.215.10.1106083062.squirrel@142.169.215.10>
	<d645356050118131479a9720@mail.gmail.com>
	<41ED8777.2050604@cookinglinux.org>
Reply-To: Ulysses Almeida <ulysses.almeida@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41ED8777.2050604@cookinglinux.org>
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
To: Samuel Jean <sj-netfilter@cookinglinux.org>
Cc: netfilter@lists.netfilter.org

On Tue, 18 Jan 2005 17:02:31 -0500, Samuel Jean
<sj-netfilter@cookinglinux.org> wrote:
> 
> As I said, did you enable this ? :
> 
>   CONFIG_IP_NF_NAT_LOCAL
> 

Yes CONFIG_IP_NF_NAT_LOCAL=y

  I did put some -j LOG on target host. Tried a telnet to cited host
on port 25. On
target's host everything looks right. I get the packets from the right
ip (link(2)). But it still disapper after mangles PREROUTING. Maybe
i'm missing something on second routing table.... I'll try to find
out.

  It's strange, because I have other host, with this really same
solution, and everything works fine.


-- 
 - Ulysses Almeida

