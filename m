From: Samuel Jean <sj-netfilter@cookinglinux.org>
Subject: Re: Two links and a SMTP sever.
Date: Tue, 18 Jan 2005 17:02:31 -0500
Message-ID: <41ED8777.2050604@cookinglinux.org>
References: <d645356050118053928226673@mail.gmail.com>	<26550.142.169.215.10.1106081679.squirrel@142.169.215.10>	<d645356050118125243d12dfb@mail.gmail.com>	<28693.142.169.215.10.1106083062.squirrel@142.169.215.10>
	<d645356050118131479a9720@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <d645356050118131479a9720@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ulysses Almeida <ulysses.almeida@gmail.com>
Cc: netfilter@lists.netfilter.org

Ulysses Almeida wrote:
>   How can I debug, what happens after mangle PREROUTING. Can I do it
> only for packets with src port set to 25? to get a "clear" output?

If you are willing to debug, use TRACE target from pom. (at least 2 
patches are needed).

> On Tue, 18 Jan 2005 16:17:42 -0500 (EST), Samuel Jean
> <sj-netfilter@cookinglinux.org> wrote:
>>All other subsequent packet of this connection get verdict via
>>the conntrack. (bypass NAT chains)
>>
> 
>   So this conntrack entry is created while my syn packet is going
> out.... Can something wrong happening here, and conntrack gives the
> wrong veridict?

As I said, did you enable this ? :

  CONFIG_IP_NF_NAT_LOCAL

Cheers,

Samuel

