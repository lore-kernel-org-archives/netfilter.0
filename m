From: "Stephen Isard" <y8ju2p902@sneakemail.com>
Subject: Re: iptables rules for cups printer discovery
Date: Fri, 15 Aug 2008 11:38:22 -0400 (EDT)
Message-ID: <17319-84921@sneakemail.com>
References: <19894-78618@sneakemail.com> <48A4DD48.3080004@riverviewtech.net> <alpine.LNX.1.10.0808142150080.25617@fbirervta.pbzchgretzou.qr> <48A4E340.1090305@riverviewtech.net> <alpine.LNX.1.10.0808142202380.25617@fbirervta.pbzchgretzou.qr>
 <30978-20009@sneakemail.com> <alpine.LNX.1.10.0808150912130.27140@fbirervta.pbzchgretzou.qr> <19140-74447@sneakemail.com> <48A59EE8.8090709@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48A59EE8.8090709@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; format="flowed"; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org



On Fri, 15 Aug 2008, Grant Taylor wrote:

> If you are worried about someone else spoofing an IP in your recent list, 
> look in to the --rttl option to have the recent list remember the TTL values 
> of packets and require them to be the same.  This way if some jerk off who is 
> more hops away from you is trying to pretend to be you, his traffic will 
> appear to be at a different TTL than yours.  This is not fool proof, but it 
> will sure help reduce the risk of exposure that you are referring to.

Thanks, Grant.

I don't think any spoofing is required.  I had in mind someone who had 
gained access to my local network (not simple, but not out of the 
question) and who was essentially pretending to be a printer by sending 
packets from his port 161 immediately following a cups broadcast.  I'm 
not worried about people without access to the local network because 
they wouldn't see the broadcast that opens the "recent" time window.

Am I fussing over nothing here?  Is it clear that much harm can be done 
by getting upd packets through my firewall to arbitrary high numbered 
ports?  Denial of service is probably not a big issue because of the 
short time window.
