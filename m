From: "Mark Ryan" <markryan@cfl.rr.com>
Subject: Help with ftp connection throttling
Date: Mon, 16 Dec 2002 20:51:20 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000101c2a56e$d0b1e420$0501a8c0@underworld>
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

I am in need of a way to setup ipatbles to throttle connection attempts
to my ftp server.

I use Proftpd and I have it set up with 2 logins...1 for download and 1
for upload.  Many users use each account.

What I would like is to limit connection attemts to 1 per minute.  Then,
if a user connects more than that I would like their ip address placed
into the hosts.deny file.  If this is not possible then just ignoring
the extra attempts per minute would work also.
 
Any help would be greatly appreciated.  I am running Redhat 7.2 with
2.4.7-10 as a firewall/router with a homegrown iptables ruleset.
 
Thanks,
Mark
markryan@cfl.rr.com



