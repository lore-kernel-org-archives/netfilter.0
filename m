From: Ulysses Almeida <ulysses.almeida@gmail.com>
Subject: Re: Two links and a SMTP sever.
Date: Tue, 18 Jan 2005 18:14:18 -0300
Message-ID: <d645356050118131479a9720@mail.gmail.com>
References: <d645356050118053928226673@mail.gmail.com>
	<26550.142.169.215.10.1106081679.squirrel@142.169.215.10>
	<d645356050118125243d12dfb@mail.gmail.com>
	<28693.142.169.215.10.1106083062.squirrel@142.169.215.10>
Reply-To: Ulysses Almeida <ulysses.almeida@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <28693.142.169.215.10.1106083062.squirrel@142.169.215.10>
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

  How can I debug, what happens after mangle PREROUTING. Can I do it
only for packets with src port set to 25? to get a "clear" output?

On Tue, 18 Jan 2005 16:17:42 -0500 (EST), Samuel Jean
<sj-netfilter@cookinglinux.org> wrote:
> >   That's another doubt, dos nat PREROUTING called with syn+ack
> > packets, or only with sym packets?
> 
> the nat table is special, it only sees the first packet
> of a connection.
> 
> All other subsequent packet of this connection get verdict via
> the conntrack. (bypass NAT chains)
> 
  So this conntrack entry is created while my syn packet is going
out.... Can something wrong happening here, and conntrack gives the
wrong veridict?

> 
> Samuel
> 
> 
-- 
 - Ulysses Almeida

