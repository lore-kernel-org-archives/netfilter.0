From: Samuel Jean <sj-netfilter@cookinglinux.org>
Subject: Re: Customizing LOG output
Date: Mon, 24 Jan 2005 21:03:01 -0500
Message-ID: <41F5A8D5.7010608@cookinglinux.org>
References: <20050125013235.210362000C@ws1-1a.us4.outblaze.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050125013235.210362000C@ws1-1a.us4.outblaze.com>
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
To: Josh Larocque <joshlarocque@technologist.com>
Cc: netfilter@lists.netfilter.org

Josh Larocque wrote:
> Is there a way to change the data the the LOG module outputs?  As it stands right now it's printing IN, OUT, MAC, SRC, DST, LEN, TOS, PREC, TTL, ID, PROTO, SPT, DPT WINDOW, RES and UGRP... all taking up about 2 and a half lines on the screen for each entry. I'd like to get it down to a one-liner if possible.
> 

Yes, hack at net/ipv4/netfilter/ipt_LOG.c by editing those printk's.

Don't forget to recompile this module and also rmmod ipt_LOG.

> Thanks,
> 
> Josh
> 

HTH,

Samuel

