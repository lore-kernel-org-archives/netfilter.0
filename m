From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: Port is open but I am unable to connect
Date: Tue, 07 Sep 2004 15:59:15 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <413E2123.6050908@pbl.ca>
References: <413E0B9E.8010708@list.idg.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <413E0B9E.8010708@list.idg.dk>
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

Jacob Friis Larsen wrote:
> When I add -s 1.2.3.4 I am unable to connect to my server.
> nmap shows that the correct ports are open.
> Any ideas?
> 
> iptables -A INPUT -s 1.2.3.4 -j ACCEPT -p tcp --dport 22 -m state 
> --state NEW
> 
> This is my script:

[snip]

> # STATE RELATED for router
> iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> 
> # Localhost
> iptables -A INPUT -i lo -j ACCEPT
> iptables -A OUTPUT -o lo -j ACCEPT
> 
> # Open ports on router for server/services
> iptables -A INPUT -s 1.2.3.4 -j ACCEPT -p tcp --dport 20 -m state 
> --state NEW
> iptables -A INPUT -s 1.2.3.4 -j ACCEPT -p tcp --dport 21 -m state 
> --state NEW
> iptables -A INPUT -s 1.2.3.4 -j ACCEPT -p tcp --dport 22 -m state 
> --state NEW
> iptables -A INPUT -j ACCEPT -p tcp --dport 25 -m state --state NEW
> iptables -A INPUT -j ACCEPT -p tcp --dport 80 -m state --state NEW
> iptables -A INPUT -j ACCEPT -p tcp --dport 143 -m state --state NEW
> iptables -A INPUT -j ACCEPT -p tcp --dport 993 -m state --state NEW

All your rules (apart from lo interface) are for INPUT chain.  No rules 
for OUTPUT chain (so all return packets get dropped there).  You are 
missing "-A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT" at 
the begginging of your rules (just after similar INPUT line you already 
have).

BTW, what's the point of accepting connections to port 20?  It's FTP 
port used for active data transfers, and connections are made *from* it, 
not *to* it.  Since you have (will have) "just accept anything related I 
don't care" rules, just add "modprobe ip_nat_ftp" line somewhere into 
your script, and FTP will work (you don't need that port 20 line).

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

