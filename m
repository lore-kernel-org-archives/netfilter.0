From: Antonio Alvarez <aramirez@teneinformatica.com>
Subject: multiple destinations
Date: Tue, 17 Aug 2004 19:49:42 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1092768581.24655.11.camel@Toshiba.Toshiba>
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
To: netfilter <netfilter@lists.netfilter.org>

	

Hello 


how can i do.....

iptables -t nat -A PROSROUTING -p tcp --dport 80 -d ! 192.168.0.1 (and)
! 192.168.0.50 (and) ! xxx.xxx.xxx.xxx -j REDIRECT 3128 

I need more than one destination ... may be ussing my own new chains????


Thanks in advance




