From: Samuel Jean <sj-netfilter@cookinglinux.org>
Subject: Re: netfilter accounting by stateful session
Date: Mon, 31 Jan 2005 20:07:32 -0500
Message-ID: <41FED654.5080606@cookinglinux.org>
References: <20050131020647.30751.qmail@web54405.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20050131020647.30751.qmail@web54405.mail.yahoo.com>
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
To: Vincent Chen <vctw@yahoo.com>
Cc: netfilter@lists.netfilter.org

Vincent Chen wrote:
> Hi, all

Hi Vincent,

> 
> I have been looking around for accounting solution by stateful session.
> FreeBSD's ipfilter have done a pretty good job. Can netfilter do that?

Of course, search for 'ctstat' which is a conntrack accounting tool.
IIRC, you may or may not need a patch for your conntrack, depending on
the linux kernel release you have.

> 
> 
> Thanks,
> 
> Vincent Chen
> 
HTH,

Samuel


