From: "Michael P. Soulier" <michael_soulier@mitel.com>
Subject: Re: simply confusing
Date: Thu, 23 Jan 2003 15:18:09 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030123151809.B8675@e-smith.com>
References: <20030123200314.99399.qmail@web11401.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20030123200314.99399.qmail@web11401.mail.yahoo.com>; from mrchucho@yahoo.com on Thu, Jan 23, 2003 at 12:03:14PM -0800
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On 23/01/03 Ralph Churchill did say:

> I work at a large company and was having some fellow
> employees regularly scanning my box... so I put up a
> little firewall. Here's my one and only rule:
> 
> iptables -A INPUT --source 192.168.0.0/16 -j DROP
> 
> Now, shouldn't that block any and ALL traffic from any
> computer on the 192.168.*.* subnet? Do I need to be
> more explicit? I also have snort running and I see
> some stuff getting through... Thanks.

    You'll see it with a sniffer regardless. That's a good thing. If you
want to see what it's dropping, jump to a chain that logs it, and then
drops it. 

    Mike

-- 
Michael P. Soulier <michael_soulier@mitel.com>, 613-592-2122 x2522
SME Solutions, Mitel Networks Corporation
"...the word HACK is used as a verb to indicate a massive amount
of nerd-like effort."  -Harley Hahn, A Student's Guide to Unix

