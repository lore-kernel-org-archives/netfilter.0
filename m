From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ipt_string+udp...
Date: Mon, 23 Sep 2002 19:53:11 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020923185316.FDBL27185.mta03-svc.ntlworld.com@there>
References: <48364.66.46.161.131.1032804726.squirrel@www.funio.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <48364.66.46.161.131.1032804726.squirrel@www.funio.com>
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
To: netfilter@lists.netfilter.org

On Monday 23 September 2002 7:12 pm, Mark Steele wrote:

> Doh!
>
> My bad, disregard the last post I sent. Removing the dot
> fixed the problem. Just to enlighten me a bit, what
> string would I use if I wanted to use the whole
> domain name?

It depends on the domain name you're trying to match.

Suppose you're looking up www.domain.org

There's a binary value immediately before each part of the name you're 
resolving (www, domain, and org), which is the number of characters in that 
part of the name.

Therefore in this case the string is: 0x03 w w w 0x06 d o m a i n 0x03 o r g

If you were resolving lists.netfilter.org it would be:
0x05 l i s t s 0x09 n e t f i l t e r 0x03 o r g

Antony.

-- 

Most people are aware that the Universe is big.

 - Paul Davies, Professor of Theoretical Physics

