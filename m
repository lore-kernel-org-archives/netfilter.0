From: Jason Opperisano <opie@817west.com>
Subject: Re: web server in DMZ
Date: Tue, 28 Sep 2004 10:17:29 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1096381048.2330.47.camel@wolfpack.ljm.dom>
References: <web-6416739@infinito.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <web-6416739@infinito.it>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Tue, 2004-09-28 at 06:21, hamals@infinito.it wrote:
> I have a big problem
> 
> I have a web server in my DMZ, I reach it with his 
> internal IP 192.168.1.10 from my internal LAN, but I can't 
> reach them with his public IP.
> 
> I did a DNAT and from internet everythings is ok, my web 
> server is working in right by DNAT.
> 
> Where is the problem?

are you asking how to connect to the web server from the inside by its
public IP address?  if so, you just need another DNAT rule, probably:

  iptables -t nat -A PREROUTING -i $INSIDE_IF -p tcp -d $WWW_PUB_IP \
    --dport 80 -j DNAT --to-destination 192.168.1.10

-j

-- 
Jason Opperisano <opie@817west.com>


