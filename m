From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: Newbie Question
Date: Tue, 08 Jun 2004 07:09:53 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1086692992.23830.6.camel@localhost>
References: <MOEOICEDMOAKAHOICANFCEOGEBAA.mafioso1823@contourmediagroup.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <MOEOICEDMOAKAHOICANFCEOGEBAA.mafioso1823@contourmediagroup.com>
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
To: mafioso1823@contourmediagroup.com
Cc: netfilter@lists.netfilter.org

On Tue, 2004-06-08 at 00:16, mafioso1823@contourmediagroup.com wrote:
> I am trying to use this piece of code that i found in my rc.firewall script
> but it doesn't seem to want to take it can anyone tell me why or how i can
> get this to work?
> 
> #The Mangle portion of the ruleset. Here is where unwanted packet types get
> dropped.
> #This helps in making port scans against your server a bit more time
> consuming and difficult, but not impossible.
> *mangle
> :PREROUTING ACCEPT [444:43563]
> :INPUT ACCEPT [444:43563]
> :FORWARD ACCEPT [0:0]
> :OUTPUT ACCEPT [402:144198]
> :POSTROUTING ACCEPT [402:144198]
> -A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG
> FIN,PSH,URG -j DROP
> -A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG NONE -j DROP
> -A PREROUTING -p tcp -m tcp --tcp-flags SYN,RST SYN,RST -j DROP
> -A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN FIN,SYN -j DROP
> -A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG
> FIN,PSH,URG -j DROP
> -A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG NONE -j DROP
> -A PREROUTING -p tcp -m tcp --tcp-flags SYN,RST SYN,RST -j DROP
> -A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN FIN,SYN -j DROP
> -A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG
> FIN,PSH,URG -j DROP
> -A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG NONE -j DROP
> -A PREROUTING -p tcp -m tcp --tcp-flags SYN,RST SYN,RST -j DROP
> -A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN FIN,SYN -j DROP
> -A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG
> FIN,PSH,URG -j DROP
> -A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG NONE -j DROP
> -A PREROUTING -p tcp -m tcp --tcp-flags SYN,RST SYN,RST -j DROP
> -A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN FIN,SYN -j DROP
> COMMIT
Hmm . . . loaded fine for me -- I assume the word wrapping on the long
lines was caused by your e-mail editor does not exist in your file.
What happens when you try to load it?
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


