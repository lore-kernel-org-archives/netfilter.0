From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Problem of Setting dafault polocies to 'DROP'
Date: Wed, 24 Dec 2003 11:12:00 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312241112.00560.Antony@Soft-Solutions.co.uk>
References: <20031224110324.15253.qmail@web60404.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031224110324.15253.qmail@web60404.mail.yahoo.com>
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
To: netfilter@lists.netfilter.org

On Wednesday 24 December 2003 11:03 am, ads nat wrote:

> The moment I set "iptables -P INPUT DROP"
> System hangs.

Are you working on a local keyboard + screen, or via a remote ssh session?

If you are on a network connection, then of course an empty ruleset + default 
DROP policy will block your connection.

Antony.

-- 
Abandon hope, all ye who enter here.
You'll feel much better about things once you do.

                                                     Please reply to the list;
                                                           please don't CC me.


