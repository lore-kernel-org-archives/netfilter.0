From: "ITM CS Ruslan O. Nesterov" <ruslan@complexsystem.ru>
Subject: Re: netfilter under heavy load.
Date: Mon, 6 Jan 2003 14:24:15 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1262587210.20030106142415@complexsystem.ru>
References: <007101c2b4d0$be992520$0100a8c0@win98>
Reply-To: "ITM CS Ruslan O. Nesterov" <ruslan@complexsystem.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <007101c2b4d0$be992520$0100a8c0@win98>
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
To: netfilter-admin@lists.netfilter.org, Mike Olivere <mikeeo@msn.com>
Cc: netfilter@lists.netfilter.org

Hello Mike,
   Well actually it's not a big problem, I got 100 GB a day passing
   through our gateway to our clients, as far i didn't find any
   problems for webservers wich are not NATed, as for clients who are
   in DMZ zone i sometimes get connection error, but it's 1 in 1000
   connections. I run a box with the following configuration:
   Single PIII-866 MHZ
   RAM: 256
   NIC: 2 Intel Gigabit ethernet cards (as far as i remember).
   Befor it I used a Firebox firewall and it really drived me nuts.
   Due to low productivity.
   
Sunday, January 5, 2003, 6:40:15 PM, you wrote:

MO> Hello, I don't know if this has been brought up before but I am going to be
MO> running netfilter under load on a fractional T-3 (12Mbps). The box will have
MO> 3 interfaces eth0 going to the Cisco 7200, eth1 (routable IPs) going to the
MO> webfarm for DMZ zone, and then eth2 will be NATed with a private LAN IP
MO> (192.168.1.x). I will be NATing over 200 clients and I know in the past this
MO> could be a problem with IPCHAINS because it would either run out of memory
MO> or start dropping connections. The webservers get about 7,000 hits a day and
MO> they won't be NATed but will be filtered with a mix of statefule and packet
MO> filtering rules. We have a Cisco PIX 525(which is just a Intel P600/512MB
MO> RAM) in place right now but I would like to move to Netfilter as it will be
MO> running on a dual P1ghz and a gig of memory. Is this possible? can Nefilter
MO> scale to this and beyond? and is there any tweaks I should know about?

MO> Thanks in advance.

MO> Mike



-- 
Best regards,
 ITM                            mailto:ruslan@complexsystem.ru



