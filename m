From: Anand Kumar <anandk5_2000@yahoo.com>
Subject: NAT changing IP.
Date: Thu, 9 Jun 2005 09:03:31 -0700 (PDT)
Message-ID: <20050609160331.95885.qmail@web40425.mail.yahoo.com>
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

Hi,

I have used a firewall m/c with the 2 interfaces, 1
Static Public IP (eth0) & Internal ip (192.168.0.1,
eth1) & route the packets to mail server with internal
ip 192.168.0.254 for mail receiving with the following
rule.
$IPT -A PREROUTING -t nat -p tcp -i eth1 --dport 25 -j
DNAT --to 192.168.0.254:25

No problems in receiving mails.  Problem faced by me
is the IP Address of the originating mail is changed
to 192.168.0.1 after the PREROUTING, due to which the
SPAM filter is not happening & am receiving around
1000 Junk mails.  

Looking for a solution of just moving the packets with
original IP to my mail server.

Thanks for the help in advance.

Rgds...Anand



Thanx & RegardsAnand Kumar91-80-25003664 (DiD), 98455 79062 (M)Delivery Services - IBM Global AccountEGL Bangalore


		
__________________________________ 
Discover Yahoo! 
Use Yahoo! to plan a weekend, have fun online and more. Check it out! 
http://discover.yahoo.com/

