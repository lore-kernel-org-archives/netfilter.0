From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: iptables: No chain/target/match by that name
Date: Sat, 07 Jan 2006 13:50:10 -0500
Message-ID: <1136659810.2599.10.camel@localhost>
References: <BAY105-F281A346E9A68ED0764F10F9E200@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY105-F281A346E9A68ED0764F10F9E200@phx.gbl>
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
To: Amresh Kumar <amresh_srivastava@hotmail.com>
Cc: netfilter@lists.netfilter.org

On Sat, 2006-01-07 at 12:42 +0530, Amresh Kumar wrote:
> Hi ,
> 
> I am using  iptables rule for Load Balancing with random* or nth but i am 
> getting the error
> 
> iptables: No chain/target/match by that name
> 
> iptables rule :  iptables  -A PREROUTING -i eth0 -p tcp --dport 80 -m state 
> --state NEW -m nth --counter 0 --every 4 --packet 0  -j DNAT 
> --to-destination 192.168.0.5:80
> 
> iptables -A PREROUTING -i eth0 -p tcp --dport 80 -m state --state NEW -m 
> random --average 25 -j DNAT --to-destination 192.168.0.5:80
> 
> My kernel version is  2.6.9-5.0.3.EL
> Iptable version = iptables v1.3.4
> 
> can anyone  explain.
> 
> Thanks..
<snip>
Is it enabled in the kernel or as a module? If as a module, is it
loaded? - John
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

If you would like to participate in the development of an open source
enterprise class network security management system, please visit
http://iscs.sourceforge.net


