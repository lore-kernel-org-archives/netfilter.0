From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: Policy Accept + Allow Multiple IP's
Date: Mon, 15 Nov 2004 07:07:16 -0500
Message-ID: <1100520436.2026.5.camel@localhost>
References: <41994F2D.70105@wildcash.com>
	<99fb058804111423054365bd85@mail.gmail.com>
	<99fb0588041114231136b9056e@mail.gmail.com>
	<4199558B.6080006@wildcash.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4199558B.6080006@wildcash.com>
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
To: Rudi Starcevic <tech@wildcash.com>
Cc: Netfilter users list <netfilter@lists.netfilter.org>

As Paul mentioned, I would strongly recommend a default drop policy. 
However, should you need the default accept, you can streamline the
packet processing by using a user defined chain.  This will allow any
long list of allowed SSH IPs to be separated from normal packet
processing:

iptables -N sshchain
iptables -A FORWARD -p 6 --dport 22 -j sshchain
iptables -A sshchain -s x.x.x.x -j ACCEPT
iptables -A sshchain -s y.y.y.y -j ACCEPT
iptables -A sshchain -s z.z.z.z -j ACCEPT
iptables -A sshchain -j DROP

Hope this helps - John

On Mon, 2004-11-15 at 20:19, Rudi Starcevic wrote:
> Thanks Paul,
> 
> Was hoping for a simple solution and well please to know I can do it 
> both ways.
> 
> Many thanks
> Best regards Rudi
> 
> Paul Annesley wrote:
> 
> >---------- Forwarded message ----------
> >From: Paul Annesley <paul.annesley@gmail.com>
> >Date: Mon, 15 Nov 2004 18:05:17 +1100
> >Subject: Re: Policy Accept + Allow Multiple IP's
> >To: Rudi Starcevic <tech@wildcash.com>
> >
> >
> >On Mon, 15 Nov 2004 16:51:57 -0800, Rudi Starcevic <tech@wildcash.com> wrote:
> >
> >
> >  
> >
> >>Hi,
> >>
> >>I have an Iptables firewall with a default policy of accept.
> >>
> >>I want to allow only certain IP's ssh access.
> >>
> >>So far I have this rule which allows 1 ip:
> >>
> >>iptables -A INPUT -p tcp --dport 22 -s ! xxx.xxx.xxx.xxx -j DROP
> >>
> >>I'm not sure how to list more that 1 allowable IP.
> >>
> >>This is a production box I've inherited so I'm hoping to work with I already
> >>have but may need to look at changing the default policy to drop or
> >>something.
> >>    
> >>
> >
> >Perhaps you should look at making the policy DROP and allowing
> >specific traffic..
> >However what you're after can be done with two rules.. something like;
> >
> >iptables -A INPUT -p tcp --dport 22 -s x.x.x.x -j ACCEPT
> >iptables -A INPUT -p tcp --dport 22 -j DROP
> >
> >  
> >
> >>Please advise, many thanks.
> >>Regards Rudi
> >>
> >>
> >>    
> >>
> >
> >
> >
> >  
> >
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com
---
If you are interested in helping to develop a GPL enterprise class
VPN/Firewall/Security device management console, please visit
http://iscs.sourceforge.net 


