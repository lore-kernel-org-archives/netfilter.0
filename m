From: shaun <shaun@newfind.net>
Subject: libiptc and adding a simple SNAT rule
Date: Mon, 17 Jun 2002 08:59:16 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020617085916.A1493@localhost.sd.cox.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

Hello -

I'm building an app that will dynamically modify rules in the POSTROUTING chain
in the nat table (SNAT).  I can iterate through the list and remove chain
entries ok so far, and I have some example code that successfully appends a
'blank' rule to the chain.  

But when I try to iptc_append_entry a simple but specific rule I've created in
my app to the chain, I get an error on the iptc_commit.  

In my app, I can compare (what should be) an identical rule as created by
running /sbin/iptables vs. the struct ipt_entry I'm trying to append and the
only difference I see is a difference in the target offset size.  Evidently,
I'm supposed to add some data to the end of the struct ipt_entry.

So my question:  What am I supposed to tack on to the end of the struct
ipt_entry when constructing and appending a non multi-range SNAT rule?

Thanks.

-- 
Shaun McIntyre
shaun@newfind.net
(760) 230-1131 voice
(619) 665-1424 cell

