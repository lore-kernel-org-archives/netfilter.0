From: "Joel n.solanki" <zealous@bonbon.net>
Subject: Re: allowing connection
Date: 11 Sep 2004 09:37:44 +0530
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094875664.1436.21.camel@joel.d2visp.com>
References: <20040910181819.GA31430@tranquility.scriptkitchen.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040910181819.GA31430@tranquility.scriptkitchen.com>
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
To: Netfilter ML <netfilter@lists.netfilter.org>

If you have 2 lan cards.
eth0 --connected to internet
eth1 --connected to lan

then ..
Make the default policy of FORWARD to DROP
Just FORWARD the client's ip so that it can get internet access.
All other machines will communicated with each other but not with the
internet.

Without mac binding.
iptables -A FORWARD -i eth1 -s 192.168.1.x -j ACCEPT
iptables -A FORWARD -i eth0 -d 192.168.1.x -j ACCEPT

With mac binding.
iptables -A FORWARD -i eth1 -s 192.168.1.x -m mac --mac-source
00:00:00:00:00:00 -j ACCEPT
iptables -A FORWARD -i eth0 -d 192.168.1.x -m mac --mac-source
00:00:00:00:00:00 -j ACCEPT


Regards,
On Fri, 2004-09-10 at 23:48, Payal Rathod wrote:
> Hi,
> Right now I am allowing only my client's LAN access one of my 
> design's machine from the internet. Their LAN is a simple network,
> with a single IP and other machines are masqueraded. Now I want to allow
> only one of their machine to access my machine. Can I do it? I mean 
> the machine is on 192.168.1.x series of IP, but can I restrict it
> on mac address basis? If yes, how do I do it?
> 
> With warm regards,
> -Payal
-- 
Joel N.Solanki
Network Administrator
Phone No: 0265-550001/2/3/4/5 Ext: 211/212
Digtial 2 Virtual Internet Service Provider.
http://www.packetraptor.com/
http://www.d2visp.com/
Gujarat (India)




