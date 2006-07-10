From: Arno van Amersfoort <arnova@eld.physics.leidenuniv.nl>
Subject: Re: iptables rule doesn't work
Date: Mon, 10 Jul 2006 14:11:38 +0200
Message-ID: <44B243FA.6060305@eld.physics.leidenuniv.nl>
References: <200607082247.06089.antonio.dibacco@aruba.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200607082247.06089.antonio.dibacco@aruba.it>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Because you also need a FORWARD rule (I guess).... Something like

iptables -A FORWARD -i eth0 -o {your_lan_eth} -p tcp --dport 80 -j ACCEPT

Antonio Di Bacco wrote:
> I receive on an interface (eth0, NOARP , ipaddr: 192.168.0.20 ) a tcp packet 
> in this way (I have dumped it with tcpdump):
>
> SRC: 192.168.0.21:6000 
> DST: 192.168.0.21:80
>
> I have an iptables rule:
>
> iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j DNAT 
> --to-destination 192.168.0.20:80
>
> Why my web server listening on eth0 doesn't receive it?
>
> Thank you,
> Antonio.
>
>   

-- 
Ing. A.C.J. van Amersfoort (Arno)
Department Of Electronics (ELD, k1007)
Huygens Laboratory
Leiden University
P.O. Box 9504
Niels Bohrweg 2
2333 CA Leiden
The Netherlands
----------------------------------------------------------------
Phone : +31-(0)71-527.1894   Fax: +31-(0)71-527.5819
E-mail: a.c.j.van.amersfoort@eld.physics.leidenuniv.nl
----------------------------------------------------------------
Arno's (Linux firewall) homepage: http://rocky.eld.leidenuniv.nl



