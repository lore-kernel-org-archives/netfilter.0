From: "Mark Ryan" <markryan@cfl.rr.com>
Subject: Dynamic Deny rule
Date: Sat, 4 Jan 2003 10:26:12 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000101c2b405$a39f7dd0$0501a8c0@underworld>
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

I am trying to come up with a iptables rule that will deny ip certain ip
addresses that I can load/unload into a file.
 
To clarify...i run a ftp server and sometimes people screw around and I
want to ban them from logging in.  I need a way to add these ip's into a
'ban list'.  I don't want to add a new rule every time however with a
separate rule for each ip.
 
Is there a way to make a file such as 'banned_ips' and have a rule look
into that file to decide if the ip can log in or not?
 
Thanks,
Mark



