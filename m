From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: FTP Problem
Date: Tue, 27 Feb 2007 09:23:02 +0100
Message-ID: <000a01c75a48$7f786410$0b0ffe0a@NS006819>
References: <45E33904.4060103@ducky.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45E33904.4060103@ducky.nl>
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

> Hi,
> 
> I'm a new user for netfilter en doesn't have experience with it...
> 
> I have written a simple firewall script in the past it works perfect,
> but know the FTP section doesn't work at all....
> 
> Maybe can somebody help me.
> 
> Here is my code :
> 
> iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A INPUT -p tcp -i eth0 -s any/0 -d any/0 --dport 21 -j
> ACCEPT iptables -A OUTPUT -p tcp -o eth0 -s any/0 --sport 21 -d any/0
> ! --syn -j ACCEPT iptables -A INPUT -p tcp -i eth0 -s any/0 -d any/0
> --dport 20 -j ACCEPT iptables -A OUTPUT -p tcp -o eth0 -s any/0
> --sport 20 -d any/0 ! --syn -j ACCEPT 

Did you "modprobe ip_conntrack_ftp" and "modprobe ip_nat_ftp" ?


Grts,
Rob



