From: ip tables <iptables_help@yahoo.com>
Subject: Re: virtual interfaces
Date: Sun, 4 Jul 2004 23:27:34 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040705062734.92171.qmail@web54007.mail.yahoo.com>
References: <a0f69e5040704225918359fec@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <a0f69e5040704225918359fec@mail.gmail.com>
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
Content-Transfer-Encoding: 7bit
To: Askar Ali Khan <askarali@gmail.com>, ip tables <netfilter@lists.netfilter.org>

Hey Askar,

Thanks for your reply. What i wanted to do  was to
have 2 web servers having private IPs( Ex:
192.168.128.5 and 192.168.128.6 on the 255.255.255.0
subnet). The hub connecting these machines would be
connected to my Linux firewall machine. In other words
the private IPs are the ones that make my DMZ, I shall
call this interface which is connected to the DMZ as
eth1. 
What i want to do is redirect all requests to
64.24.12.45 to 192.168.128.5 and 64.24.12.46 to
192.168.128.6 at the moment i have no problem in doing
the natting and everything related to send/receive
from the 64.24.12.45. 
What i thought was to have a virtual interface and
bind the other internet routable address to it, ex
eth0:0. What are my options?
Also how could i do the POSTROUTING SNAT if I cannot
use virtual in terfaces?

Pls help ASAP.

Pretty tight siu here.

TIA

--- Askar Ali Khan <askarali@gmail.com> wrote:
> Hi TIA
> 
> Nope no virtual interfaces support in netfilter
> rules :), here what is
> the reply from Antony Stone to me when i got the
> same problem :)
> 
> "Secondly, netfilter doesn't allow things like
> eth0:1 (it won't accept the
> colon), so all you do is use the normal interface
> name (eth0).   It's the
> asme physical interface anyway, and this will do
> what you want - you can use
> -i eth0 and -o eth0 to match packets coming in or
> going out on eth0:1"
> 
> Regards
> Askar
> 
> On Sun, 4 Jul 2004 21:54:18 -0700 (PDT), ip tables
> <iptables_help@yahoo.com> wrote:
> > Hi gurus,
> > 
> > Does iptables support rules written with virtual
> > interfaces such as eth0:0 for all input,output and
> > forward chains?. Pls help urgent requirement!!
> > 
> > TIA
> > 
> > 
> > __________________________________
> > Do you Yahoo!?
> > Yahoo! Mail is new and improved - Check it out!
> > http://promotions.yahoo.com/new_mail
> > 
> >
> 



		
__________________________________
Do you Yahoo!?
New and Improved Yahoo! Mail - Send 10MB messages!
http://promotions.yahoo.com/new_mail 

