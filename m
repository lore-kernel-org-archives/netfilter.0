From: Nox <pheusion@snet.net>
Subject: [Fwd: Re: POM woes]
Date: Wed, 24 Sep 2003 17:15:15 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1064438115.27142.186.camel@shaolin.gridlocksecurity.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-lRZDi0VmSJhFOmgCm3LG"
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
To: netfilter@lists.netfilter.org


--=-lRZDi0VmSJhFOmgCm3LG
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

resent dude to address error

--=-lRZDi0VmSJhFOmgCm3LG
Content-Disposition: inline
Content-Description: Forwarded message - Re: POM woes
Content-Type: message/rfc822

Subject: Re: POM woes
From: Nox <pheusion@snet.net>
To: Stack Buffer <black_merkury@yahoo.com>
Cc: netfilter@list.netfilter.org
In-Reply-To: <20030924204804.56388.qmail@web60110.mail.yahoo.com>
References: <20030924204804.56388.qmail@web60110.mail.yahoo.com>
Content-Type: text/plain
Message-Id: <1064437740.27142.180.camel@shaolin.gridlocksecurity.com>
Mime-Version: 1.0
X-Mailer: Ximian Evolution 1.4.4 
Date: Wed, 24 Sep 2003 17:09:00 -0400
Content-Transfer-Encoding: 7bit

Off the top of my head, I would say the patch-o-matic is failing due to
the patch being for 2.4.21 and you have 2.4.20-8, although I thought
this patch was for stock 2.4.20 - 2.4.21 kernels.

What I do know is 2.4.21 => kernel src already has these updates.

Let me investigate your error, and Ill get back to you,

what I would do if it were me though, I would upgrade kernel to 2.4.21,
then try patch-o-matic again. (Only as a pressed for time reasons)

Ill let you know what I find

Nox
GenMicro Systems

On Wed, 2003-09-24 at 16:48, Stack Buffer wrote:
> Greetings Nox,
> Thank u very much for the advice.
> I recently tried checking out what this POM stuff was
> all about and to see if I could apply any patches.
> Well I did according to what the Netfilter Extension
> HOWTO instructed, namely:
> 
> 1). Get the latest CVS tree, by doing (taken from
> HOWTO)..
> 
> # cvs -d :pserver:cvs@pserver.netfilter.org:/cvspublic
> login
> 
> (When it asks you for a password type `cvs').
> 
> # cvs -d :pserver:cvs@pserver.netfilter.org:/cvspublic
> co netfilter/userspace netfilter/patch-o-matic
> 
> 2). Second I did the following to state my kernel src
> dir..
> 
> # export KERNEL_DIR=/usr/src/linux-2.4.20-8
> 
> 3). # cd /usr/src/linux/
>     # make dep
> 
> 4)# ./runme extra
> 
> Actually my problem is at stage 4, the output says..
> 
> Do you want to apply this patch [N/y/t/f/a/r/b/w/q/?]
> y
> Testing patch submitted/03_2.4.21.patch...
> Failed to patch copy of /usr/src/linux-2.4.20-8/
> TEST FAILED: patch NOT applied.
> 
> [Press enter to continue]....
> 
>  As u can see somethng is wrong, even worse when press
> return it just keeps cycling thru the same above entry
> :( . Is the patch number somehow related to my kernel
> version number??. What can I do from here
> I would really appreciate any help on the above.
> Thanking u for ur time
> Stack..
> 
> __________________________________
> Do you Yahoo!?
> Yahoo! SiteBuilder - Free, easy-to-use web site design software
> http://sitebuilder.yahoo.com

--=-lRZDi0VmSJhFOmgCm3LG--


