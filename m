From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: iptables and pop3 lockup
Date: Thu, 18 May 2006 07:25:35 +0200
Message-ID: <000c01c67a3b$7e0b3280$0101000a@sterenborg.info>
References: <57F9959B46E0FA4D8BA88AEDFBE582901676DB@pxtbenexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <57F9959B46E0FA4D8BA88AEDFBE582901676DB@pxtbenexd01.pxt.primeexalia.com>
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
To: "'Netfilter List (E-mail)'" <netfilter@lists.netfilter.org>

> Glad to here that worked for you.
> 
> As for getting connection tracking to work I'll defer that to
> others on the list.  I'm have a similar problem on a Fedora Core 2
> virtual instance that we lease offsite for a project.  In that case
> everything was statically linked but I can't use any of the loaded
> modules (or better said they don't work).  But for me it wasn't
> critical so I just gave up on it. 

The OP could build a new kernel from kernel.org and see if the problem
goes away. You can't take advantage of the RH kernel updates anymore if
you do this but so far only the FC2 kernel seems to have this problem.
Of course, if this is a production site then it is not really an option
but then perhaps a test-server could be built.


Gr,
Rob


