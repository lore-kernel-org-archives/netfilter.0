From: "Tim Evans" <tkevans@tkevans.com>
Subject: Re: iptables for ADSL
Date: Fri, 21 Nov 2003 15:40:08 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031121194008.M88686@tkevans.com>
References: <02b601c3b065$30bf3a50$0200a8c0@ale> <200311211929.hALJTXj29569@agate.rockstone.co.uk>
Reply-To: tkevans@tkevans.com
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200311211929.hALJTXj29569@agate.rockstone.co.uk>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>, "Netfilter lista (iptables)" <netfilter@lists.netfilter.org>

On Fri, 21 Nov 2003 19:29:28 +0000, Antony Stone wrote
> On Friday 21 November 2003 7:25 pm, Alejandro Cabrera Obed wrote:
> 
> > Hi people !!!
> >
> > I have a basic doubt: I want to connect my Linux with iptables to Intrenet
> > via ADSL. Just one question:
> >
> > Do I have to set
> > echo "1" > /proc/sys/net/ipv4/ip_dynadrr
> > in order to work with dynamic addresses asigned by my ISP ????

You just need to capture your dynamically assigned IP address at iptables
startup time and use it in your rules.  I have the following variable
assignment in my RH 7.3 startup sdript (all one line):

INET_IP=`ifconfig eth1 | grep 'inet addr' | awk -F":" '{print $2}' | sed 's/ 
Bcast//'`

Then just use $INET_IP in your rules.
--
Tim Evans, TKEvans.com, Inc.    |    5 Chestnut Court
tkevans@tkevans.com             |    Owings Mills, MD 21117
http://www.tkevans.com/         |    443-394-3864
http://www.come-here.com/News/  |    


