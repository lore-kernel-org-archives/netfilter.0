From: Ruslan Spivak <alienoid@is.lg.ua>
Subject: REDIRECT question
Date: Wed, 02 Jul 2003 13:56:21 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F02BA55.1030504@is.lg.ua>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello, netfilter users.

i want make transaparent proxy on localhost and want to disabe access 
after redirecting to port 3128 if destination address in net other then 
193.108.240.0/22.
Does REDIRECT target send packet to INPUT chain and i should disable 
access in INPUT chain or should i disable access in '-t nat -A 
POSTROUTING' chain?

iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT 
--to-port 3128


Thanks in advance. Your help is very, very appreciated.

Best regards,
Ruslan



