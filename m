From: "Aldo S. Lagana" <alagana@discmail.com>
Subject: RE: Required iptables restart each boot?
Date: Thu, 21 Nov 2002 16:57:29 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002101c291a8$fca3ed50$3864a8c0@discmail.com>
References: <1037761724.2248.10.camel@ben.mis.tnsi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1037761724.2248.10.camel@ben.mis.tnsi.com>
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
To: 'Ben Russo' <ben@umialumni.com>, 'David Wynter' <david@roamware.com>
Cc: 'Netfilter list' <netfilter@lists.netfilter.org>

> 
> On Thu, 2002-11-14 at 13:16, David Wynter wrote:
> > Hi,
> > 
> > I have an iptables script that works just fine. But when I have to 
> > reboot my Linux box it runs the iptables script (it has 
> chkconfig as 
> > 2345 08 92). But none of my PCs on the LAN can see the 
> Internet until 
> > I do "services iptables restart" then they can. But my 
> Linux box can 
> > see the Internet prior to this iptables restart? Any 
> explanation as to 
> > why this is so?
This is because your Linux box has an INTERNET IP address (either DHCP
or static) and thus does not require NAT, etc. just a default gateway
and a DNS resolver and it (the Linux box) can access the Internet..

> 
> Your Linux firewall box...  Does it do DHCP on one or more of 
> the interfaces involved?  iptables starting 08, at what point 
> do the NIC's get finalized?
> 
> Try changing the iptables startup sequence until later, 
> change it to a number higher than "network" (usually 10 on a 
> redhat box).
> 
> 
> > I have another problem too. I am not sure it is related to 
> iptables. I 
> > have iptables on my linux box attached to my LAN. The LAN 
> has 2 PCs a 
> > Win98 notebook and a W2K Server PC. The former can ping the 
> gateway IP 
> > address, but the latter cannot. The former is 10.0.0.5 and 
> the latter 
> > is 10.0.0.6 both within the range of the lansubnet declared in the 
> > iptables script (10.0.0.0/8). The W2K Server can FTP to the 
> Linux box 
> > only via the internet not directly to the gateway IP (10.0.0.1). I 
> > have made sure that packet filtering on the W2K box id OFF. 
> Any ideas 
> > on why the W2K PC cannot access any service on ports I have 
> allowed on 
> > the Linux box with iptables running when the Win98 notebook can? By 
> > the way FORWARD'ed packets are fine for all PCs on the LAN.
> 
> First off, use a more reasonable subnet internally, such as 
> 192.168.137.0/24, (it might help later if you ever have to 
> set up some type of tunelled routing to another network of 
> reserved subnets).
> 
> Not sure what the problem is exactly, but you might check 
> each of the PC's on the internal subnet for their ip 
> configuration.  Make sure that they all have the proper 
> Subnet Mask, Network Address, and Broadcast address.
> 
> 


