From: pravin rane <pgr_80@yahoo.com>
Subject: RE: How to block only MX query made to DNS server
Date: Tue, 30 Nov 2004 03:50:58 -0800 (PST)
Message-ID: <20041130115058.82245.qmail@web12301.mail.yahoo.com>
References: <OF477B7587.3D58856F-ON65256F5C.00384B89@pricol.co.in>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <OF477B7587.3D58856F-ON65256F5C.00384B89@pricol.co.in>
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
To: hclfm@pricol.co.in
Cc: netfilter@lists.netfilter.org


--- hclfm@pricol.co.in wrote:

> 
> 
> 
> >>I tried to run following command
> 
> >># iptables -t filter -A INPUT -p udp --dport 53 -m
> string --string "MX" -j DROP
> 
> >>But I am getting Error like
> 
> >>iptables v1.2.8: Couldn't load match
> >>`string':/lib/iptables/libipt_string.so: cannot
> open
> >>shared object file: No such file or directory
> 
> >>:-( Do I need to upgrade my iptables RPM
> 
> Yes. Or rebuild kernel with strings modules support
> and compile iptables
> userspace
> again if necessary. Sorry for top posting in my
> previous reply.
> 
> regards,
> 
> U.SivaKumar
> Security Consultant,
> HCL Infosystems Limited.
> 
> 
> --- hclfm@pricol.co.in wrote:
> 
> 
> ---------------------------------

Hi

Thanks I will do that :D


Thanks


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
Yahoo! Mail - Helps protect you from nasty viruses. 
http://promotions.yahoo.com/new_mail

