From: Raj Mathur <raju@linux-delhi.org>
Subject: Re: [LARTC] Performanace fo the Iptables Server
Date: Thu, 28 Aug 2003 08:55:36 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <16205.30256.348103.821745__41167.9969788112$1062531205@mail.linux-delhi.org>
References: <019f01c36c5e$9f7868e0$c2bf09ca@Housecall>
	<200308271917.00121.stef.coene@docum.org>
	<015d01c36cc1$11fbabe0$c2bf09ca@Housecall>
	<200308271941.53445.stef.coene@docum.org>
	<026101c36cc3$b6b76280$c2bf09ca@Housecall>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <026101c36cc3$b6b76280$c2bf09ca@Housecall>
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
To: netfilter@lists.samba.org, lartc@mailman.ds9a.nl

>>>>> "Hare" == hare ram <hareram@sol.net.in> writes:

    Hare> Hi Stef Thats right, if i make cron job run every 5min, so i
    Hare> will loose only 5min of data.

    Hare> i was not understand " You can record the difference between
    Hare> the 2 reads and discard negative values. "

    Hare> you mean to say first 5min and next 5min bytes increasing ok
    Hare> if not i will discard and take new values you mean.

    Hare> If i make the log to mysql, so it will be 24hours right is
    Hare> there anything i can make every 5min dump the data to Mysql
    Hare> using ULOG

...or just use iptables -L -v -z to read the counters afresh each
5 minutes.  -z will zero them out after displaying the current
values.

-- Raju
-- 
Raj Mathur                raju@kandalaya.org      http://kandalaya.org/
       GPG: 78D4 FC67 367F 40E2 0DD5  0FEF C968 D0EF CC68 D17F
                      It is the mind that moves

