From: Sven Riedel <sr@gimp.org>
Subject: Re: ipt_string problems and FAQ
Date: Wed, 3 Sep 2003 10:43:52 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030903084352.GB5028@localnet>
References: <200308271319.29439.tabris@tabris.net> <Pine.LNX.4.51.0309011300560.32229@dns.toxicfilms.tv>
Reply-To: sr@gimp.org
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.51.0309011300560.32229@dns.toxicfilms.tv>
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
To: netfilter@lists.netfilter.org

On Mon, Sep 01, 2003 at 01:03:48PM +0200, Maciej Soltysiak wrote:
> Hi,
> > ask where this FAQ entry is...
> http://www.netfilter.org/documentation/FAQ/netfilter-faq-3.html#ss3.14

Ok, slightly off topic to this thread, but I still need to know from
that faq entry:
QUOTE
Please do not use the string match from patch-o-matic instead of
application proxy filtering. It would be defeated anytime by fragmented
packets (i.e. an HTTP request split on two TCP packets), 
ENDQUOTE

I thought iptables collects all fragments and reassembles the packet
before applying any rules? Or am I dead wrong here? 

Regs,
Sven
-- 
Sven Riedel                      sr@gimp.org
Liebigstr. 38 
30163 Hannover                  "Python is merely Perl for those who
                                 prefer Pascal to C" (anon)

