From: "Klemen Kecman" <klemen.kecman@sting.si>
Subject: RE: port blocking
Date: Fri, 25 Mar 2005 14:57:12 +0100
Message-ID: <20050325135715.09751396825@smtp.amis.net>
References: <20050325120012.38609.qmail@web51910.mail.yahoo.com>
Reply-To: klemen.kecman@sting.si
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20050325120012.38609.qmail@web51910.mail.yahoo.com>
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


-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Manish
Sent: 25. marec 2005 13:00
To: netfilter@lists.netfilter.org
Subject: port blocking

Hi,
 
I am having 5 network inteface card on my server,  2 connected to ethernet
and 3 connected to wireless. i am also running webserver on port 10000 in
the same machine. I only wanted the users from eth1 to be able to connect to
my web server. users from other interface i.e eth0, eth2.eth3 and eth4 will
not be able to connect to my web server. What iptables rule should i use.
 
Thanks.

		
---------------------------------
Do you Yahoo!?
 Yahoo! Mail - 250MB free storage. Do more. Manage less.


iptables -A INPUT -i eth0 -p tcp --dport 10000 -j DROP
iptables -A INPUT -i eth2 -p tcp --dport 10000 -j DROP
iptables -A INPUT -i eth3 -p tcp --dport 10000 -j DROP
iptables -A INPUT -i eth4 -p tcp --dport 10000 -j DROP


and so on ..

But its better if you go other way around, set policy to drop, and then
specify what to allow in.

Greets, Klemen


