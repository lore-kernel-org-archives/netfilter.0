From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: NAT all clients except one
Date: Sun, 28 Mar 2004 09:11:48 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403280911.48315.Antony@Soft-Solutions.co.uk>
References: <BAY12-F64DRNtcIQNT900018171@hotmail.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY12-F64DRNtcIQNT900018171@hotmail.com>
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
To: netfilter@lists.netfilter.org

On Sunday 28 March 2004 5:58 am, Afshin Lamei wrote:

> Hi,
> I have this architecture in my network:
> an Iptables firewall between the LAN and the router. Firewall translates
> all LAN traffic from 192.168.1.x to it's valid IP address.
> I want to continue this, but allow a client - 192.168.1.7 - to perform
> TELNET to my router with his invalid address. what should I add to my
> rules?

iptables -I POSTROUTING -t nat -s 192.168.1.7 -p tcp --dport 23 -d 
ip.of.rou.ter -j ACCEPT

Make sure this rule is before (hence the -I) your all-purpose MASQUERADE or 
SNAT rule.

Antony.

-- 
"The joy of X!!??  I've always hated compiling graphical shite.  You have a 10 
line program, and it ends up depending on the entire known universe."

 - Philip Hands

                                                     Please reply to the list;
                                                           please don't CC me.


