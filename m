From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: forwarding/proxying
Date: Wed, 10 Sep 2003 09:34:40 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <49554.193.173.35.183.1063179280.squirrel@www.sterenborg.info>
References: <71650A6F73F1D411BE8000805F65E3CB3B35DC@SRV-03>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <71650A6F73F1D411BE8000805F65E3CB3B35DC@SRV-03>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

jwsacksteder@ramprecision.com said:
> With netcat it is possible to proxy arbitrary ip:port destination pairs.
> Could this be done with netfilter rules entirely?
>
> As an example, I have a host that listens for incoming tcp connections on
> port 110 and I want to forward them to port  5900 on another host
> transparently. Obviously ftp and any other multichannel protocols would

You mean like this ?

# If default FORWARD policy is DROP, then allow this :
iptables -A FORWARD -i <if_in> -d <ip_other_host> \
  -p tcp --dport 5900 -j ACCEPT
(and of course the RELATED,ESTABLISHED stuff)

# Forward port 110 to 5900 on other host :
iptables -t nat -A PREROUTING -i <if_in> -p tcp --dport 110 \
  -j DNAT <ip_other_host>:5900


Gr,
Rob


