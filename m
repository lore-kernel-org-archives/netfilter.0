From: Feizhou <feizhou@linuxmail.org>
Subject: Large number of repeated rules with only differing -s ipaddrs/cidrs
Date: Mon, 19 Apr 2004 18:02:26 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4083A3B2.7020808@linuxmail.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I don't know if such a question has been asked before and the archive 
didn't provide a search button...

I have a whole bunch of ips/cidrs that I want to apply the rule to.

Is there any way to insert one rule where the -s would be able to look 
up a table (btree/hash/cdb whatever) that contains those ips/cidrs 
instead of insert gazillion rules?

