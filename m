From: Arvanitis Kostas <arvanit@ellemedia.com>
Subject: Re: please help  me.......
Date: Fri, 19 Sep 2003 12:45:11 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200309191245.12014.arvanit@ellemedia.com>
References: <000101c37e8b$b7342e30$1d01a8c0@pdcindscape.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000101c37e8b$b7342e30$1d01a8c0@pdcindscape.com>
Content-Disposition: inline
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

On Friday 19 September 2003 11:55, Vijay Angelo wrote:
> hi
>  I m one among the member of this list ,i have a problem with
> libiptc...please look after if u can do it.
>  I want to insert one rule using the iptc_insert_entry function in
> libiptc....
>  As i m new to netfilter ,libiptc ..i m struggling  a lot..i hope u
> can help me .
>
>  Just give me an information about how to fill the target information
> in the ip_entry structure ...and the  i  target_offset field ...

Well, using the library is complicated. The functions themselves are 
easy to understand how to call, but the format of a rule is very 
complicated.

It is something like generic data applicable to all rules, then data for 
specific match extensions and then data for any target extension.

However is all allocated and used through structs placed inside opaque 
memory chunks, so it is very difficult to explain in an email.

Your best bet is looking through the code for iptables (iptables.c) and 
the various extensions.

-- 
A: No. See http://www.netmeister.org/news/learn2quote.html
Q: Should I include quotations after my reply ?


