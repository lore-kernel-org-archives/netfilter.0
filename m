From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Blocking access to UDP port 53 (DNS)
Date: Mon, 11 Aug 2003 13:02:05 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030811170205.GB11900@cannon.eng.us.uu.net>
References: <12CC60849165134FB7DF8570B621F4D5FC4C@mailxserver.euler.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <12CC60849165134FB7DF8570B621F4D5FC4C@mailxserver.euler.com>
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
To: "Len L." <len@euler.com>
Cc: netfilter@lists.netfilter.org

On Mon, Aug 11, 2003 at 11:25:21AM -0500, Len L. wrote:

> Does anyone know how to block the use of a DNS server (udp port 53) from outside, but still have external mail be able to resolve addresses?
> 

Yes. You set up the dns for your domain having several name servers without
your own server being listed as one (which doesn't mean that your own server
cannot be one, it can even serve as the primary but only a hidden one).
This way you make sure that the TLD or SLD is not sending any refferals to
you and you can apply the rules below without any problem (if your server
is a hidden primary, you need to provide TCP/53 and UDP/53 access from the
external secondary name servers). This is a short and cryptic description
as to what to do. For more info I defer to a DNS HowTo.

Ramin

> Here is what I tried ( xxx.xxx.xxx.0 is our external net that the dns server is on)
> 
> iptables -A INPUT -s xxx.xxx.xxx.0/24 -p udp -j LOG --log-prefix "XXX LOCAL UDP DNS  XXX  "
> iptables -A INPUT -s xxx.xxx.xxx.0/24 -p udp -j ACCEPT
> iptables -A INPUT -p udp -j LOG --log-prefix "XXX INPUT UDP LOG-drop XXX  "
> iptables -A INPUT -p udp -j DROP
> 
> DNS requests from our machines works with the rules above, but here is the message a remote system gets when someone mails us: 
> 
> Aug 11 10:33:52 remotemachine sendmail[16732]: h7BFVAAR016730: to=<len@machine.ourdomain.com>, ctladdr=<someone@their.domain.com> (0/0), delay=00:01:49, xdelay=00:01:49, mailer=esmtp, pri=30344, relay=machine.ourdomain.com., dsn=4.0.0, stat=Deferred: Name server: machine.ourdomain.com.: host name lookup failure
> 
> 
> Len Laulainen
> 

