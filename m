From: Alexander  Bondarenko <bond_a_v@inbox.ru>
Subject: multiple match string don't work
Date: Fri, 27 Jul 2007 11:31:19 +0400
Message-ID: <E1IEKIB-0001Io-00.bond_a_v-inbox-ru@f102.mail.ru>
Reply-To: Alexander Bondarenko <bond_a_v@inbox.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hello all ! 

I'm trying to use fwsnort on CentOS 5.0.  My kernel is 2.6.18-8  and iptables v. 1.3.5.  It created several rules with fwsnort  for Netfilter but fast all of them have several match string options, such as :

iptables -A INPUT -d 192.168.52.10 -m string --string  "GET" --algo bm -m string --string "passwd" -algo bm -j DROP

but all these commands fail to execute with the following error:

iptables v1.3.5:  Unknown arg  passwd'

when I manually run this command only with the first match condition:

iptables -A INPUT -d 192.168.52.10 -m string --string  "GET" --algo bm -j DROP

it works, but not for two or more match string conditions.  I don't know what to do.  I man page of iptables a see that I can specify several match strings.  Why it's not working for me ?

Regards, Alex



