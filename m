From: Philip Craig <philipc@snapgear.com>
Subject: Re: pptp patch
Date: Fri, 20 Jun 2003 18:43:51 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3EF2C947.3050403@snapgear.com>
References: <84874F5F45111E48B53F4A3314BC4F3C389674@mail.columbuscontainer.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <84874F5F45111E48B53F4A3314BC4F3C389674@mail.columbuscontainer.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Hill, John" <jhill@columbuscontainer.com>
Cc: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

Hill, John wrote:
> I had 3 VPN connections working. When one closed the connection the kernel
> panicked and died. I could not recover the error message. I was forced to
> power off.

If you can follow linux/Documentation/oops-tracing.txt to get the panic
info then this will greatly help debug it.  Otherwise one of the
developers will have to try to reproduce this.


> Has anyone looked at Brian's code to see if it is practical to be
> incorporated by the netfilter team? 

Brian's code has not been maintained for quite a while.  The main reason
that it no longer works for 2.4.21 is that it doesn't support the newnat
framework.  It also has some other design problems.

In theory the current PPTP patch should support everything that Brian's
did, plus a bit more, and the code is also cleaner.  It would be better
to try to get the current PPTP patch to work for you than to try to port
Brian's patch to 2.4.21.

We have 2.4.20 based products for which the current PPTP patch functions
perfectly.  I haven't tried with 2.4.21, but I expect to in the upcoming
weeks.  It is possible that the patch no longer works for 2.4.21.  If you
have time, you could try 2.4.20 to see if this is the case.

-- 
Philip Craig - philipc@snapgear.com - http://www.SnapGear.com
SnapGear - Custom Embedded Solutions and Security Appliances


