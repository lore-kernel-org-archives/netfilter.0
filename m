From: Renato Rossi <renato.rossi@savi.ch>
Subject: Help me  SNAT/DNAT
Date: Thu, 5 Sep 2002 18:09:42 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F392BE64738A7143B00E86A5634FBF142C0D@akun2900.intra.savi.ch>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>





	Hi,
	I'm in a lot of trouble!

	First I don't write in English, it's a lot of time that I don't.

	I'm trying to make a pair of firewall to give me a lot of time to
spent in holidays.... at last one day!
	This is my idea
	                                           |-----------------------|
|--------------------------|
	Leased line with /28 network  |                       |    Lan
192.168.2.0/24               |                          |          Lan
192.168.1.0/24
	-------------------------------------------|  first firewall
|-----------------------------------------------|   second firewall
|---------------------------------------
	                                           |                       |
|                                     |                          |
	                                           ------------------------
|                                      ---------------------------
|					
	
-------|---------
	                                                                   |
|
	                                                                   |
HTTPD    |
	                                                                   |
|
	
------------------

	Now, the problem is to make running SNAT/DNAT ,
	I've modify this script :
http://www.sentry.net/~obsid/IPTables/rc.scripts.dir/current/rc.firewall.ipt
ables.dual
	and no NAT is running, else if I give command directly.
	The output of iptables -L -t nat -v explain that some packets are
mangled by PREROUTING table and nothing else.
	If I change POSTROUTING rule in an illogical manner I can see that
all packet are mangled also.

	I don't like to insert 3 NIC to make DMZ, I prefer the security that
second firewall give to me....
	in my heed first and second firewall are cluster (really I'll use
MON, Heartbeat ...etc.). Now all the IP address aren't aliases. I think it
doesn't matter.
	The HTTPD server is only a representative service....

	Thanks



Renato Rossi

 SAVI  Consulting SA
cp203 
6533 LUMINO
Switzerland
 
tel.	+41 (0)91  8291383
fax	+41 (0)91  8290383
mobile	+41 (0)79  4121685
email	renato.rossi@savi.ch



