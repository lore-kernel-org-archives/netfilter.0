From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: Blocking IP
Date: Thu, 29 Jul 2004 09:04:04 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <410903D4.6050203@pbl.ca>
References: <5.1.0.14.2.20040602145807.00b74bf8@pop3.netcologne.de> <001601c47565$8e0ba110$858310ac@suarapembaruan.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001601c47565$8e0ba110$858310ac@suarapembaruan.com>
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
Cc: netfilter@lists.netfilter.org

david wrote:
> Dear all,
> 
> My mail server received so many virus mails from ip 202.145.10.147 and after
> i look at gateway (linux) and i using iptraf i see so many traffic from
> 202.145.10.147.
> After that i try to block all traffic from 202.145.10.147 with command :
> #iptables -A INPUT -s 202.145.10.146 -j DROP
> 
> but i still receiveall traffic from 202.145.10.146......
> Can anybody help me ........... that ip send virus in to mail server more
> then 20 mails per minute.......

Are the mail server and gateway two separate hosts?  If yes, you need to 
add the rule to the FORWARD chain.  Packet will go through INPUT chain 
of filter table only if its destination is local host (the gateway in 
your case).  If packet is to be forwarded to another host, it will go 
only through FORWARD chain of filter table.  In no circumstance are you 
going to see packet going through both INPUT and FORWARD chains of 
filter table.

If the mail server is running on the gateway host, check the order of 
your rules.  Are there any rules before the one you just added that 
would accept the packets from "bad host"?

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

