From: Martijn Lievaart <m@rtij.nl>
Subject: Re: Problems configuring iptables
Date: Wed, 23 Aug 2006 21:18:22 +0200
Message-ID: <44ECA9FE.30605@rtij.nl>
References: <580B00011E6B2F4980CAC67A08FECC3AF765CE@rpo.oldplacerville.csvaluation.lan>	<44EC95B0.1090808@ncemch.org>
	<44EC966C.6000002@ncemch.org> <44EC9CE0.10308@rtij.nl>
	<44ECA54A.2000905@ncemch.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44ECA54A.2000905@ncemch.org>
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
To: Matt Singerman <msingerman@ncemch.org>
Cc: netfilter@lists.netfilter.org

Matt Singerman wrote:

> This did work, yes!  Thanks!  I am experiencing a new problem, though: 
> it took an extremely long time for the connection to go through.  Once 
> it connected, it runs at normal speed, but it took a good 30 or 40 
> seconds for ssh to prompt me for my password.  What could be causing 
> this?  I am guessing it is some sort of routing issue?
>
Ah no. It's either reverse DNS or ident that trips you up. Ethereal is 
your friend, look what goes on "at the wire".

M4

