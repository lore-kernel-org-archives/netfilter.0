From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: Can someone help me to configure my DMZ?
Date: Tue, 19 Aug 2003 17:34:01 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030819173401.25ba135d.arnt@c2i.net>
References: <002a01c36362$98b74bc0$0e021b0a@WAGNERGC>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <002a01c36362$98b74bc0$0e021b0a@WAGNERGC>
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

On Fri, 15 Aug 2003 16:22:40 -0300, 
"Wagner" <wagnergc@itautec-philco.com.br> wrote in message 
<002a01c36362$98b74bc0$0e021b0a@WAGNERGC>:

> Hello,
> 
> I'm new to iptables and i'll have to configure my DMZ like this:

...no, you didn't, because you made your ascii art too wide.

..squeeze it to within 72 characters or less, and repost.

> 
>                                     ______________________
>                                     |                               
     |>                                     |         INTERNET          
 |>                                     |_____________________|
>                                                      |
>                                                      |  STATIC IP
> (200.X.X.X - ETH0)
>                                      _________|______________
> STATIC IP                     |           FIREWALL              |
> (192.168.0.1 - ETH2)      |          RED HAT 9               |
>            ______________|  WEB SERVER (APACHE)
>            |__________________________                        |  DNS
>            |SERVER (BIND)        ||
>            |                        |  FTP SERVER                   |
> STATIC IP (10.0.0.1 - ETH1)   |
>            |                        |________________________|
> |
>            |
> | STATIC IP (10.0.0.2 - ETH0)
>            |
> ______________|_________
>            |
> |     DMZ (ONE MACHINE)    |
>            |     STATIC IP (192.168.0.2)
> |            RED HAT 9             |
>    _____|_________________________
> |  WEB SERVER (APACHE) |
>    |  INTERNAL NETWORK                 |
> |  MAIL SERVER (QMAIL)     |
>    |  (ONE MACHINE - WINDOWS XP) |
> |________________________|
>    |______________________________|
> 
> I've designed this topology, so if there is a mistake in it please
> corret me. The firewall machine has 3 net cards.
> 
> The rules are as follows:
> 
> Outside people can access the WEB, DNS and FTP servers in the
> firewall. Outside people can access the WEB and MAIL server on the
> DMZ.
> 
> Internal network people can access the WEB, DNS, FTP and MAIL in the
> DMZ and in the INTERNET.
> 
> Can someone help me configure IPTABLES to meet this requirement cause
> i am new to iptables.
> 
> Thanks a lot in advance,
> Wagner.
> 


-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.


