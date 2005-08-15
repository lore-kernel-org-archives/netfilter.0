From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: iptables permission problem in perl scripts
Date: Mon, 15 Aug 2005 00:44:59 -0500
Message-ID: <43002BDB.4050100@riverviewtech.net>
References: <fdb0cf39050814022961f4b816@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <fdb0cf39050814022961f4b816@mail.gmail.com>
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

psihozefir wrote:
> maybe run perl executable suid root

NO!  Do not do this, this will introduce SO MANY security problems on a modern box.  This is REALLY a BAD idea.  Find some other way to fix your problem.



Grant. . . .

