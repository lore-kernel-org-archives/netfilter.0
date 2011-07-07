From: netfilter@buglecreek.com
Subject: Re: Iptables State Table
Date: Thu, 07 Jul 2011 10:19:34 -0600
Message-ID: <1310055574.13240.2149268161@webmail.messagingengine.com>
References: <41268.1309529522@princeton.edu>
 <1310050556.12710.2149230885@webmail.messagingengine.com>
 <4E15CCDF.7010704@abpni.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com; h=message-id:from:to:mime-version:content-transfer-encoding:content-type:references:subject:in-reply-to:date; s=smtpout; bh=MY0K/givf5P5UoBpI2LbsPv0s/Y=; b=fLp0rFx9qfWMvS0p/a01ljwZccjUFaYOwywXVtR44HUpRPl/tHp1rjP4c9rMi41VJxihupqD5aXP/qy7+d138X6hXhkXqY4m04MyH50SFxCvauFHzJ38u6IaSLBOsLABs1v21xKBEW70b1MTp8yqPH8BJQIQv2QLuT0a5kkysEI=
In-Reply-To: <4E15CCDF.7010704@abpni.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Jonathan Tripathy <jonnyt@abpni.co.uk>, netfilter@vger.kernel.org



On Thu, 07 Jul 2011 16:12 +0100, "Jonathan Tripathy"
<jonnyt@abpni.co.uk> wrote:
> 
> 
> netfilter@buglecreek">netfilter@buglecreek.com wrote:
> > Given the following simplified rules:
> > iptables -A INPUT -i eth0 -m state --state ESTABLISHED,RELATED -j ACCEPT
> > iptables -A OUTPUT -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
> >
> > When the system boots, various daemons create persistent connections
> > that stay established indefinitely to authentication servers like the
> > following:
> > clientSytem:44444 ----->  authServer:389
> > This creates an entry in the iptables state table which works fine. 
> > But, occasionally the state table gets cleared out.  Usually by
> > something simple like someone restarting iptables. Once that happens the
> > established connection is still there, but when the authServer sends a
> > packet back to the clientSystem the packet is viewed as new and
> > eventually gets dropped since their is nothing in the state table.  The
> > only way I can think of allowing for this is to create a rule that
> > allows new connections from the authServer:389 to the clientSystem:any. 
> > Is there a better way?
> > --
> > To unsubscribe from this list: send the line "unsubscribe netfilter" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >   
> Shouldn't the software in question detect a connection drop and then 
> re-attempt to connect to the server?
> 
The connection never drops.  Netstat shows the connection as
ESTABLISHED, but the iptables state table does not have the connection
since it was cleared.  So, if there were no iptables running the
connection would carry on normal comms. Since there are rules that only
allow established connections the packet gets dropped due to the
clearing of the state table. Hope that makes sense.
