From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Change source port
Date: Mon, 26 Nov 2007 19:50:40 -0600
Message-ID: <474B77F0.8080109@riverviewtech.net>
References: <1196115598.27273.1223346377@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1196115598.27273.1223346377@webmail.messagingengine.com>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 11/26/2007 4:19 PM, netfilter@buglecreek.com wrote:
> We have a situation where our nameservers are contacting an upstream
> nameserver to resolve a name using a source port 53 and a destination
> port 53.  We have found out that the upstream name server will not honor
> our request since the source port from our nameservers is 53.  Until we
> can resolve this with the upstream admin, we would like
> change the source port from our name server to a high numbered port
> using iptables when it tries to contact the upstream nameserver.  We can
> not seem to put together a rule to do this.  Is it even possible?  

Refer to the IPTables man page for exact syntax, but yes you can change 
the source port if you SNAT the packets.

iptables -t nat -A POSTROUTING -o ${ExtIF} -p udp --sport 53 -j SNAT 
--to-source ${ExtIP}:${ExtPort}

iptables -t nat -A POSTROUTING -o ${ExtIF} -p tcp --sport 53 -j SNAT 
--to-source ${ExtIP}:${ExtPort}



Grant. . . .
