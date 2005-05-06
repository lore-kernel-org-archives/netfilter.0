From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: FTP access from outside
Date: Fri, 06 May 2005 11:37:03 +0200
Message-ID: <427B3ABF.3060409@mnemon.de>
References: <200505051437.j45EbauW006066@eden.inf.ed.ac.uk>	<200505051048.35097.dyioulos@firstbhph.com>	<1115305613.7527.15.camel@plasma.starken.com>
	<200505051118.42873.dyioulos@firstbhph.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200505051118.42873.dyioulos@firstbhph.com>
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

Dimitri Yioulos schrieb:
[snip]

> ... how do I install the 
> modules permanently?
> 

Compile it into the kernel, meaning: make shure during kernel
configuration that there is "[*]" or "<*>" and not "<M>" in front of the
respective option (assuming "make menuconfig").

If you don't like this, you can configure your runlevel(s) to execute a
script, that loads the module(s).

Have a nice time,

Joerg


