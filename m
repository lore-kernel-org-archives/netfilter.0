From: "Cyrille Colin" <shishico@hotmail.com>
Subject: libipq packet size
Date: Tue, 06 May 2003 12:05:52 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Law8-F73TnaNdgxDY6q0001b1b7@hotmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi everybody


sorry for the newbies question.

I use libipq to implement a udp tunnel.  (since SCTP cannot go through :-)

so basically the packet i get from QUEUE has to be modified / increased in 
size.

i create a new buffer for this. Everything works fine exept that when i 
return the packet with ipq_verdict i obtain a packet with the modified data 
but WITH ORIGINAL SIZE. i cant make it having the correct increased size.. 
so i have a truncated version of wat i expect.
It's weird since in the return function, i specify the new size. (which is 
different from the original  m->data_len)

anybody can help me ??

thanks a lot

Cyrille



_________________________________________________________________
MSN Search, le moteur de recherche qui pense comme vous ! 
http://search.msn.fr/worldwide.asp


