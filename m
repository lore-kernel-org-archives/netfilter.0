From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: Problem with bridge+iptables+ulog
Date: Wed, 12 Mar 2003 13:50:21 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030312135021.58bf6699.arnt@c2i.net>
References: <078601c2e886$039a49e0$13fcc5cb@Housecall>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <078601c2e886$039a49e0$13fcc5cb@Housecall>
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

On Wed, 12 Mar 2003 15:55:34 +0530, 
"hare ram" <hareram@sol.net.in> wrote in message 
<078601c2e886$039a49e0$13fcc5cb@Housecall>:

> Hi all
> 
> some one can help i have the following setup
> 
> x.x.x.1/24            x.x.x.2/24
>    +----------+                     +------+
>    | Router A |---------+ +---------| PC B |
>    +----------+         | |         +------+
>                         | |
>                     eth0| | eth1
>                       +-----+
>                       | qos | (br0 =3D x.x.x.3/24)
>                       +-----+
> 
> 
> 
> Router A is connected to internet
> QOS box running with bridge
> PC B is my LAPTOP
> 
> iam try to make the ULOG usig the following command
> 
> 
> $IPTABLES -I INPUT -i eth1 -j ULOG --ulog-nlgroup 1 --ulog-cprange
>    --ulog-qthreshold 50 --ulog-prefix "EXT_IN"

..does eth1 have an ip address?  Why does br0 have an ip address 
at all?  IMNTHO, it does not need it, but then I can generate logs 
from: 'tcpdump -i $interface | grep -v $whatever-I-dont-need \
 | grep $what-I-want.etc.iterate.greps.as.needed >> $logfile '
 
> iam not able to see any LOG here in my LOG file
> 
> when i do this with out  interfce
> 
> $IPTABLES -I INPUT  -j ULOG --ulog-nlgroup 1 --ulog-cprange
>    --ulog-qthreshold 50 --ulog-prefix "EXT_IN"
> 
> iam able to see some logs using BR0
> 
> how can i get the logs from eth0 and eth1
> 
> any suggestion will be great
> 
> hare


-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.


