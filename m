From: "Bryan Schmidt" <absolut_bryan@hotmail.com>
Subject: (no subject)
Date: Thu, 24 Jul 2003 19:23:08 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY1-F148qY4tbqBTNk0000398e@hotmail.com>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


Hey all,

    I have got a problem that has been driving me crazy.  I can not get the 
following Iptable filter to work.

iptables -A TEST -p tcp -m limit --limit 1/s -j LOG --log-prefix "[TCP drop] 
" --log-level=info

I get an "iptables: Invalid argument"

I have narrowed the problem down to "-m limit --limit 1/s".  I have the 
ipt_limit module loaded.

What am I missing.  I know the limit modules is loading because I have got a 
limit error
trying different commands.


iptables -A LnD -p tcp -m limit --limit second -j LOG
iptables v1.2.7a: bad rate `second'
Try `iptables -h' or 'iptables --help' for more information.

Thanks in advance
Bryan

_________________________________________________________________
MSN 8 helps eliminate e-mail viruses. Get 2 months FREE*.  
http://join.msn.com/?page=features/virus


