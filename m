From: Shaya Potter <spotter@ymail.yu.edu>
Subject: filtering based on pid
Date: 31 Mar 2003 21:00:33 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1049162433.2304.2.camel@zaphod>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

[please cc: responses to me as not subscribed]

Is it possible to filter a process so that all outbound packets go over
a specific adapter?

i.e. if one has eth0 eth0:1 eth0:2 eth1 and eth2 to have all packets go
out only on the ip associated with eth0:1?

It's easy enough for me to force sys_bind() to a specific ip, but
without IP Filter I don't see how to do connect()?

any help would be appreciated

thanks,

shaya


