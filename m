From: Aleksandar Milivojevic <alex@milivojevic.org>
Subject: Re: issue with 'gre' over nat
Date: Mon, 14 Aug 2006 22:29:48 -0500
Message-ID: <44E13FAC.4040305@milivojevic.org>
References: <OF9E9DDECA.67360F0D-ON832571C7.004F26DB-832571C7.005F0D4F@powers.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-reply-to: <OF9E9DDECA.67360F0D-ON832571C7.004F26DB-832571C7.005F0D4F@powers.com.br>
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
To: netfilter@lists.netfilter.org

thiago@powers.com.br wrote:
> Any known issues about it ? Or did I missed something ? Maybe connectiong 
> tracking timeout is too long ? I don't believe or have knowledge of 
> something at the remote that could generate this kind of situation, as all 
> that the remote host knows about me is my public ip address and the mac 
> address of my gateway's internal interface...

I haven't been using "latest and greatest" kernels recently.  More or 
less 2.6.9 as packaged in RHEL4/CentOS4 with bunch of backported 
patches.  So I don't know if some of these problems were solved in 
mainstream.  I do remember being told on this mailing list that 
GRE/IPSec related bugs are very hard to fix and would take some time and 
major kernel overhaul until that part works correctly.  For example, 
they'll never be fixed in RHEL4 since apperently the fix would break the 
ABI -- that's what I was told on Red Hat's bugzilla.  It was some months 
ago, so take this with a grain of salt, some of the problems might have 
been fixed in the meantime (in the mainstream kernel).

My experience in mixing GRE (and/or IPSec) with Netfilter isn't that 
great.  There's bunch of problems with it.  Some are related to 
connection tracking, some are that packets don't traverse all the chains 
they were supposed to traverse.  I have a problem kind of opposite from 
yours, that Netfilter on VPN host would "forget" about connections 
inside GRE or IPSec (resulting in frozen TCP sessions).  It could easily 
be that your problems have same root as mine.


