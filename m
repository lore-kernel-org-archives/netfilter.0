From: Jason Opperisano <opie@817west.com>
Subject: Re: Forwarding traffic from local lan to another host?
Date: Mon, 29 Nov 2004 14:56:25 -0500
Message-ID: <1101758185.10064.64.camel@hubcap.ljm.dom>
References: <s1ab2ce1.045@mail.toolsnottoys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <s1ab2ce1.045@mail.toolsnottoys.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Mon, 2004-11-29 at 14:09, Reginald NALLARATNAM wrote:
> Hello,
>    Is there a way to forward any traffic from local LAN going to an ftp site to another ftp site.
> Example:
> If the client ftp's to host 216.24.35.53 from the local LAN, is there a way to send that traffic to a different ftp server say 216.24.36.55?
> (Sort of port forwarding outwords?)
> 
> Thanks.

  iptables -t nat -A PREROUTING -i $INSIDE_IF -p tcp -d 216.24.35.53 \
    --dport 21 -j DNAT --to-destination 216.24.36.55

  iptables -t nat -A PREROUTING -i $INSIDE_IF -m helper --helper ftp \
    -d 216.24.35.53 -j DNAT --to-destination 216.24.36.55

  iptables -A FORWARD -m state --state ESTABLISHED, RELATED -j ACCEPT

  iptables -A FORWARD -i $INSIDE_IF -p tcp --syn -d 216.24.36.55 \
    --dport 21 -j ACCEPT

can't say i've actually tested this--but that would be the theory...

-j

--
"Ah, good ol' trustworthy beer. My love for you will never die."
	--The Simpsons


