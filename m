From: "anantharaman.iyer" <ananth@mail.mynetsec.com>
Subject: Re: a doubt about INPUT rule
Date: Wed, 13 Aug 2003 13:43:19 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030813081319.M66517@mail.mynetsec.com>
References: <20030814064610.GA1701@linux.local>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030814064610.GA1701@linux.local>
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
Content-Transfer-Encoding: 7bit
To: Payal Rathod <payal-iptables@staticky.com>, netfilter@lists.netfilter.org

hi,

when you are using implicit matching syntax such as "--dport" or "--sport", 
then you have to specify the specific protocol. There are currently three 
types of implicit matches for three different protocols. These are TCP 
matches, UDP matches and ICMP matches. The TCP based matches contain a set 
of unique criteria that are available only for TCP packets. UDP based 
matches contain another set of criteria that are available only for UDP 
packets. And the same thing for ICMP packets. Hence you have to use the 
option "-p tcp" or "-p udp" when you want to use it with "--dport" option. 
hope that explains ur doubt. 

Regards
Iyer Anantharaman

On Thu, 14 Aug 2003 12:16:10 +0530, Payal Rathod wrote
> Hi,
> Why does this give an error,
> 
> # iptables -A INPUT -p all -s 0/0 -d 192.168.0.10 --dport 21 -j ACCEPT
> iptables v1.2.7a: Unknown arg `--dport'
> Try `iptables -h' or 'iptables --help' for more information.
> 
> and this,
> 
> # iptables -A INPUT -s 0/0 -d 192.168.0.10 --dport 21 -j ACCEPT
> iptables v1.2.7a: Unknown arg `--dport'
> Try `iptables -h' or 'iptables --help' for more information.
> 
> But this works,
> 
> # iptables -A INPUT -p tcp -s 0/0 -d 192.168.0.10 --dport 21 -j ACCEPT
> 
> Why does it not work without -p and even with -p tcp?
> 
> With warm regards,
> -Payal
> 
> -- 
> "Visit GNU/Linux Success Stories"
> http://payal.staticky.com
> Guest-Book Section Updated.



--
Open WebMail Project (http://openwebmail.org)


