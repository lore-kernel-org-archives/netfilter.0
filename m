From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: SSH dnat
Date: Sun, 1 Dec 2002 20:16:08 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021201201608.35bfade7.arnt@c2i.net>
References: <000801c29949$359d2a70$02a8a8c0@hades>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000801c29949$359d2a70$02a8a8c0@hades>
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

On Sun, 1 Dec 2002 15:52:02 +0100, 
"Ambor" <ambor@alternity.net> wrote in message 
<000801c29949$359d2a70$02a8a8c0@hades>:

> Hello everyone,
> 
> I'm trying to dnat SSH throught the firewall to an internal machine.
>  I use following Rule
> 
> iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 2323 -j DNAT
> --to-destination internal_IP:2323
> 
> eth0 is connected to internet
> 
> The problem is that the connection is allrght it just seems that I
> don't get an answer from the ssh server.(I'm getting a connection
> timeout, ot a connection refused)
> 
> To be sure I don't filter anything, so all trafic is accepted

..you and your internet ssh customers have ssh on port 2323 and not 22?

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



