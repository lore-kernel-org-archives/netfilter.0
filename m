From: "B. van Ouwerkerk" <bvo@atz.nl>
Subject: RE: nat no traffic returns
Date: Thu, 22 May 2003 00:33:45 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.0.0.25.0.20030522001817.01e5c8b0@pop.atz-hosting.nl>
References: <09B04A55822EFF4DA48D2E0BB2941D4A0D6C75@wardrive.citadelcom
 puter.com.au>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <09B04A55822EFF4DA48D2E0BB2941D4A0D6C75@wardrive.citadelcom
 puter.com.au>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

At 07:42 22-05-2003 +1000, you wrote:
>Hi,
>
>stupid question but has the inside machine got a default gateway to the 
>firewall?

Last time I checked the default gateway was set to the firewall.

>Have you also tried running tcpump with the command : tcpdump -x port 3389 
>and host public_ip
>to check the traffic and the direction all of it going to and from?

tcpdump is broke on this box ARGH.

But I double checked to see if I could connect to the firewalled box while 
I was connected to the firewall, and I could. As soon as I add rules to 
allow traffic on the INPUT and OUTPUT chains from and to the firewalled box 
I can connect from the firewall to the firewalled box using FTP or WWW. but 
not through the firewall.

TIA,


B.

>____________________________________________
>George Vieira
>Systems Manager
>georgev@citadelcomputer.com.au
>
>Citadel Computer Systems Pty Ltd
>http://www.citadelcomputer.com.au
>
>
>-----Original Message-----
>From: B. van Ouwerkerk [mailto:bvo@atz.nl]
>Sent: Thursday, May 22, 2003 7:34 AM
>To: netfilter@lists.netfilter.org
>Subject: Re: nat no traffic returns
>
>
>
> > > iptables -P FORWARD DROP
> > >
> >You are only allowing packets through the forward chain in the direction
> >eth1->eth0.
> >There is no packet allowed in the other direction.
> >iptables -A FORWARD -i eth0 -o eth1 -d 10.0.0.112 -m multiport --dport
> >3389,21,80 -m state --state NEW -j ACCEPT
> >iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
>
>Thank you for your reply, you are right.. but it didn't help..
>
>Been looking a bit further.. again.. iptables -v -L tells that packets are
>forwarded to eth1, on eth1 I notice that the TX bytes is increasing but the
>RX are stable at the same value.
>Would it be correct to assume this is not an iptables issue but an issue of
>the box behind the Linux box?
>
>TIA,
>
>B.


