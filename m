From: "Patrick Ahler" <patrick@vikus.com>
Subject: RE: how to filter kazaa
Date: Wed, 21 May 2003 12:15:21 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <ABEKJILKOKKGGDJKHKDFKEJECBAA.patrick@vikus.com>
References: <20030521155812.B03D96C9B7@honorio.sinectis.com.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030521155812.B03D96C9B7@honorio.sinectis.com.ar>
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
To: kisero@uolsinectis.com.ar
Cc: netfilter EMAIL <netfilter@lists.netfilter.org>

The kazaa protocol was built so it is extremely difficult to block...
there's no way your going to block it by just closing off a few ports, it's
smarter than that.

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of
eribicic@sinectis.com
Sent: Wednesday, May 21, 2003 11:58 AM
To: georgc@FARMINGDALE.EDU; jaws@skyinet.net;
netfilter@lists.netfilter.org
Subject: RE: how to filter kazaa


isnt it easyer to filter ports 1214?

> The following rule has worked for me.
>
> http://www.securityfocus.com/infocus/1531
>
>
> $IPTABLES -A FORWARD -p tcp -m string --string X-Kazaa-Username: -j REJECT
> --reject-with tcp-reset
>
> $IPTABLES -A FORWARD -p tcp -m string --string X-Kazaa-Network: -j REJECT
> --reject-with tcp-reset
>
> $IPTABLES -A FORWARD -p tcp -m string --string X-Kazaa-IP: -j REJECT
> --reject-with tcp-reset
>
> $IPTABLES -A FORWARD -p tcp -m string --string X-Kazaa-SupernodeIP: -j -j
> REJECT --reject-with tcp-reset
>
> -----Original Message-----
> From: tracker [mailto:jaws@skyinet.net]
> Sent: Wednesday, May 21, 2003 3:20 PM
> To: netfilter@lists.netfilter.org
> Subject: how to filter kazaa
>
> Hi all,
>
> Im new to this list and iptables. I would like to know how to filter
kazaa.
>
> Thanks.
>
> Jaws
>
>
>
--
Slds.




