From: nexor@fnet.pl
Subject: Connections and connlimit problem,
Date: Mon, 5 Apr 2004 10:23:23 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <813267234.20040405102323@fnet.pl>
Reply-To: nexor@fnet.pl
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello,
it's my first post here - so welcome everyone!

I'm using Debian with kernel 2.4.6. I realized that I have a lot lines
in ip_conntrack like that:

tcp 6 431925 ESTABLISHED src=213.155.172.138 dst=217.17.41.88 sport=1057 dport=8074
src=217.17.41.88 dst=213.155.172.138 sport=8074 dport=1057 [ASSURED] use=1

I guess that 431925 (third values) is a timer - means how long this
connection will be tracked. Value of 431925 (in secs) means about 5
days... Those connections stay in ip_conntrack even after user reboot or
shutdown his computer.

I use connlimit and would like to not allow more than 20 connections
at once - here is my problem. After few days my ip_conntrack is full
of connections like that. Users can't make new connections, because
they have those 'dead' connections and connlimit prevent them from
making new.

Sorry for my poor English, I'm waiting for some advices.

-- 
Best regards,
 nexor                          mailto:nexor@fnet.pl


