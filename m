From: "Rob Sterenborg" <rsterenborg@xs4all.nl>
Subject: RE: Getting rid of the masses of ip_conntrack messages
Date: Sun, 1 Dec 2002 23:03:11 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000701c29985$70c69dc0$0401000a@robbysan.org>
References: <20021201205710.GA3239@davinci>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021201205710.GA3239@davinci>
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
To: 'Othmar Pasteka' <pasteka@kabsi.at>
Cc: netfilter@lists.netfilter.org

> Yes, maybe I didn't make myself clear, but here again, how can I
> suppress such messages?

Sorry, I don't think I can really help you here.

In the kernel source (2.4.20), ip_conntrack_core.c on line 969 says
that this is a KERN_WARNING message.
I guess you could suppress those messages using your syslog.conf, but
I don't think you want that as I think that you will also be *not*
logging these messages from other software.

(I have *not* said the following, and this is *not* the solution :
A really dirty thing what *might* work is to comment out the
printk(...) line and recompile your kernel.
Again you might miss other messages that you do want in your logfile
since the section is talking about "helper" things : there is more
than 1 helper and you may use multiple of 'm.
I can't see what effect it would have if you did this !)


Rob


