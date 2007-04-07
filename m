From: MKS <rekordmeister@gmail.com>
Subject: Re: packets to local addresses
Date: Sat, 7 Apr 2007 14:13:49 +0000
Message-ID: <fad2fb270704070713w37a73f82o3caaf14f987a0f7a@mail.gmail.com>
References: <fad2fb270704060522r4322a223g4e2e40605b3fb6a@mail.gmail.com>
	<46167157.3080409@rtij.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=tUH0o2VSl/Wjs7gh0/geT+EgdNGDC2SMFsv6UXhp1o555S2HC6kRkI/Ii+mp32/aXibd4sHBumrDl1WYwFvlf+STo5Qpg7fYQtxPBQupNeQEDs7zh6bpqHwiRej0RX+1S52BWvT+dPgbtoUftwsrMNlv3BXQYN7dzbAWfR41N6Y=
In-Reply-To: <46167157.3080409@rtij.nl>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On 4/6/07, Martijn Lievaart <m@rtij.nl> wrote:
> MKS wrote:
> > Hello list
> >
> > I have a scenario the a computer has 2 PPP connections, where the
> > computer is the ppp client.
> >
> > $ifconfig
> >
> > ppp0   inet  10.0.0.1 p-t-p  192.168.1.1 mask 255.255.255.255
> >
> > ppp1 inet  10.0.1.1 p-t-p 192.168.1.1 mask  255.255.255.255
> >
> > for testing purpuses I want packets from ppp0 to ppp1 to actually go
> > over the physical connection
> >
> > e.g.
> >
> > ping  10.0.0.1 -I ppp1 should send the packet over the ppp1 (and out
> > underlyging physical interface eth0) and it should arrive on the ppp0
> > interface. (routing is taken care of at the ppp server)
>
> The -I flag only changes the source address of the packets, not the
> routing. And as the packet is destined for the machine itself, it goes
> over the loopback interface.

What is the best way to change this behaviour, that is force "general"
packets out a specific interface. iptables route target???

Thanks
MKS

