From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: martians from myself?
Date: Sun, 15 Sep 2002 10:24:37 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020915092440.LQGI14766.mta05-svc.ntlworld.com@there>
References: <1031927325.15445.3.camel@rayw>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1031927325.15445.3.camel@rayw>
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
To: netfilter@lists.samba.org

On Friday 13 September 2002 3:28 pm, Raymond Leach wrote:

> Hi
>
> Can someone tell me what would cause this:
>
> Sep 13 16:32:07 firefly kernel: martian source 108.122.0.0 from
> 127.0.0.75, on dev eth2
> Sep 13 16:32:07 firefly kernel: ll header:
> 00:01:02:50:b8:9e:08:00:20:a5:04:26:08:00
>
> The MAC address in the ll header is the interface on my firewall.

1. Do you recognise the address 108.122.0.0 ?   Is it an address you use on 
your network, or in your rules ?

2. What client / server processes do you have running on firefly ?

3. What SNAT rules do you have in your OUTPUT or POSTROUTNG chains ?

4. What addresses do you have assigned to the interfaces on firefly ?

You might want ot add some LOGging rules to your INPUT or OUTPUT chains to 
look for this source address, and see what protocol is in the packets - that 
might help to identify what service is generatng them.

I know this isn't an answer to your question, but I hope it helps you find 
out the answer...

Antony.

-- 

Never write it in Perl if you can do it in Awk.
Never do it in Awk if sed can handle it.
Never use sed when tr can do the job.
Never invoke tr when cat is sufficient.
Avoid using cat whenever possible.

