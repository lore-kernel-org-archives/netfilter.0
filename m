From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: DHCRELAY through IPTABLES Firewall
Date: Sun, 27 Oct 2002 09:09:04 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021027080906.OMSF9836.mta01-svc.ntlworld.com@there>
References: <001001c27d72$1352c350$8f33e40f@lsmith5953>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001001c27d72$1352c350$8f33e40f@lsmith5953>
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

On Sunday 27 October 2002 4:33 am, bigman@monster-solutions.net wrote:

> All,
>     I am wondering if someone out there would be so kind as to help me
> figure out why I cannot get DHCRELAY to relay DHCP requests from one LAN
> segment to another LAN segment where a Windows 2000 DHCP server resides. I
> have verified that the requests are hitting the DHCRELAY on 67/UDP and then
> the DHCRELAY is trying to send back out on ETH2 (LAN2 Segment) to the DHCP
> Server on LAN1, but there is nothing after that. I have used Snort in
> sniffer mode and I can see UDP traffic on 68/UDP and 67/UDP on LAN2, but I
> never see any on LAN1. So my guess is that for some reason it is not
> routing through the firewall correctly. Any help would be greatly
> appreciated.

Tell us:

1. Your netfilter rules

2. Your network addresses for LAN1 and LAN2.

3. The routing table on the firewall.

4. Your dhcrelay command line.

Antony.

-- 

If at first you don't succeed, destroy all the evidence that you tried.

