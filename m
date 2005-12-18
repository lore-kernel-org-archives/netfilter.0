From: "Aaron Gray" <angray@beeb.net>
Subject: Re: Can I use ip_conntrack_ftp on a server firewall ?
Date: Sun, 18 Dec 2005 02:50:09 -0000
Message-ID: <005901c6037d$c3709b10$0400a8c0@AMDADVENT>
References: <004301c6029a$b49f8490$0200a8c0@AMDADVENT>
	<do03d8$2jm$1@sea.gmane.org>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="response"
To: netfilter@lists.netfilter.org

>> How do I create rules to allow FTP passive and active connections to the 
>> server ?
>> 
>> Do I use ip_conntrack_ftp or can I just create some rules that will do 
>> the job ?
> 
> You need ip_conntrack_ftp.  To get that modules loaded automatically,
> Just edit /etc/sysconfig/iptables and add "ip_conntrack_ftp" to the
> "IPTABLES_MODULES=" line.

Okay I have ip_conntrack_ftp loaded in /etc/sysconfig/iptables-config.

Still it must require some rules to use it.

Aaron


