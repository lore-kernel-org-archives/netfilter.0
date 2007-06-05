From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: SNAT before IPSec
Date: Tue, 05 Jun 2007 09:36:59 -0500
Message-ID: <4665750B.9020805@riverviewtech.net>
References: <8bd3dfad0706050529s484d42b6t9ef4ae0fd1730367@mail.gmail.com>
Reply-To: gtaylor+reply@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <8bd3dfad0706050529s484d42b6t9ef4ae0fd1730367@mail.gmail.com>
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
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

On 06/05/07 07:29, noa levy wrote:
> SNAT takes place in POST_ROUTING. Can IPSec be applied after that? I
> have read that after IPSec the packet gets injected to LOCAL_OUT
> again, but when does the actual IPSec policy decision take place?
> Won't it happen *before* SNAT? Can I control it?

Last I looked (it's been a while) the basic methodology at the time was 
that (unencrypted) traffic would pass through the kernel like regular 
traffic.  Then after everything else was done it would be encrypted and 
looped back through the system in its encrypted form.  So what you would 
do is selectively do what ever you wanted to do to the traffic before it 
was encrypted by matching that traffic with filters.  In short, do what 
ever you want to with the clear text traffic, then do what ever you want 
with cypher text traffic.

There use to be a series of patches that needed to be applied to the 
kernel to make this packet flow possible.  I do not know if these 
patches are still required or not, though I would expect it to be main 
line by now.

Can / will any one confirm / refute this please?



Grant. . . .

