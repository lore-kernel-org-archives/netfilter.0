From: Payal Rathod <payalrathod@gmail.com>
Subject: Re: MASQUERADE
Date: Tue, 13 Jul 2004 00:15:24 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <f51b72bc04071211457eb8b84@mail.gmail.com>
References: <f51b72bc040708204912ab0cc7@mail.gmail.com> <20040709103513.GA18894@itstud.chalmers.se> <200407091151.01620.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407091151.01620.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.netfilter.org>

Hi,

On Fri, 9 Jul 2004 11:51:01 +0100, Antony Stone
<antony@soft-solutions.co.uk> wrote:
 
> Sure, if you want to use a new feature you didn't previously build, you need
> to recompile the kernel and do a reboot, but in most cases that should be (a)

The issue was that iptables was not started (???). I had to do
/etc/init.d/iptables start and then it worked pretty well.

Now any ideas why?
-Payal

