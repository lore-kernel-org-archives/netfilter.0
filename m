From: ads nat <adsnat@yahoo.com>
Subject: Re: problem using MAC address.
Date: Wed, 27 Oct 2004 04:14:58 -0700 (PDT)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041027111458.39741.qmail@web60405.mail.yahoo.com>
References: <417FA5A2.9080204@itak.ua>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <417FA5A2.9080204@itak.ua>
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
To: Logechnik Alexandr <A.Logechnik@itak.ua>, netfilter@lists.netfilter.org

I want to allow access to -d 202.63.167.193 and deny
to all other destination. 
Solutins you have given will restrict access to port
25 at all destinations.

Thanks for support.

--- Logechnik Alexandr <A.Logechnik@itak.ua> wrote:

> ads nat wrote:
> 
> >Hi,
> >I want block forwarding as follows :
> >
> >"iptables -I INPUT 1 -i eth1 -p tcp -m tcp --dport
> 25
> >-m mac --mac-source 00:08:A1:53:BE:71 -d ! 10.0.0.2
> -j
> >DROP"
> >
> >it does not work but when I try to do same thing
> with
> >rule 
> >"iptables -D FORWARD -i eth1 -p tcp -m tcp --dport
> 25
> >-s 192.168.0.42 -d ! 10.0.0.2 -j DROP"
> >
> >Is there any sytax error.
> >
> >Or Do I have to installed any additional module of
> >iptables.
> >I am using Redhat 9.0 Linux.
> >Please guide me.
> >
> >Thanks for support.	
> >
> Sorry, for the fulless answer.
> 
> You not need:
> iptables -I INPUT 1 -i eth1 -p tcp --dport 25 -m mac
> --mac-source 
> 00:08:A1:53:BE:71 -j DROP
> 
> You need:
> iptables -A FORWARD -p tcp --dport 25 -m
> --mac-source 00:08:A1:53:BE:71 
> -j DROP
> 
> -- 
> wbr, Logechnik Alexandr
> 
> In God we trust, but something 
> else must have X.509 certificate
> 
> 
> 



		
__________________________________
Do you Yahoo!?
Yahoo! Mail Address AutoComplete - You start. We finish.
http://promotions.yahoo.com/new_mail 

