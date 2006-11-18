From: Mike Wright <xktnniuymlla@mailinator.com>
Subject: ipset: how to run non-root
Date: Sat, 18 Nov 2006 14:49:13 -0800
Message-ID: <455F8DE9.8060105@mailinator.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

Hi all,

I'm trying to use ipset from a php script on an apache server.

ipset requires root user in order to execute, but the webserver is 
running as apache.  suexec is not a possibility because it won't execute 
programs with root permissions.  It is possible to have a cron job 
perform the task but that introduces a time delay.

I've tried changing ownership of ipset to apache:apache but that didn't 
work.  Still received the "must be root" warning.

I looked into the source of ipset.c but it seems like the socket() call 
must be done as root, and I don't know how to hack around that.

Does anybody know how I might accomplish this?

Thanks,
Mike Wright

