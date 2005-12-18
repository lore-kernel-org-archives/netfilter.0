From: "Aaron Gray" <angray@beeb.net>
Subject: Re: Can I use ip_conntrack_ftp on a server firewall ?
Date: Sun, 18 Dec 2005 17:43:30 -0000
Message-ID: <008001c603fa$919d4bb0$0400a8c0@AMDADVENT>
References: <004301c6029a$b49f8490$0200a8c0@AMDADVENT>	<do03d8$2jm$1@sea.gmane.org><005901c6037d$c3709b10$0400a8c0@AMDADVENT>
	<do34su$1mj$1@sea.gmane.org>
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

>> Okay I have ip_conntrack_ftp loaded in /etc/sysconfig/iptables-config.
>>
>> Still it must require some rules to use it.
>
> Well, you obviously need to allow the initial incoming connection to
> port 21.  Beyond that, all you should need are the usual rules to
> allow all ESTABLISHED and RELATED traffic.  With the conntrack
> module working, the ftp-data connection will be recognized as
> RELATED.  Unless there NAT involved (requiring use of the ip_nat_ftp
> module), it should "just work".

I added a NEW and it now "just works" with Windows Internet Explorer as well 
as Unix FTP.

Aaron


