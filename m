From: Tasha Smith <natasha3641@yahoo.com>
Subject: Re: Why would these rules cause errors only sometimes?
Date: Thu, 24 Oct 2002 19:54:58 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021025025458.11685.qmail@web40709.mail.yahoo.com>
References: <20021024220039.GA1068@Ajftl1.ajfthome.on.ca>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021024220039.GA1068@Ajftl1.ajfthome.on.ca>
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
To: Alistair@alistairt.ath.cx, netfilter@lists.netfilter.org

INET_IP=`ifconfig eth0 |grep "inet addr"|awk -F : '{ print $2 }'|cut -d \  -f
1`;

"That lines casues this error:"
 
cut: the delimeter must be a single character 
Try `cut --help' for more information.

#################################################################################

> This line will grab your current IP off the ppp0 link --
> 
>   INET_IP=`ifconfig ppp0|grep P-t-P|awk -F : '{ print $2 }'|cut -d \  
> -f 1`;
> 
> this line will grab your current IP off any ethx link
> 
>    INET_IP=`ifconfig eth[x]|grep "inet addr"|awk -F : '{ print $2 
> }'|cut -d \  -f 1`;
> 
> change the above to suit your needs ...
> 
> 
> 	Alistair
> 
> 
> 
> On 2002.10.24 03:44 Tasha Smith wrote:
> > 
> > ---OK...but the only problem is i have a DYNAMIC ip adress. Soo it
> > changes and
> > soo if i put an Ip adress i have right now in my script where eth0 is
> > it will
> > change and then it will block me from the net? How can i get it to
> > update my ip
> > adress in script when it changes!
> > 
> > 
> > __________________________________________________
> > Do you Yahoo!?
> > Y! Web Hosting - Let the expert host your web site
> > http://webhosting.yahoo.com/
> > 
> > 
> 


__________________________________________________
Do you Yahoo!?
Y! Web Hosting - Let the expert host your web site
http://webhosting.yahoo.com/

