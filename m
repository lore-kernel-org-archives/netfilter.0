From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: REPOST: PLEASE HELP..Routing an IP adress from a NATted
	interface..
Date: Sun, 22 Aug 2004 17:36:28 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1093210587.2041.17.camel@localhost>
References: <1093156100.14147.17.camel@Sewak.Asr.Lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1093156100.14147.17.camel@Sewak.Asr.Lan>
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
To: skpobox@hotpop.com
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>

On Sun, 2004-08-22 at 02:28, Sanjay Arora wrote:
> Hi all
> 
> My small cable ISP has a Linux box which is supposed to route my ip
> addtress. Normally, he is issuing private space ips in address range
> 172.16.x.x. I have asked for a live IP and he has issued one,
> 202.x.x.139.
> 
> The problem is that he has other IP addresses on the same interface,
> which are NATted to provide connectivity to 172.16.x.x. So when I get a
> web request, my server logs 202.x.x.137 as the source IP, which is
> actually my gateway on the ISP machine.
> 
> On the other hand when I send mail, my source ip from the other end
> looks to be 202.x.x.130, which is again the ISPs IP.
> 
> It seems that despite being issued a live IP, my IP is being proxied
> somehow or the source address is being mangled. The ISP does not seem to
> have the expertise to route the IP properly ;-) and has told me either
> to accept it, to tell him how is he supposed to do it or go back to
> 172.16.x.x address.
> 
> I myself am a ipfilter newbie. Can someone tell me how an IP is routed
> on an interface which is providing NAT services on a second IP. Pointers
> to resources for further reading on issues involved and any similar
> scripts/samples will be greatly appreciated. (My ISP seems to talk about
> pre-routing a lot....does not really tell exactly how he is pre-routing
> the packets for my IP).
> 
> With best regards.
> Sanjay.
It's a little difficult to tell what's going on from the information you
supply.  Perhaps a little ASCII network diagram would help.  Are your
internal devices on the same network as the Cable modem internal
interface? Is 202.x.x.137 the address on the internal or external cable
modem interface?  I am guessing that your set up is:

         ________________________
         | Cable provider network|
         |_______________________|
                     |
                     |
         ______________________________
         |     202.x.x.137 + others    |
         |         Cable Modem         |
         |     172.16.x.x              |
         |_____________________________|
                     |
                     |
         ______________________________
         |      Your internal network  |
         |      172.16.x.x/24          |
         |_____________________________|
            |                  |
            |                  |
________________       ___________________
|Web server     |      | Mail Server      |
|172.16.x.a     |      | 172.16.x.b       |
|NAT to         |      | NAT to           |
|202.x.x.139    |      | 202.x.x.139      |
|_______________|      |__________________|

Is this correct? The Cable modem needs to DNAT traffic to
202.x.x.139:http to 172.16.x.a, SNAT traffic from 172.16.x.a:http to
202.x.x.139, DNAT traffic to 202.x.x.139:pop3,imap,etc. to 172.16.x.b
and SNAT traffic from 172.16.x.b:pop3,imap,etc. to 202.x.x.139.  Is this
correct?
If so, DNAT is handled in the PREROUTING chain of the nat table and SNAT
is handled in the POSTROUTING chain of the nat table.  Oskar
Andreasson's tutorial has some excellent explanations of how this
works.  You can find it at
http://iptables-tutorial.frozentux.net/iptables-tutorial.html
There are also some slide shows regarding iptables and related
technologies in the training section on http://iscs.sourceforge.net
Hope this is what you were looking for - John
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com


