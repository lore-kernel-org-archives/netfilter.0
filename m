From: "Erik Bourget" <erik@midmaine.com>
Subject: Re: Three kernel Oops/panic/BUG ksymoopses (kernel BUG at buffer.c:539)
Date: Mon, 29 Mar 2004 16:40:45 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <014a01c415a4$33983750$d100000a@sbs2003.local>
References: <Pine.LNX.4.44.0401031352040.2301-100000@poirot.grange>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Class: urn:content-classes:message
In-Reply-To: <Pine.LNX.4.44.0401031352040.2301-100000@poirot.grange> (Guennadi Liakhovetski's message of "Sat, 3 Jan 2004 13:54:27 +0100 (CET)")
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
To: Administrator
Cc: linux-kernel@vger.kernel.org, netfilter@lists.netfilter.org

Guennadi Liakhovetski <g.liakhovetski@gmx.de> writes:

> On Fri, 2 Jan 2004, Erik Bourget wrote:
>
>> I had a very bizarre situation where four boxes in the same rack all
>> simultaneously (within 30 minutes) hard-locked with Oops messages.  The
>> boxes
>
> An obvious idea - after reading an article about a break-in into Debian
> and others' boxes - sure you weren't cracked?

Yeah, that was a concern and I'm relatively sure that's not the case because

*) chkrootkit says so (mod some hidden processes that are reported by a bug in
 chkrootkit according to Google)

*) The crashy boxes were all installed with 2.4.23, not upgraded, so the big
 Debian vulnerability didn't exist

*) The only open ports to the outside world are running SMTP and POP3 as
 non-root no-shell accounts, and it's running qmail which seems simple and
 safe enough.

- Erik Bourget

