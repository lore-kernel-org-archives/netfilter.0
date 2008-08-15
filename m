From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: iptables rules for cups printer discovery
Date: Fri, 15 Aug 2008 11:16:39 -0500
Message-ID: <48A5ABE7.2040008@riverviewtech.net>
References: <19894-78618@sneakemail.com> <48A4DD48.3080004@riverviewtech.net> <alpine.LNX.1.10.0808142150080.25617@fbirervta.pbzchgretzou.qr> <48A4E340.1090305@riverviewtech.net> <alpine.LNX.1.10.0808142202380.25617@fbirervta.pbzchgretzou.qr> <30978-20009@sneakemail.com> <alpine.LNX.1.10.0808150912130.27140@fbirervta.pbzchgretzou.qr> <19140-74447@sneakemail.com> <48A59EE8.8090709@riverviewtech.net> <17319-84921@sneakemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <17319-84921@sneakemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 08/15/08 10:38, Stephen Isard wrote:
> Thanks, Grant.

*nod*

> I don't think any spoofing is required.  I had in mind someone who had 
> gained access to my local network (not simple, but not out of the 
> question) and who was essentially pretending to be a printer by sending 
> packets from his port 161 immediately following a cups broadcast.  I'm 
> not worried about people without access to the local network because 
> they wouldn't see the broadcast that opens the "recent" time window.

Um, if they have gotten a system in to your LAN I think you have bigger 
problems.  If this is a real concern, I'd suggest that you look in to 
802.1x (port) authentication.

Also remember that you can adjust the length of time for the "recent" 
window.  You can probably also mitigate the window by looking for the 
closing connection (at least with TCP) and do a --remove to clear the 
connection from the recent list.

> Am I fussing over nothing here?  Is it clear that much harm can be done 
> by getting upd packets through my firewall to arbitrary high numbered 
> ports?  Denial of service is probably not a big issue because of the 
> short time window.

I don't think you are fussing over nothing, but you certainly should 
consider other things first.  Now if you have already considered the 
other things, then by all means, continue discussing here.  ;)



Grant. . . .
