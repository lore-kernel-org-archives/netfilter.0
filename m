From: "Ming-Ching Tiew" <mingching.tiew@redtone.com>
Subject: Re: Multiple IPSEC VPNs through a firewall based on 2.4.2X kernel
Date: Tue, 24 Aug 2004 15:50:45 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <018a01c489af$106ce2b0$0100a8c0@newlife>
References: <09D3F703EF3B0A4CBE28449EA9F3D32069F456@nicta-atp-mail.in.nicta.com.au> <012801c4899d$bd5e9660$0100a8c0@newlife> <20040824073219.GA25002@tranquility.scriptkitchen.com>
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



> On Tue, Aug 24, 2004 at 01:46:45PM +0800, Ming-Ching Tiew wrote:
> > Instead of making your VPN clients tunnel thru' Linux NAT router,
> > it would be better if you make the Linux NAT router perform
> > IPSEC VPN client functions with the Cisco ipsec VPN server 
> 
> How does one do that? Does one have to install a different software for that?
> 

Redhat distributions include IPSec capabilities, though I am not too 
familiar with the versions. 

If you would like to roll your own, I recommend you use openswan -
freeswan/superfreeswan are supposed to be freezed or in slow maintainance
mode.

You must first find out if the Cisco is going to use 'Aggressive Mode'. 
Avoid using 'Aggressive Mode' if possible. If 'Aggressive mode' is 
needed you have to use openswan-1.0.7, otherwise use openswan-2.1.4 
or 2.1.5 because they patch the kernel more cleanly.







