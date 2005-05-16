From: "Frank Abel" <frankabel@tesla.cujae.edu.cu>
Subject: Re: Mangling IP Options fields
Date: Mon, 16 May 2005 08:58:39 -0700
Message-ID: <002d01c55a30$2063f940$7b0e10ac@hegel>
References: <42889068.4010307@hoole.biz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

Hi all!
You don't want "to alter the netfilter/iptables code", libipq can resolve
your problem if you dont't want high speed or if you only need you mangle
some packet. besides you can uses libipq to prototype the final
implementation. Look up in this list messages which have in subject the word
libipq. Other source of information is man libipq. In the web there is many
examples of programs that alter the IP header.

Salute
Frank Abel

----- Original Message ----- 
From: "Quinton Hoole" <quinton@hoole.biz>
To: <netfilter@lists.netfilter.org>
Sent: Monday, May 16, 2005 5:22 AM
Subject: Mangling IP Options fields


> Hi
>
> This newbie needs to add and/or rewrite data in the IP Options fields.
> The MANGLE chain looks like the place to do this, but I don't see the
> appropriate target extensions to achieve it.  It seems easy to mangle
> most other fields (DSCP, ECN, TOS, TTL etc) but no mention of the
> OPTIONS fields.
>
> Is mangling of IP options fields supported by netfilter/iptables?
>
> If not, I'm going to have to make it happen some how.  Any pointers
> towards the recommended approach in this regard would be appreciated.
> I'm assuming that I'll have to alter the netfilter/iptables code
> appropriately, which is not a problem.
>
> Thanks in advance...
>
> Quinton
>






