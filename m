From: "Deepak Seshadri" <dseshadri@broadbandmaritime.com>
Subject: RE: allowing connection
Date: Fri, 10 Sep 2004 16:11:45 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200409102007.i8AK7ddg036736@jkcpub.iserver.net>
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
To: 'Payal Rathod' <payal-netfilter@scriptkitchen.com>, 'Netfilter ML' <netfilter@lists.netfilter.org>

Hi Payal,

You can use the MAC match to restrict access.

Something like this:

iptables -t mangle -A PREROUTING -s (Masqueraded_IP) -m mac --mac-source
(MAC_ADDR_MACHINE) -j ACCEPT

Please follow the link below and read 6.4.3.2 for further understanding:

http://iptables-tutorial.frozentux.net/chunkyhtml/matches.html#GENERICMATCHE
S

Hope this helps!

Regards,

Deepak Seshadri


-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Payal Rathod
Sent: Friday, September 10, 2004 2:18 PM
To: Netfilter ML
Subject: allowing connection

Hi,
Right now I am allowing only my client's LAN access one of my 
design's machine from the internet. Their LAN is a simple network,
with a single IP and other machines are masqueraded. Now I want to allow
only one of their machine to access my machine. Can I do it? I mean 
the machine is on 192.168.1.x series of IP, but can I restrict it
on mac address basis? If yes, how do I do it?

With warm regards,
-Payal



