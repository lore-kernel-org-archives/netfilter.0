From: "Andrew E. Mileski" <andrewm@isoar.ca>
Subject: Re: pptp-conntrack-nat.
Date: Wed, 05 May 2004 01:10:05 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4098772D.3030003@isoar.ca>
References: <2BE915A69EF4D2119A0800805FF5E0501F14EA44@brspm201.exbr01.exch.eds.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <2BE915A69EF4D2119A0800805FF5E0501F14EA44@brspm201.exbr01.exch.eds.com>
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
To: netfilter@lists.netfilter.org

Ampugnani, Fernando wrote:
> Hi all,
> 	I tried apply the patch pptp conntrack on 3 different kernel
> versions. None of them worked for me. I tried on 2.4.14, 2.4.21 and 2.4.26.
> The patch is not getting applied cleanly on any of these.Could anyone please
> tell me with which kernel version this patch works?

[This might be a dupe, as my addressbook had the wrong address]

I'm using 2.4.22-1.nptl from Fedora.  I'd use newer, but this
is what my company's products are currently using.

If it will help, I can make the kernels available.  I've compiled
for all x86 arch's, and have a modified iptables (required) as
well.  Or you can use my SRPM and compile your own.

-- 
Andrew E. Mileski


