From: Chicken of the Apocalypse <satehen@btinternet.com>
Subject: Re: iptables stop/start vs restart ...
Date: Thu, 29 Sep 2005 16:54:26 +0100 (BST)
Message-ID: <20050929155426.89779.qmail@web86503.mail.ukl.yahoo.com>
References: <1127998969.2685.10.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1127998969.2685.10.camel@localhost>
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

Thanks both for the replies.

--- "John A. Sullivan III"
<jsullivan@opensourcedevel.com> wrote:
> I'm not entirely sure since I don't do it myself but
> you can check man modprobe.conf.  It is probably 
> something like:
> 
> options ip_conntrack hashsize=32767

I checked the man page and your command was right.
I've tested it and works perfectly.

Thanks again!




> -- 
> John A. Sullivan III
> Open Source Development Corporation
> +1 207-985-7880
> jsullivan@opensourcedevel.com
> 
> If you would like to participate in the development
> of an open source
> enterprise class network security management system,
> please visit
> http://iscs.sourceforge.net
> 
> 


