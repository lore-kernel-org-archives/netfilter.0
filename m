From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: no ssh on eth0
Date: Sun, 30 Jul 2006 13:44:17 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0607301343450.23827@yvahk01.tjqt.qr>
References: <1154239260.5429.2.camel@nirvana.aurokruti.in>
	<87fygje700.fsf@newton.gmurray.org.uk>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <87fygje700.fsf@newton.gmurray.org.uk>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Graham Murray <graham@gmurray.org.uk>
Cc: netfilter@lists.netfilter.org

>> Hello,
>>
>> I a internet server with :
>>
>> eth0 as WAN and eth1 as LAN.
>>
>> I want to prevent ssh on eth0.
>>
>> Howto do it ?
>
>iptables -I INPUT -i eth0 -p tcp --dport 22 -j DROP
>

If
	eth0 10.0.0.1
	eth1 192.168.222.3
then
/etc/ssh/sshd_config:

	ListenAddress 192.168.222.3


Jan Engelhardt
-- 

