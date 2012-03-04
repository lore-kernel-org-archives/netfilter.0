From: Kerin Millar <kerframil@gmail.com>
Subject: Re: Xen and netfilter
Date: Sun, 04 Mar 2012 04:21:47 +0000
Message-ID: <jiuqkr$gju$1@dough.gmane.org>
References: <1330812708.2053.8.camel@huxley.cinosure.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1330812708.2053.8.camel@huxley.cinosure.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 03/03/2012 22:11, Jonathan Gowar wrote:
> Hi there,
>
>    I've been advised to contact you guys in order to resolve an issue in
> the system log files when using netfilter with Xen.  It's with humility
> that I ask, as I can not say with authority where the problem lies.
>
> I get many of these logs, so much so that I can't see any other errors.
>
> Mar  2 13:31:07 esme-grace kernel: [98068.833692] physdev match: using
> --physdev-out in the OUTPUT, FORWARD and POSTROUTING chains for
> non-bridged traffic is not supported anymore.
> Mar  2 13:31:07 esme-grace kernel: [98068.833697] physdev match: using
> --physdev-out in the OUTPUT, FORWARD and POSTROUTING chains for
> non-bridged traffic is not supported anymore.
>
> I found a link on Xen Wiki, which has gone some way to repress the
> issue, but there are still a few that crop up.
>
> http://wiki.xensource.com/xenwiki/XenNetworking#head-602e26cd4a03b992f3938fe1bea03fa0fea0ed8b
>
> It's also been suggested to me to ask, either a) to remove the
> informal messages, or ideally b) suppressing the messages if the rule in
> question is doing bridged traffic.
>

Apparently, the issue is with the vif-common.sh script. The fix is to 
add --physdev-is-bridged to the offending rules so that only bridged 
traffic is considered.

http://xenbits.xensource.com/hg/xen-unstable.hg/rev/b0fe8260cefa

--Kerin

