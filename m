From: "Ming-Ching Tiew" <mingching.tiew@redtone.com>
Subject: Re: Multiple IPSEC VPNs through a firewall based on 2.4.2X kernel
Date: Tue, 24 Aug 2004 13:46:45 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <012801c4899d$bd5e9660$0100a8c0@newlife>
References: <09D3F703EF3B0A4CBE28449EA9F3D32069F456@nicta-atp-mail.in.nicta.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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


> 
> I am trying to set up multiple ipsec VPN clients working behind a Linux
> router with NAT/PAT, based on a 2.4.20 (can be 2.4.22) kernel. I would
> like to be able to connect a number of Windows (2k or XP) machines to an
> existing Cisco VPN server. 
> 
> client 1 (ipsec) --->  | router |
> client 2 (ipsec) --->  |  NAT/ |
> .         PAT | -> ipsec VPN server (Cisco)
> .      | |
> client 10 (ipsec) --->| |
> 

Instead of making your VPN clients tunnel thru' Linux NAT router,
it would be better if you make the Linux NAT router perform
IPSEC VPN client functions with the Cisco ipsec VPN server 

In the configuration I mention, you are effectively putting IPSEC
behind NAT,  whereas to have IPSEC before NAT, that's a lot 
more problematic.









