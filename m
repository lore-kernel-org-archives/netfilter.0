From: Ranjeet Shetye <ranjeet.shetye2@zultys.com>
Subject: Re: natting help needed urgently.
Date: 09 Sep 2003 12:15:40 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1063134939.8984.16.camel@ranjeet-pc2.zultys.com>
References: <20030909031922.GB2818@linux.local>
	 <20030909080918.28191.qmail@web20710.mail.yahoo.com>
	 <20030909111136.GB1846@linux.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030909111136.GB1846@linux.local>
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
To: Payal Rathod <payal-iptables@staticky.com>
Cc: ads nat <adsnat@yahoo.com>, netfilter@lists.netfilter.org

On Tue, 2003-09-09 at 04:11, Payal Rathod wrote:
> On Tue, Sep 09, 2003 at 01:09:18AM -0700, ads nat wrote:
> > Requesting you to specify how you have solved yourself. It will help us .
> > Thanks
> 
> I made an alias for eth0:1 for that external ip on linux box.
> That made linux box accept the traffic. Then I made a nat rule like,
> 
> iptables -A PREROUTING -t nat -d <ext ip> -j DNAT --to <int ip>
> 
> Thanks all again.
> With warm regards,
> -Payal

For the benefit of the list:

ifconfig and route are limited in capability due to the need for
backward compatibility etc. IP aliasing is being deprecated in favour of
newer tools like the iproute2 suite by Alexey Kuznetsov @
ftp://ftp.inr.ac.ru/ip-routing/ . These new tools will let you twiddle a
lot more knobs in the linux network stack.

for instance, in this case, you can use "ip addr add dev eth0
<neededip>/<netmask>" to assign more than one IP address to a single
interface.

"ip addr" or "ip addr show" for ip level details
"ip link" or "ip link show" for link level details
"ip route" or "ip route show" for routing table details

"ip addr del dev eth0 <ip>/<netmask>" to remove an IP.

More info @ http://www.linuxgrill.com/iproute2-toc.html

Off topic but, "vconfig" will let you create VLAN interfaces, if that's
next on your agenda.

-- 

Ranjeet Shetye
Senior Software Engineer
Zultys Technologies
Ranjeet dot Shetye2 at Zultys dot com
http://www.zultys.com/
 
The views, opinions, and judgements expressed in this message are solely
those of the author. The message contents have not been reviewed or
approved by Zultys.



