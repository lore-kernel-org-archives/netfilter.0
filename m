From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: Urgent: Please help me about block port 80
Date: Thu, 20 May 2004 23:16:57 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1085109417.23610.12.camel@localhost>
References: <40AC6EA8.69A94AF4@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40AC6EA8.69A94AF4@hotmail.com>
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
To: Patrick <boysdk@hotmail.com>
Cc: netfilter@lists.netfilter.org

On Thu, 2004-05-20 at 04:39, Patrick wrote:
> Dear sir/madam,
> 
> My goal is to allow only one IP(192.168.1.10) to access my server via
> port 80 or 8080 and forward all request from port 80 to port 8080.
> 
> What I do is as below.
> 
> *nat
> :PREROUTING ACCEPT [1:48]
> :POSTROUTING ACCEPT [3:230]
> :OUTPUT ACCEPT [3:230]
> -A PREROUTING -p tcp -m tcp --dport 80 -j REDIRECT --to-ports 8080
> COMMIT
> *filter
> :INPUT ACCEPT [0:0]
> :FORWARD ACCEPT [0:0]
> :OUTPUT ACCEPT [0:0]
> :RH-Lokkit-0-50-INPUT - [0:0]
> -A INPUT -j RH-Lokkit-0-50-INPUT
> -A RH-Lokkit-0-50-INPUT -p tcp -m tcp -s 192.168.1.10/255.255.255.255
> --dport 8080 --syn -j ACCEPT
> -A RH-Lokkit-0-50-INPUT -p tcp -m tcp -s 192.168.1.10/255.255.255.255
> --dport 80 --syn -j ACCEPT
> -A RH-Lokkit-0-50-INPUT -p tcp -m tcp --dport 0:1023 --syn -j REJECT
> COMMIT
> 
> It seems that the port 80 and 8080 open to public after I add prerouting
> rule.  Would you mind how I could acheive my goal?  Thanks a lot.
> 
> Best regards,
> Patrick
Indeed, it looks like there's not much to keep them out! When you change
the dport from 80 to 8080, it zips right around the one REJECT rule you
have as would any UDP traffic or any TCP traffic above 1023 for that
matter.  I would suggest changing the INPUT and FORWARD policies to DROP
rather than ACCEPT.  This will drop everything that is not explicitly
allowed.  Right now, you are allowing everything that is not explicitly
denied.  I also normally set my OUTPUT policy to DROP as well.  This
way, in case someone does compromise my firewall, there is only so much
they can do (unless, of course, they change the OUTPUT rules!).
I would suggest perusing a good iptables tutorial such as Oskar
Andreasson's (there's a link to it at http://www.netfilter.org).  There
is also a slide show on iptables in the training section at
http://iscs.sourceforge.net.
Good luck - John
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


