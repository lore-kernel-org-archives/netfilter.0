From: Mohamed Eldesoky <eldesoky.lists@gmail.com>
Subject: Re: udp port 1025
Date: Mon, 20 Sep 2004 11:37:45 +0300
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1403218a04092001376308ea4a@mail.gmail.com>
References: <a0f69e5040920004411e0eeb6@mail.gmail.com>
Reply-To: Mohamed Eldesoky <eldesoky.lists@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <a0f69e5040920004411e0eeb6@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.netfilter.org>

Search in google, and feel lucky

http://www.linklogger.com/TCP1025.htm

On Mon, 20 Sep 2004 13:44:18 +0600, Askar <askarali@gmail.com> wrote:
> hi all
> 
> Im taking care of a fw machine that is configured by my predecsssor,
> firewall being configure by default policies to ACCEPT for all chain
> (coz he thinks its difficult of an ISP to run firewall as default set
> to DROP)
> however for the time being this is not my concern but here are few
> lines from script that confusing for me
> 
> iptables -A INPUT -p TCP -s 0/0 -d 0/0 --dport 1025 -j DROP
> iptables -A FORWARD -p TCP -s 0/0 -d 0/0 --dport 1025 -j DROP
> iptables -A OUTPUT -p TCP -s 0/0 -d 0/0 --dport 1025 -j DROP
> 
> when I do "tail -f /var/log/messages", I found lot of below messages
> 
> Sep 20 12:26:35 guru named[12308]: client xxx.xx.xxx.xx#1025: error
> sending response: host unreachable
> Sep 20 12:26:37 guru named[12308]: client xxx.xx.xxx.xxx#1025: error
> sending response: host unreachable
> Sep 20 12:26:37 guru named[12308]: client xxx.xx.xxx.xx#1025: error
> sending response: host unreachable
> Sep 20 12:26:37 guru named[12308]: client xxx.xx.xxx.xx#1025: error
> sending response: host unreachable
> Sep 20 12:26:38 guru named[12308]: client xxx.xx.xxx.xx#1025: error
> sending response: host unreachable
> Sep 20 12:26:39 guru named[12308]: client xxx.xx.xxx.xxx#1025: error
> sending response: host unreachable
> 
> what mean by all this, can someone care to explain/clear things to me? :)
> may I remove the above iptables rules?
> 
> regards
> Askar
> --
> (after bouncing head on desk for days trying to get mine working, I'll make
> yer life a little easier)
> 
> 



-- 
Mohamed Eldesoky
www.eldesoky.net
RHCE

