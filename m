From: "B. McAninch" <bmcaninch@penson.com>
Subject: Re: Send local traffic to a different server.
Date: Wed, 23 Jun 2004 10:39:32 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1088005171.2406.5.camel@wslinux-fractal.penson.com>
References: <s0d956ae.099@GroupWise>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <s0d956ae.099@GroupWise>
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

Check that you have Netfilter kernel support for 'NAT of local
connections' (this may or may not help).


On Wed, 2004-06-23 at 09:08, Brett Simpson wrote:
> I've tried a number of different PREROUTING and POSTROUTING rules and can't seem to make this work.
> 
> I have a system with a single nic (eth0). While I'm on the system via a shell I would like to connect to 127.0.0.1:6000 and get seemlessly translated to 207.156.7.15:80.
> 
> I tried the following without success:
> 
> iptables -t nat -A PREROUTING  -p tcp -d 127.0.0.1   -i lo --dport 6000 -j DNAT--to-destination 207.156.7.15:80
> iptables -t nat -A POSTROUTING -p tcp -d 207.156.7.15 -o eth0 --dport 80 -j SNAT --to-source 127.0.0.1

-- 
Bryan McAninch

Network Security Engineer

Penson Financial Services, Inc.

214.765.1366

