From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: help needed.
Date: Fri, 7 Nov 2003 12:55:54 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311071255.hA7Ctwj14697@agate.rockstone.co.uk>
References: <3FAB92BA.4090003@newweb.oktanet.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3FAB92BA.4090003@newweb.oktanet.fi>
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

On Friday 07 November 2003 12:40 pm, Mikko Kallio wrote:

> We have one linux as gateway with multiple static ips (212.23.233.2-60)
> and nat .We also have lan with ip range 192.168.132.0/24.
> This works ok, every machine on lan connecting to internet shows up with
> ip 212.23.233.2 (which is our linux), but i'd like to set one of the lan
> machines to use static ip ex. 192.168.132.230 so that it shows with
> 212.23.233.40 example and connections from outside to ip 212.23.233.40
> will be natted on 192.168.132.230.

iptables -A POSTROUTING -t nat -s 192.168.132.230 -j SNAT --to 212.23.233.40
iptables -A PREROUTING -t nat -d 212.23.233.40 -j DNAT --to 192.168.132.230

Plus whatever FORWARDing rules you need to allow through the protocols you 
want.

Antony.

-- 

If builders built buildings the way programmers write programs,
then the first woodpecker that came along would destroy civilisation.
                                                     Please reply to the list;
                                                           please don't CC me.

