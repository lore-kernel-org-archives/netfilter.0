From: "Sadus ." <sadus@swiftbin.net>
Subject: multiport
Date: Thu, 16 Jun 2005 16:59:51 +0300
Message-ID: <1118930391.16084.2.camel@debianbox>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello i want to drop ALL connections on my internal NIC except:
20,21,80,443
is this correct? (although not working)


iptables -A INPUT -i eth1 -s 172.16.3.0/16 -p tcp -m multiport !
--destination-port  20,21,80,443 -j DROP #USERS

which basicaly means if source is in 172.16.3.0 then drop all except for
HTTP,FTP,HTTPS. that's in order for that IP range to not be able to
connect to Instant Messenging services such as MSN, AIM, Yahoo etc...
while keeping other IP ranges be able to use them.

Thanks
-- 
Sadus . <sadus@swiftbin.net>
Swiftbin.net


