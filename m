From: Hudson Delbert J Contr 61 CS/SCBN <Delbert.Hudson@LOSANGELES.AF.MIL>
Subject: RE: How to block only MX query made to DNS server
Date: Mon, 29 Nov 2004 10:27:33 -0800
Message-ID: <29F6FAF7F2C0D41190980002A513591E0E93BAAE@FSNSAB30>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="----_=_NextPart_000_01C4D640.526C53FE"
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: 'pravin rane' <pgr_80@yahoo.com>, Daniel Chemko <dchemko@smgtec.com>, netfilter@lists.netfilter.org

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_000_01C4D640.526C53FE
Content-Type: text/plain;
	charset="iso-8859-1"

pravin,

	i know a way to do this but i need to know who it is that you are
	trying to block from doing mx resolution?

	mx queries to the dns system.

	this is a staple of bind.

	internal users need this from your internal	servers.

	external clients needs to have the mail handler resolved
	to point at the secure mail address. 

	need more info on who you are filtering, the query type (mx)
	is self is needed.

~v/r,
piranha

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org]On Behalf Of pravin rane
Sent: Saturday, November 27, 2004 8:18 PM
To: Daniel Chemko; netfilter@lists.netfilter.org
Subject: RE: How to block only MX query made to DNS server


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

------_=_NextPart_000_01C4D640.526C53FE--

