From: Steve Cherry <steve.cherry@brandid.co.uk>
Subject: Re: Redirect for transparent proxy does not work with https
Date: Mon, 24 Mar 2003 10:08:57 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E7ED939.5060500@brandid.co.uk>
References: <20030321175750.6512.qmail@hm36.locaweb.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: "Luis Fernando C. Talora" <talora-listas@talora.com.br>
Cc: netfilter@lists.netfilter.org

You cannot transparent proxy HTTPS, it's inherent in the design of SSL

Have a look at

http://en.tldp.org/HOWTO/mini/TransparentProxy-2.html

section 2.3

Luis Fernando C. Talora wrote:

>Fellows,
>
>I've tried to use RedHat Linux 8.0 to build a transparent proxy with squ=
id (squid-2.4.STABLE7-4) and netfilter=20
>(iptables-1.2.6a-2). Squid is listening on port 8080. When a http packet=
 arrives, the requisition appears on squid=20
>log and the page is viewed nicely. When a https requisition is made, squ=
id seem not to recieve the redirection=20
>from netfilter, though. The nat rule used for redirection follows:
>
>      iptables -t nat A PREROUTING -i $EXTERNAL_INTERFACE -p tcp -d ! $I=
NTERNAL_NETWORK -m multiport --
>dports 80,443 -j REDIRECT --to-port 8080
>
>Can anybody please help me?
>
>Thanks a lot!
>
>Regards,
>
>Lu=EDs Fernando C. Talora
>
>



