From: Kirk <whereisgui@gmail.com>
Subject: Re: Confused about NAT and forwarding
Date: Tue, 22 Feb 2005 15:48:33 -0800
Message-ID: <48be50bb050222154859fcced0@mail.gmail.com>
Reply-To: Kirk <whereisgui@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Thanks for such quick replies!

>>PRIV_PROXY_IP=192.168.0.2
>>PUB_PROXY_IP=a.b.c.d
>>IPT=iptables
>>
>>$IPT -t nat -I POSTROUTING -s $PRIV_PROXY_IP -o eth0 -j SNAT --to
>>$PUB_PROXY_IP

I just tried this solution but now the proxy can't access the DNS
servers. I think I know what the problem is.

 I'll try both suggestions  tomorrow morning. Right now I have a bunch
of angry people calling my office because they can't connect to the
proxy server :)

Later.

