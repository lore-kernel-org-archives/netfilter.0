From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Drop the Current Established Connections
Date: Wed, 01 Jun 2005 11:17:31 -0500
Message-ID: <429DDF9B.4040405@riverviewtech.net>
References: <3b29fb7905053123282b03f832@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <3b29fb7905053123282b03f832@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

iptables -t filter -I INPUT -s ${IPAddress} -j DROP
#iptables -t filter -I INPUT -d ${IPAddress} -j DROP

iptables -t filter -I FORWARD -s ${IPAddress} -j DROP
iptables -t filter -I FORWARD -d ${IPAddress} -j DROP

#iptables -t filter -I OUTPUT -s ${IPAddress} -j DROP
iptables -t filter -I OUTPUT -d ${IPAddress} -j DROP

This should rather abruptly take care of it for you.  The two lines that I commented out should arguable not be needed but I put them there just in case and to serve as a reminder.



Grant. . . .

bright true wrote:
> Hello , 
> 
> i want to know the right way of blocking an ip and drop the current Established 
> 
> connections from that ip 
> 
> Thanks

