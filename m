From: ads nat <adsnat@yahoo.com>
Subject: Re: Restrict LAN users to send mail to Internet but allow to send
	mail to other LAN user.
Date: Thu, 28 Oct 2004 08:35:41 -0700 (PDT)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041028153541.8615.qmail@web60407.mail.yahoo.com>
References: <417FE705.9020505@pbl.ca>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <417FE705.9020505@pbl.ca>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Aleksandar Milivojevic <amilivojevic@pbl.ca>, netfilter@lists.netfilter.org

I tried to find out sendmail solution for the problem
but could not find any article or mailing list topic
for the subject. Can you please guide me how to use
sendmail to only allow certain LAN users to send mail
to outside world and others will be rstricted to LAN
users onle. 
Thanks for support.


--- Aleksandar Milivojevic <amilivojevic@pbl.ca>
wrote:

> ads nat wrote:
> > Now I want to allow LAN users to send emails to
> each
> > other on LAN but want to allow some LAN users to
> send
> > email to Internet(Outside world).
> > Is there any way using Linux iptables firewall to
> > acieve this requirement.
> 
> I will assume that LAN users are allowed to connect
> to mail server only, 
> and not to outside world.  Controlling this on
> Sendmail level would be 
> much more simpler and efficient.  Assuming you are
> using Sendmail as 
> your MTA.  Netfilter isn't suited for this, because
> there's no way for 
> it to know if SMTP connection between client (LAN
> user) and server is 
> delivery of email addressed to another LAN user, or
> to somebody at the 
> outside.  Also, Sendmail will take care of
> generating appropriate error 
> messages back to the users, while Netfilter would
> simply block the 
> traffic without any explanation to the user what
> happened.
> 
> -- 
> Aleksandar Milivojevic <amilivojevic@pbl.ca>   
> Pollard Banknote Limited
> Systems Administrator                           1499
> Buffalo Place
> Tel: (204) 474-2323 ext 276                    
> Winnipeg, MB  R3T 1L7
> 
> 



		
__________________________________
Do you Yahoo!?
Yahoo! Mail Address AutoComplete - You start. We finish.
http://promotions.yahoo.com/new_mail 

