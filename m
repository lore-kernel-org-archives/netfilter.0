From: hclfm@pricol.co.in
Subject: RE: How to block only MX query made to DNS server
Date: Tue, 30 Nov 2004 16:06:25 +0530
Message-ID: <OF477B7587.3D58856F-ON65256F5C.00384B89@pricol.co.in>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: pravin rane <pgr_80@yahoo.com>
Cc: netfilter@lists.netfilter.org




>>I tried to run following command

>># iptables -t filter -A INPUT -p udp --dport 53 -m
string --string "MX" -j DROP

>>But I am getting Error like

>>iptables v1.2.8: Couldn't load match
>>`string':/lib/iptables/libipt_string.so: cannot open
>>shared object file: No such file or directory

>>:-( Do I need to upgrade my iptables RPM

Yes. Or rebuild kernel with strings modules support and compile iptables
userspace
again if necessary. Sorry for top posting in my previous reply.

regards,

U.SivaKumar
Security Consultant,
HCL Infosystems Limited.


--- hclfm@pricol.co.in wrote:


---------------------------------

Hi,

In your Linux gateway.

iptables -A INPUT -p udp --dport 53 -m string --string
"MX" -j DROP

regards,

U.SivaKumar,

"Vision is the art of seeing things invisible."
-Jonathon Swift



pravin rane <pgr_80@yahoo.com>
Sent by: netfilter-bounces@lists.netfilter.org
11/29/2004 11:26 PM PST

 To: Hudson Delbert J Contr 61 CS/SCBN
<Delbert.Hudson@LOSANGELES.AF.MIL>, Daniel Chemko
<dchemko@smgtec.com>, netfilter@lists.netfilter.org
 cc:
 bcc:
 Subject: RE: How to block only MX query made to DNS
server




Dear Hudson,

We are in to the Linux Solution provider.

One of our client has taken SILVER PLAN from XXX ISP
According to this plan the client can only use ports
TCP, UDP. 53,25,110,143,80,81 and ports above 1024 for
out side.
Here client can only make normal DNS queries. MX type
of queries get response like "name server can not be
reached" .

We have installed an Internal Mail-server (Sendmail).
Since ISP have blocked MX query to any DNS server
Out-side sendmail is not able to send mails out-side.

I know I can tell sendmail not to use DNS. But before
implementing this new setup at client I want to test
it in my LABS. I want to create the same scenario as
that ISP have done.

Seeking Urgent help form Netfilter Experts.

Bye
Pravin



--- Hudson Delbert J Contr 61 CS/SCBN
<Delbert.Hudson@LOSANGELES.AF.MIL> wrote:

> pravin,
>
> i know a way to do this but i need to know who it
> is that you are
> trying to block from doing mx resolution?
>
> mx queries to the dns system.
>
> this is a staple of bind.
>
> internal users need this from your internal
> servers.
>
> external clients needs to have the mail handler
> resolved
> to point at the secure mail address.
>
> need more info on who you are filtering, the query
> type (mx)
> is self is needed.
>
> ~v/r,
> piranha
>
> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org
> [mailto:netfilter-bounces@lists.netfilter.org]On
> Behalf Of pravin rane
> Sent: Saturday, November 27, 2004 8:18 PM
> To: Daniel Chemko; netfilter@lists.netfilter.org
> Subject: RE: How to block only MX query made to DNS
> server
>
>
> That is right but only when all clients are using my
> DNS server. I will not be able to block MX requests
> if
> they are using some other DNS servers which are
> out-side of my network and I can not force my
> clients
> to use only my DNS server.
>
> Using iptables I can build a rule for certain ICMP
> TYPE Packets. Is there any rule which can match DNS
> query TYPE?
>
> regards
> Pravin Rane.
> --- Daniel Chemko <dchemko@smgtec.com> wrote:
>
> > pravin rane wrote:
> > > Hi all,
> > >
> > > I want to block DNS MX query made through my
> > network.
> > > What iptables rule I should use.
> >
> > You don't use iptables to do this. named has built
> > in ACL's to determine
> > who can perform what oeprations. Look at bind
> > 'view's for more
> > information on how to properly deal with name
> > resolution issues.
> >
>
>
> =====
> --
>
>           __..-'
>
>     _.--''
>
> _...__..-'
>                                              .'
>                                            .'
>                                          .'
>                                        .'
>             .------._                 ;
>       .-"""`-.<')    `-._           .'
>      (.--. _   `._       `'---.__.-'     Fly High
> Till You Reach
>       `   `;'-.-'         '-    ._               The
> Sky
>         .--'``  '._      - '   .
>          `""'-.    `---'    ,
>  ''--..__      `\                              Warm
> Regards
>          ``''---'`\      .'
>                    `'. '
> Pravin Rane.
>
>
>
>
> __________________________________
> Do you Yahoo!?
> Yahoo! Mail - You care about security. So do we.
> http://promotions.yahoo.com/new_mail
>

> ATTACHMENT part 2 application/ms-tnef



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
     (.--. _   `._       `'---.__.-'     Fly High Till
You Reach
      `   `;'-.-'         '-    ._               The
Sky
        .--'``  '._      - '   .
         `""'-.    `---'    ,
 ''--..__      `\                              Warm
Regards
         ``''---'`\      .'
                   `'. '                       Pravin
Rane.



__________________________________
Do you Yahoo!?
Read only the mail you want - Yahoo! Mail SpamGuard.
http://promotions.yahoo.com/new_mail





__________________________________
Do you Yahoo!?
The all-new My Yahoo! - What will yours do?
http://my.yahoo.com






