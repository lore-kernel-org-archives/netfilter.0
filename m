From: "Guilherme Viebig" <guilherme@plannercorretora.com.br>
Subject: Re: iptables problem
Date: Tue, 13 May 2003 14:02:11 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <004001c31971$65185c40$6800817d@TESTE>
References: <1bd101c31962$358e1820$09603fca@Housecall>
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
To: netfilter@lists.samba.org

Change REDIRECT to DNAT
----- Original Message ----- 
From: "hare ram" <hareram@sol.net.in>
To: <netfilter@lists.samba.org>
Sent: Tuesday, May 13, 2003 12:13 PM
Subject: iptables problem


> Hi
> 
> i have installed iptables 1.2.8a in RH 9.0
> and installed POM tooo
> when i do
> 
> [root@ root]# iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j
> REDIRECT --to-port 3128
> iptables: Invalid argument
> 
> what is wrong
> i dont see any problem, but iam getting this error
> what could be the problem
> 
> hare
> 
> 
> 


