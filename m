From: Michael Kearey <mutk@iprimus.com.au>
Subject: Re: Problem with -i
Date: Thu, 20 Nov 2003 17:18:45 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FBC6AD5.9010700@iprimus.com.au>
References: <003401c3af33$bd6e6f30$2400a8c0@deloitte.co.mw>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <003401c3af33$bd6e6f30$2400a8c0@deloitte.co.mw>
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
To: kmalewezi@deloitte.co.mw, netfilter@lists.netfilter.org

Kabango Malewezi wrote:
> 	Folks, can you help me with the following problem?
> 
> I'd like to set a policy to accept all packets from etho on network
> 192.168.0.0/24 but when I do this:
> 
> iptables -A INPUT -j  ACCEPT -i eth0 -s 192.168.0.0/24
> 
> the command is accepted. But when I do
> 
> iptables -L     I get
> 
> Chain Input (policy ACCEPT)
> target		prot	opt	source			destination
> ACCEPT	all	---	192.168.0.0/24		anywhere
> 
> My question is WHY don't I see the eth0 anywhere?

man iptables  In particular the switches -v  and -x  etc..
iptables -vn -L INPUT  lists the details you wanted to see.
Cheers,
Michael


