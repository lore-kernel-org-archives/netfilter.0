From: Boryan Yotov <yotov@prosyst.com>
Subject: Re: Ftp (pass mode ) and Iptables
Date: Thu, 05 Jan 2006 10:14:51 +0100
Message-ID: <43BCE38B.5080007@prosyst.com>
References: <d27cd2010601041951n33224017m@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <d27cd2010601041951n33224017m@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

ludi wrote:
> I have a ftp server and run a script of iptables on the server (not a
> nat-gateway).  The follow is the script:
> 
> iptables -F OUTPUT
> iptables -F INPUT
> iptables -F FORWARD
> 
> 
> 
> iptables -A INPUT -p udp -i eth0 -s 0/0 -d $HOME_ADDR --dport 53 -j ACCEPT
> iptables -A INPUT -p tcp -i eth0 -s 0/0 -d $HOME_ADDR --dport 22 -j ACCEPT
> iptables -A INPUT -p udp -i eth0 -s 0/0 -d $HOME_ADDR --sport 53 -j ACCEPT
> iptables -A INPUT -p tcp -i eth0 -s 0/0 -d $HOME_ADDR --dport 80 -j ACCEPT
> iptables -A INPUT -p icmp -i eth0 -s 0/0 -d $HOME_ADDR -m limit
> --limit 6/m --limit-burst 6 -j ACCEPT
> iptables -A INPUT -i lo -s 0/0 -d 127.0.0.1/32 -j ACCEPT
> iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -P INPUT DROP
> 
> 
> iptables -A OUTPUT -o lo -s 127.0.0.1 -j ACCEPT
> iptables -A OUTPUT -o eth0 -s $HOME_ADDR -j ACCEPT
> iptables -P OUTPUT DROP
> Now, my question is that I can not connect the ftp server with pass
> mode until I stop the iptables. I had tried the ip_conntrack_ftp.o
> module, but it didnt effect.
> Could anyone give me some idea?

Do you have TLS or SSL encryption over the FTP's server command channel?

