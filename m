From: Kurt Tragant <k.tragant@firemail.de>
Subject: Re: strange log entries concerning mail server
Date: Mon, 17 Feb 2003 12:20:11 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1045480811000076@lycos-europe.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=_NextPart_Lycos_0000761045480811_ID"
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
To: netfilter@lists.netfilter.org

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

--=_NextPart_Lycos_0000761045480811_ID
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Willi,

thanks for your answer.

> Look at
>
http://www.iptables.org/documentation/tutorials/blueflux/iptables-tutorial.html#NEWNOTSYN
> (The paragraph with "..bad Microsoft TCP/IP implementations.." )
> This *could* be the problem as long as your machine makes outgoing 
> sessions to these ports 

The mail server doesn't make outgoing connections to these ports (I think, I
should have noticed it, because I have a DROP policy).Additionally, as I
understand in your cited part of the  netfilter manual, only microsoft products
have these problems. My mail server is a qmail on linux 2.4.20. Maybe there are
any other ideas? I would be thankful...

Regards
Kurt Tragant

__________________________________________________________________
Arcor-DSL Flatrate - jetzt kostenlos einsteigen und bis zu 76,18 Euro sparen!
Arcor-DSL gibt es jetzt auch mit bis zu 1500 Mbit/s Downstream! http://www.angebot.arcor.net/cgi-bin/angebot.cgi?key=b13e92247022


--=_NextPart_Lycos_0000761045480811_ID--


