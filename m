From: Michael Leun <netfilter@newton.lahn.de>
Subject: Re: kernel 2.6 ipsec and DNAT
Date: Fri, 10 Sep 2004 08:13:22 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040910081322.1a2e843a@xenia.leun.net>
References: <ED78BD9E-FDCA-11D8-8A26-000A95BDFB08@equation.fr>
	<20040903223115.GP3169@samad.com.au>
Reply-To: mlist-20040910@newton.leun.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040903223115.GP3169@samad.com.au>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello,

On Sat, 4 Sep 2004 08:31:15 +1000
Alexander Samad <alex@samad.com.au> wrote:

> > The problem I am encountering now is that it seems that DNAT is not 
> > working when the d-natted session is from a tunneled site. My settup
> > is 
[...]
> > Is there any problem like this under the current 2.6.8 kernel ? Do
> > you have any idea to try to bypass the problem ?


> This is a known problem with netfilter and 2.6 and ipsec with the
> native stack, there are fixs in pom-ng (Patch o matic), but this means
> building your own kernel as it patches the kernel and the netfilter
> modules.  Not to bad though, been doing this for a while and haven't
> had any majour problems

But, as far as I know, the patches in pom-ng (even cvs) do not work
since 2.6.7.

I mailed the author of this patches (Patrick McHardy) and he told me two
times he is going to fix this RSN(tm) - but unfortunately does seem to
have not had time to do it yet.

Have I overlooked something, or is there indeed no working solution for
2.6.8? Has anybody fixed the patches?

-- 
Bye,

Michael Leun


