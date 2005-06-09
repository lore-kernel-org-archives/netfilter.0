From: tech@uscitizensalliance.org
Subject: destination port rewrite
Date: Thu, 9 Jun 2005 13:14:34 -0400 (EDT)
Message-ID: <53625.209.208.196.163.1118337274.squirrel@www.uscitizensalliance.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
References: 
In-Reply-To: 
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

Hi Everyone,
I have a somewhat unusual requirement here. Please let me know if it is
not clear enough.

From inside a firewall connected to the internet on outside, I would like
for all outgoing packets that their destination ports be rewritten in
addition to being natted.


e.g
iptables -t nat -A POSTROUTING -s 192.168.0.0/24 --dport=8080 \
         -j SNAT -o eth0 --to-source $external_ip --dport=80.


Just to make it more clear
for e.g
Behind ipfilter the request will be
FROM $internal_ip to somedomain.com:8080 -> FROM $external_ip TO
somedomain.com:80

Is this possible in ipfilters.
Kind Regards,
-Mark




