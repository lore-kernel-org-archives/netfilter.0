From: "Sebastian" <netfilter@basti79.de>
Subject: RE: Adding listening ports
Date: Tue, 29 Jul 2003 23:06:58 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c35615$5993db70$0200a8c0@basti79>
References: <3F26C5D3.7080002@zicorp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F26C5D3.7080002@zicorp.com>
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
To: 'Richard Plana' <rplana@zicorp.com>, Netfilter Mailinglist <netfilter@lists.netfilter.org>

Hello...

You can also add "Port 443" to /etc/ssh/sshd_config or whatever your ssh
config file is.

Greets
Sebastian.


> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org 
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of 
> Richard Plana
> Sent: Tuesday, July 29, 2003 9:07 PM
> To: netfilter@lists.netfilter.org
> Subject: Adding listening ports
> 
> 
> Hi,
> 
> Because of (overly?) strict security policies at our company, one can 
> only make TCP connections to ports 80 and 443. I was wondering if 
> netfilter could be used to redirect packets destined for port 
> 443 to the 
> listening sshd daemon on port 22 on an external machine.
> 
> I tried "iptables -I RH-Lokkit-0-50-INPUT 5 -p tcp -m tcp 
> --dport 443  
> --syn -j ACCEPT" (I'm using RedHat's default config) and "iptables -t 
> nat -A PREROUTING -p tcp --dport 443 -j DNAT --to-destination 
> 127.0.0.1:22" to do the actual routing, but that didn't seem to work:
> 
> $ ssh -p 443 localhost
> ssh: connect to host localhost port 443: Connection refused
> 
> Suggestions would be appreciated.
> -- 
> 
> 
> *Richard Neal Plana, B.Sc., CCNA*
> Lead Software Engineer
> Zi Corp.
> 
> 
> 


