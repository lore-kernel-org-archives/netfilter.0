From: Fallucchi Antonio <fallucch@cisbic.com>
Subject: tcp checkum claculation!!
Date: Thu, 16 Sep 2004 18:43:32 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <4149C2B4.4010409@cisbic.com>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,

I need a Help for recalculate the checksum of TCP packet. I read the 
packet from iptables_queue, and sum  16 bit word from and add the 
pseudoheader   ipsource, ipdest, 6, tcp_len (form the ip packet), and i 
see the buddy. I all width complement!

I have see the site  http://www.netfor2.com/tcpsum.htm

and the my code is:

	for (i=0;i<11;i=i+2)
	{
		sum+=*pseudobuff++;
	}

	nwords=swap(len_tcp)-(len_ip*4);
	
	while(nwords>1)
	{
		sum+=*buff++;
		nwords-=2;	
	}
	if(nwords==1)
	{
		sum+=*(unsigned char *)buff;
	}
	
	sum=(sum>>16)+(sum&0xffff);
	sum+=(sum>>16);
	
	sum = ~sum;

but the result isn't correct...

tancks for the help.

bye bye

