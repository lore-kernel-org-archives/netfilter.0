From: Evan Harper <elh1@sympatico.ca>
Subject: Re: Can't get port forwarding DNAT to work
Date: Fri, 12 Dec 2003 12:50:16 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FD9FFD8.8000502@sympatico.ca>
References: <3FD3D084.7060206@sympatico.ca> <200312111329.57484.Alistair Tonner <>>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <>>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Alistair@mail.nerdnet.ca, netfilter@lists.netfilter.org


>>iptables -t nat -A PREROUTING -i ppp0 -p tcp --dport 25 -j DNAT --to
>>192.168.0.4:25
>># forward smtp traffic to mail server
>>    
>>
>
>	Now you've changed the destination of the packets.  Have you allowed the 
>packets to get to the destination.   You need an equivalent rule in FORWARD 
>to  let those DNATTED packets IN. ...
>  
>
Indeed, this was my problem, which I figured out after I sent this 
message. Personally I think section 4.2 of the NAT HOWTO ought to 
mention this, since it seems to imply you need only the one rule.

Evan Harper


