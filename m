From: pravin rane <pgr_80@yahoo.com>
Subject: RE: How to block only MX query made to DNS server
Date: Sat, 27 Nov 2004 20:17:55 -0800 (PST)
Message-ID: <20041128041755.17971.qmail@web12307.mail.yahoo.com>
References: <7C9884991ADAE0479C14F10C858BCDF56795EA@alderaan.smgtec.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <7C9884991ADAE0479C14F10C858BCDF56795EA@alderaan.smgtec.com>
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
Content-Transfer-Encoding: 7bit
To: Daniel Chemko <dchemko@smgtec.com>, netfilter@lists.netfilter.org

That is right but only when all clients are using my
DNS server. I will not be able to block MX requests if
they are using some other DNS servers which are
out-side of my network and I can not force my clients
to use only my DNS server.

Using iptables I can build a rule for certain ICMP
TYPE Packets. Is there any rule which can match DNS
query TYPE?

regards
Pravin Rane.
--- Daniel Chemko <dchemko@smgtec.com> wrote:

> pravin rane wrote:
> > Hi all,
> > 
> > I want to block DNS MX query made through my
> network.
> > What iptables rule I should use.
> 
> You don't use iptables to do this. named has built
> in ACL's to determine
> who can perform what oeprations. Look at bind
> 'view's for more
> information on how to properly deal with name
> resolution issues.
> 


=====
--
                                                               __..-'
                                                         _.--''
                                               _...__..-'
                                             .'
                                           .'
                                         .'
                                       .'
            .------._                 ;
      .-"""`-.<')    `-._           .'
     (.--. _   `._       `'---.__.-'     Fly High Till You Reach
      `   `;'-.-'         '-    ._               The Sky
        .--'``  '._      - '   .         
         `""'-.    `---'    ,            
 ''--..__      `\                              Warm Regards
         ``''---'`\      .'              
                   `'. '                       Pravin Rane.


	
		
__________________________________ 
Do you Yahoo!? 
Yahoo! Mail - You care about security. So do we. 
http://promotions.yahoo.com/new_mail

