From: "Josh Berry" <josh.berry@linknet-solutions.com>
Subject: Re: connlimit / iplimit patch
Date: Fri, 3 Oct 2003 14:35:09 -0500 (CDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <54325.204.214.145.6.1065209709.squirrel@mail.linknet-solutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
To: brett.Mueller@csepp.net
Cc: netfilter@lists.netfilter.org

I figured out the issue after a lot of trial and error.  I had to edit the
Makefile under the extensions directory for the iptables source.  I also
had to go to the CVS and download the libipt_connlimit.c code and stick it
in the extensions directory.  In the Makefile, edit the PF_EXT_SLIB: line
(about the 8th down), where you see a list of the other extensions (ah
conntrack dscp ecn esp helper etc...).  Somewhere in there add connlimit.

At this point you should be able to compile iptables and use the connlimit
match as long as you have already patched the kernel and compiled it
properly.

Hope this Helps

