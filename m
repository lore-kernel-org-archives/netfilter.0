From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: Firewall For XANDROS OC
Date: Fri, 15 Jul 2005 08:30:24 -0400
Message-ID: <1121430624.3017.12.camel@localhost>
References: <20050715023349.87338.qmail@web34010.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050715023349.87338.qmail@web34010.mail.mud.yahoo.com>
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
To: Juan Palacios <revelation75214@yahoo.com>
Cc: netfilter@lists.netfilter.org

On Thu, 2005-07-14 at 19:33 -0700, Juan Palacios wrote:
> Hello,
> 
>      I am looking for a simple firewall for xandros
> open circulation that doesn't require programming,
> dos, ect..
> Just a firewall that's easy to install that will work
> on xandros open circulation. Point and click interface
> like SYGATE, ZONE ALARM, ECT..sorry to bother the ip
> tables guys but i figured that you guys would know
> best. I mean if you can handle ip tables im sure you
> guys can handle a interface type firewall with gui.
<snip>
You can search the mail list archives for similar discussion.  I am
aware of fwbuilder (http://www/fwbuilder.org) which is a very powerful
rule creator.  There was another php based project discussed on this
list a while ago but I've forgotten its name.  Many seemed to like it
because of its simplicity  Unlike fwbuilder, it gave direct control over
the rule creation process.  On the other extreme and yet unfinished is
ISCS (http://iscs.sourceforge.net) which isn't a rule configurator at
all.  It looks at the entire environment, user authentication, access
control, VPN, routing, PKI, creates device specific rule sets without
conflict for each of the subsystems and automatically distributes them
to the end devices.

Hope this helps - John
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

Financially sustainable open source development
http://www.opensourcedevel.com


