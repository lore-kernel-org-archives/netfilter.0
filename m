From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Iptables forwarding
Date: Wed, 26 Jun 2002 10:35:55 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206260936.g5Q9a3U11320@vulcan.rissington.net>
References: <1C61B9073EBFBD40B45FA90B8265B2DD1BDF@MELXCHW01.oz.quest.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <1C61B9073EBFBD40B45FA90B8265B2DD1BDF@MELXCHW01.oz.quest.com>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

On Wednesday 26 June 2002 8:41 am, Loc Huynh wrote:

> Hi all,
>
> I finally had the iptables 1.2.6a installed and it's working great (on
> Redhat 7.3)
> However, I have a small problem.
> I have the following setup for forwarding on port 80 to our IIS web server.
>
> $IPTABLES -A FORWARD -i $INTERNALIF -p tcp --dport 80 -j ACCEPT
> $IPTABLES -A PREROUTING -t nat -p tcp -d $INTERNALIP --dport 80 -j DNAT
> --to-destination $HTTPFWDIP:80
>
> The above worked fine if I have the "FORWARD" to be open to ACCEPT
> ie: $IPTABLES -P FORWARD ACCEPT
>
> Of course, I don't want the default is open to "ACCEPT", is there anyway to
> avoid this please ?

$IPTABLES -A FORWARD -i $EXTERNALIF -d $HTTPFWDIP -p tcp --dport 80 -j ACCEPT

ie: Allow packets from the external interface in to your web server.

 

Antony.

