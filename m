From: SBlaze <dagent.geo@yahoo.com>
Subject: RE: Restricting IP addresses from ports
Date: Tue, 25 Feb 2003 11:43:34 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030225194334.8393.qmail@web40204.mail.yahoo.com>
References: <HMEBKOCKLOOEJGIOMFAPKENJFKAA.ian@icreditvision.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <HMEBKOCKLOOEJGIOMFAPKENJFKAA.ian@icreditvision.com>
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
To: netfilter@lists.netfilter.org


--- Ian Douglas <ian@icreditvision.com> wrote:
> >   How do I allow a specific IP address access to a port like SSH?  I want
> > to deny all access to ports on a system that I manage except for specific
> > addresses.
> 
> In a general sense, you create a rule to ALLOW a specific IP address (or
> range),
> and then explicitly REJECT/DROP/TREJECT/etc that port for everyone else.
> 
> -id
> 
> 
This is what I use to stop incoming Connection and common Port Scans
The state matching INVALID is redundant but I like the feeling of security it
gives me LOL

# NMAP and Incoming connection Killer(SYN/RST)
# NMAP Xmas Tree scan Killer ( God bless Google )
# NMAP Null scan killer (got from a IPTABLES tutorial..confirmed via the web)
# NMAP Stealth FIN scan killer (this one was a hard one to figure out)
# Droppping INVALID packets not matched anywhere else ALL PROTOS

iptables -A INPUT -p tcp --syn -m state --state NEW -i eth0 -j DROP
iptables -A INPUT -p tcp --tcp-flags ALL FIN,URG,PSH -i eth0 -j DROP
iptables -A INPUT -p tcp --tcp-flags ALL NONE -i eth0 -j DROP
iptables -A INPUT -p tcp ! --syn -m state --state NEW -i eth0  -j DROP
iptables -A INPUT -p ALL -m state --state INVALID -j DROP

Allowing specific stuff is easy...

iptables -A INPUT -p TCP -i eth0 --src ip address you want to allow here -j
ACCEPT

of course you need to make sure you set the right Protocol (TCP is fine for
ssh)
but if you want to allow PINGS and such you can eiather allow all or create an
ICMP rule for the src ips

also make sure you use the right DEVICE... eth0 is mine but might not be yours

=====
"No touchy NO TOUCHY! Emperor Kuzko -=Emperor's New Groove=-"

__________________________________________________
Do you Yahoo!?
Yahoo! Tax Center - forms, calculators, tips, more
http://taxes.yahoo.com/

