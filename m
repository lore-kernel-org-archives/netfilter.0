From: "Toshihiro Sonoda" <toshihiro@jp.fujitsu.com>
Subject: Re: h323
Date: Mon, 23 Sep 2002 10:45:24 +0900
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001d01c262a2$e2cbdb70$ccf8a8c0@monday>
References: <3D8DF73A.7020408@iol.it> <003e01c26263$bcbef230$8201a8c0@lw1dqwin>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org


Hi, Diego.

I have questions.
does the new nat patch have h.225ras, or ldap for NAT problems.
before, when i applied the h.323 patch, the patchs
have a part of h.323, but not h.225.
Is that ok?

Can you use ILS server, or Gatekeeper?


> Hi, 
> sorry about my english.
> I use kernel 2.4.17 with the newnat patch and h323 work great !
> Regards,
> 
> Diego
> 
> 
> ----- Original Message ----- 
> From: "Mattia Martinello" <m.martinello@iol.it>
> To: <netfilter@lists.netfilter.org>
> Sent: Sunday, September 22, 2002 2:00 PM
> Subject: h323
> 
> 
> > Hi
> > 
> > I am on a LAN which access to the Internet with a NAT on a gateway Linux 
> > server configured with iptables.
> > How I can use on a client inside the LAN a program which uses h323 
> > protocol, for example Microsoft Netmeeting? I wish to correctly use 
> > text, audio and video features of Netmeeting, and I wish to call and to 
> > be called.
> > 
> > How I can configure the firewall on the gateway server?
> > I rememeber that for ipchains there was an h323 module. There is 
> > anything for iptables too?
> > 
> > Thank you very much
> > Bye
> > Mattia Martinello
> > m.martinello@iol.it
> > 
> > 
> > 
> 
> 

