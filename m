From: mailinglists@belfin.ch
Subject: RE: AW: default policy
Date: Sun, 3 Nov 2002 11:42:26 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <31347F3CE518D6118ACB00A0246AD0560B240C@mx.snizek.ch>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
Content-Transfer-Encoding: 7bit
To: "'Robert P. J. Day'" <rpjday@mindspring.com>, netfilter mailing list <netfilter@lists.netfilter.org>



> perhaps i missed an earlier response to this, but what is the
> effect of setting a DROP policy on a nat or mangle chain?
> does this mean that any packet that matches a mangle or nat rule
> will be, not mangle'd or nat'ed, but dropped?  

yes.
 
> sorry if this question has an obvious answer, but assigning a
> default policy to anything but the filter table is woefully
> under-documented.

It doesn't has to be. Take a look at how packets traverse the filter. 

Philipp


