From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: iptables stop/start vs restart ...
Date: Thu, 29 Sep 2005 09:02:49 -0400
Message-ID: <1127998969.2685.10.camel@localhost>
References: <20050929104837.92766.qmail@web86505.mail.ukl.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050929104837.92766.qmail@web86505.mail.ukl.yahoo.com>
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
To: Chicken of the Apocalypse <satehen@btinternet.com>
Cc: netfilter@lists.netfilter.org

On Thu, 2005-09-29 at 11:48 +0100, Chicken of the Apocalypse wrote:
> Hi John,
> 
> > Can you use the options parameter in modprobe.conf
> > rather than specifying the option on the command 
> > line? - John
> 
> I can, not sure of what the format would be?
> 
> Thanks
> 
I'm not entirely sure since I don't do it myself but you can check man
modprobe.conf.  It is probably something like:

options ip_conntrack hashsize=32767
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

If you would like to participate in the development of an open source
enterprise class network security management system, please visit
http://iscs.sourceforge.net


