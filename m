From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Problem compiling iptables 1.3.3 w/kernel 2.6.13-15
Date: Thu, 20 Oct 2005 10:29:31 -0500
Message-ID: <200510201029.31214.rob0@gmx.co.uk>
References: <NEBBLLCNFOFHMALJMDDEIENMBBAB.pablo@blueoakdb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <NEBBLLCNFOFHMALJMDDEIENMBBAB.pablo@blueoakdb.com>
Content-Disposition: inline
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

On Thursday 2005-October-20 09:55, Pablo Sanchez wrote:
> I haven't had any follow ups to the above post.  I'm wondering if
> it's because it's such a silly question or whether it's out of the
> scope of the list.

I can only speak for myself. I have always just used the iptables 
provided by the distribution. I have never seen any of the p-o-m or 
other such goodies as being worth the hassle. I definitely would not 
want L7. If I needed such control I would use proxy servers and just 
block all outbound routing.

Also, I have seldom had any problem compiling things according to the 
developer's instructions. But then, I use Slackware. It is quite likely 
that SuSE has changed things. I think your issue is perhaps one for a 
SuSE forum or SuSE support.

The answer might be found in the depths of your Makefile. Find out what 
it is doing.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

