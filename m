From: "Neil Aggarwal" <neil@JAMMConsulting.com>
Subject: RE: NAT rules for VPN only allowing one user?
Date: Wed, 30 May 2007 10:28:20 -0500
Message-ID: <000c01c7a2cf$279080a0$dededede@neilhp>
References: <5C9E8CCEEB81ED498AC0C3B0054704F3029377CC@webmail.latis.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <5C9E8CCEEB81ED498AC0C3B0054704F3029377CC@webmail.latis.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Martin:

I am using a LinkSys RV042.  Since my remote users are
using the Microsoft XP VPN client, I set up the
PPTP server on the router.

I will have to investigate.

Thanks,
	Neil 

--
Neil Aggarwal, (832)245-7314, www.JAMMConsulting.com
FREE! Eliminate junk email and reclaim your inbox.
Visit http://www.spammilter.com for details.

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Martin McKeay
Sent: Wednesday, May 30, 2007 10:17 AM
To: netfilter@lists.netfilter.org
Subject: RE: NAT rules for VPN only allowing one user?

So this is a limitation of the Linksys router, correct?  What are the
real requirements for user connections?  

Linksys has the BEFVP41, that supports up to 50 VPN connections.  Maybe
an upgrade to this box is in order.  It's on Amazon for $99.  What
router are you using right now?  If it's a WRT54 series wireless router,
there might even be an image you can flash it with to do what you want
right now.

Martin


Martin McKeay, CISSP, GSNA
Product Evangelist
StillSecure
martin@stillsecure.com
707-495-7926
http://cobia.stillsecure.com/mckeay

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Michael Gale
Sent: Wednesday, May 30, 2007 8:37 AM
To: Neil Aggarwal
Cc: netfilter@lists.netfilter.org
Subject: Re: NAT rules for VPN only allowing one user?

Hey,

This sounds like a problem on the VPN gateway device, you should remove
the rule:

"/sbin/iptables -t nat -A POSTROUTING -o eth1
	-d $LINKSYS_VPN_IP -p tcp --dport 1723
	-j SNAT --to-source $ETH1_IP"

And resolve that issue, what is most likely currently happening. Your
VPN router is only setup for or only supports 1 VPN connection per IP
address. So a second connection would over write the first one.

Michael

Neil Aggarwal wrote:
> Jan:
> 
> Actually, I need the SNAT rule to make my remote users look like they 
> are coming from the local network.
> 
> For some reason, the Linksys does not respond to the connection unless

> I have that.
> 
> Thanks,
> 	Neil
> 
> --
> Neil Aggarwal, (832)245-7314, www.JAMMConsulting.com FREE! Eliminate 
> junk email and reclaim your inbox.
> Visit http://www.spammilter.com for details.
> 
> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Jan 
> Engelhardt
> Sent: Tuesday, May 29, 2007 1:13 PM
> To: Neil Aggarwal
> Cc: netfilter@lists.netfilter.org
> Subject: Re: NAT rules for VPN only allowing one user?
> 
> On May 29 2007 12:31, Neil Aggarwal wrote:
> 
>> /sbin/iptables -t nat -A POSTROUTING -o eth1 
>> 	-d $LINKSYS_VPN_IP -p tcp --dport 1723 
>> 	-j SNAT --to-source $ETH1_IP
> 
> This is redundant.
> 
>> Either one of my remote users can connect to the VPN using the 
>> Windows XP VPN client.  But, if one of them is connected and the 
>> other tries to connect, the second person gets to the verifying 
>> username and password screen and then gets an Error 619 that they are

>> not able to connect.
>>
>> I think somehow the existing connection is mis-routing the login for 
>> the second connection.
>>
>> Any ideas what could be going on?
> 
> Use the holy tcpdump.
> 
> 
> 	Jan

--
Michael Gale

Red Hat Certified Engineer
Network Administrator
Pason Systems Corp.



