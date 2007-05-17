From: "Mike C" <smith.not.western@gmail.com>
Subject: Re: TCP RST vulnerability - handling question
Date: Fri, 18 May 2007 11:34:58 +1200
Message-ID: <bd0eabd0705171634wc4b54k8fa75afe3992adfa@mail.gmail.com>
References: <bd0eabd0705161756q79024a91y74a132e34616c7fa@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=LQScmTGaYpK7CxmXAYRqe9ckjU6Gjdlf8/cNlQl5RplpUcpAvj5LZ4urIz0Kw/H4mWekDos0bZcyixpbHvgjDIp2pidJ3fIclHADJY7Msy1GaiuJMQMvN6FJVv01jcEe2lrnLP16hRV3AV9zyS7s1xpEVPQEcdsxKhWQWoYDkbw=
In-Reply-To: <bd0eabd0705161756q79024a91y74a132e34616c7fa@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

On 5/17/07, Mike C <smith.not.western@gmail.com> wrote:
> I am using an iptables 1.3.5 based setup and wonder if there are any
> tools or techniques available to prevent or mitigate the TCP RST
> spoofing issue (http://osvdb.org/displayvuln.php?osvdb_id=4030)

I just realised that I posted the wrong issue. The one I am referring
to is where a third party sends a RST with a sequence number less than
the current window, which is still treated as a valid RST by the end
point.

From http://www.securityfocus.com/archive/1/361009 - "the 4.4BSD stack
from which NetBSD's stack is derived, did not even check that a RST's
sequence number was inside the window. RSTs anywhere to the left of
the window were treated as valid."

I should outline my situation a bit more. I have a firewall that I
want to prevent passing illegal RST packets to an inside host. In my
case the host is patched against this issue, but this may not always
be the case, so need to stop the invalid resets from traversing the
firewall in the first place.

Regards,

Mike

