From: Payal Rathod <payal-netfilter@scriptkitchen.com>
Subject: Re: LAN accessing DMZ
Date: Sun, 18 Jul 2004 13:39:37 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040718173937.GA31408@tranquility.scriptkitchen.com>
References: <f51b72bc040718062373640612@mail.gmail.com> <200407181739.05377.Antony@Soft-Solutions.co.uk> <20040718165830.GA30303@tranquility.scriptkitchen.com> <200407181812.31070.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200407181812.31070.Antony@Soft-Solutions.co.uk>
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
To: netfilter <netfilter@lists.netfilter.org>

On Sun, Jul 18, 2004 at 06:12:31PM +0100, Antony Stone wrote:
> I do not see how TCP port 10000 should be accessible from the Internet either 
> (which is what I believe you were asking about - allowing access to the DMZ 
> from the Internet, but not from the LAN?)

We will keep it more simple. All ports which are allowed from internet are 
allowed from LAN (192.168) range for DMZ. Ok? Just for start-up.

> Please post the output of "iptables -L -nvx; iptables -L -t nat -nvx".   Post 
> it on the website if you prefer (the formatting is probably easier to read 

I do not have access to that machine till tomorrow. But I have copied the 
firewall script at,
http://payal.staticky.com/fw2.txt
I have masked the real IP and I have noticed a small error now.
"INET_IFACE" is not eth0 as in script but eth1. eth0 is blank. Not
using it.
My firewall IP is 10.10.10.1.

> there anyway).   Please also post the IP addresses of the machine you are 
> connecting from, and the machine you are connecting to, on TCP port 10000.

I am connecting from any machine in range 192.168/16

If you want any more *live* information I will get it tomorrow.

With warm regards,
-Payal

