From: Jason Opperisano <opie@817west.com>
Subject: Re: Linux kernel module and -m owner match
Date: Thu, 16 Sep 2004 08:41:51 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1095338510.2045.20.camel@wolfpack.ljm.dom>
References: <20040916113433.35523.qmail@web21003.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040916113433.35523.qmail@web21003.mail.yahoo.com>
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

On Thu, 2004-09-16 at 07:34, Nicolas Boiteux wrote:
> yep , i use the kernel of kernel.org . But, in fact
> since the 2.4.23, i use the same .config file . 
> 
> I copy the oldone it in the /usr/src/linux-2.4.x and
> override the new one . Is it a bad way to do like that
> ?

do you have:

        CONFIG_EXPERIMENTAL=y
        
set?  if not--you won't get prompted for the owner match.

-j

-- 
Jason Opperisano <opie@817west.com>


