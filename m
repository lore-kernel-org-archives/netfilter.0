From: Rudi Starcevic <tech@wildcash.com>
Subject: Re: Port-forwarding Perfomance
Date: Thu, 24 Feb 2005 16:15:16 -0800
Message-ID: <421E6E14.5020905@wildcash.com>
References: <421D2F04.8090100@wildcash.com>	<1109156169.11713.2.camel@nostromo.bgsecm.com>	<421DE4AF.6040702@wildcash.com>
	<20050223211053.GA12107@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20050223211053.GA12107@bender.817west.com>
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
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

Hi,


I'm still seeing slow performance with my port-forwarding but
have found something interesting that may be problematic.

Just to re-cap:

I have one Linux 66.283.12.21 box and one Windows box 192.168.0.10
I can download a file of the linux box at around 140K/s
That very same file download on the Windows machine is around 15K/s using DNAT and Masq/Forwarding.

However we can upload to the Windows box at 140k/s.

So it is only slow, 15K/s, when the data is coming from Windows then through the Linux Iptables Masq/Forwarding Firewall.

I contacted an earlier Admin for the Windows machine and was informed the TCP window size has been manually increased.

Could this affect Forwarding in Iptables ?

The default maximum TCP window size in Win2000 is 17520 bytes (12 segments).
The current value is set at 131400.

90% of the traffic being port-forwarded are Digital video files.
These range in size from 2MB to 200MB.

So I assume with large files like these Windows would opt for it's largest TCP window size.

I guess the next step is to lower these to their default values and see if it affect bandwidth.

Your thoughts on that would be much appreciated.

Thanks.
Regards,
Rudi




-- 
No virus found in this outgoing message.
Checked by AVG Anti-Virus.
Version: 7.0.300 / Virus Database: 266.4.0 - Release Date: 22/02/2005


