From: Darren Bentley <darren@bcgroup.net>
Subject: network security with iptables
Date: 09 Apr 2003 14:16:40 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1049923000.17102.51.camel@chief.pgweb.com>
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

Hello,

We have a RH 7.3 router as our main gateway (T1 backbone). This goes
into our main switch, we have many servers and wireless connections to
other locations with routers etc.

Right now we're blocking ssh from our main gateway router (via iptables)
to any of our servers. Should this be done on all the servers as well?

Should I be doing all my blocking from just the main gateway router? or
on each individual server? or both?

Seeing how we have many servers, do I have to create a rule for each
one? or can I somehow combine multiple destination ips to the same rule?

Thanks,

- Darren


