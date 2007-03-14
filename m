From: Klaas Jan Wierenga <k.j.wierenga@home.nl>
Subject: Re: Dropped fin acks (iptables + lvs)
Date: Wed, 14 Mar 2007 14:57:43 +0100
Message-ID: <2DF6489E-7ADB-4DBB-AE78-66822BCF0550@home.nl>
Mime-Version: 1.0 (Apple Message framework v752.3)
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi Patrik,

Have you gotten any further with the "Dropped fin acks (iptables +  
lvs)" problem?I'm experiencing similar problems, but even worse, some  
of my long HTTP streaming sessions are disconnected because LVS or  
Netfilter decides to send "ICMP host unreachable" on an existing and  
active connection.

See: http://archive.linuxvirtualserver.org/html/lvs-users/2007-03/ 
msg00057.html

Could my problem be related to your problem?

Regards,

Klaas Jan Wierenga

