From: "Muffadal Essaji" <muffadal.essaji@intafrica.com>
Subject: Re: vpn help from tanzania.
Date: Wed, 7 May 2003 12:30:49 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000801c3147b$58d14af0$0223a8c0@satconet.com>
References: <006c01c31357$a1565ce0$6400a8c0@homes> <200305061135.30694.lyra@fastwebnet.it> <001001c313cd$662b19f0$6400a8c0@homes> <200305070937.29059.lyra@fastwebnet.it>
Reply-To: "Muffadal Essaji" <muffadal.essaji@intafrica.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: xchris <lyra@fastwebnet.it>
Cc: netfilter@lists.netfilter.org

Hi ..
Please can you help me to configure the vpn in linux i m very new and i
don't  anything .
i using redhat linux 9.0 if u need any kernal patch up.
yours
muffadal.
----- Original Message -----
From: "xchris" <lyra@fastwebnet.it>
To: <netfilter@lists.netfilter.org>
Cc: "Voltaire Pascual" <voltaire@voltaire.servebeer.com>
Sent: Wednesday, May 07, 2003 10:37 AM
Subject: Re: VPN Issue - help


> On Tuesday 06 May 2003 14:45, Voltaire Pascual wrote:
>
> > Hi Chris,
> >
> > Here's my configuration:
> >
> CUT
>
>
> OK.
> Now it's more clear.
>
> Stupid question...
> did yoy try disabling firewall and enabling ip_forward?
>
> you should have all chains with policy ACCEPT and ip_forward to 1.
>
> If it goes... your problem is related to your firewall scripts,otherwise
it's
> a iptables problem.
>
> More stupid question (just to be sure)
>
> I guess this box is the default gateway for your lan. right?
> (you reach the internet natted by this box)
>
>
> To be honest i always prefer to give vpn remote client different IP...
> (for example.. 192.168.1.x) to be more clear... but this is not the
problem!
>
> Let me know.
> bye
> xchris


