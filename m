From: Filip Sneppe <filip.sneppe@cronos.be>
Subject: Re: different DMZs which is better?
Date: 14 Jan 2003 13:26:00 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1042547161.464.17.camel@xbox>
References: <001e01c2bb10$05d79300$9865fea9@win2k.com> 
	<001201c2bb38$25e45980$1e01a8c0@win2k.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001201c2bb38$25e45980$1e01a8c0@win2k.com>
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
To: Mike <mikeeo@msn.com>
Cc: netfilter@lists.netfilter.org

On Mon, 2003-01-13 at 20:15, Mike wrote:
> I talked with my ISP and they will route me a /30 for my firewall and a /28
> for the DMZ segment. The DMZ will be hosting a webfarm does anyone have a
> list of things I should to the box besides filtering rules? like how I can
> stop directed broadcasts etc... 

You may want to install a package called "systune" - it's very
useful for this kind of tuning. Alternatively, you could prepend
or append your firewall script with these settings.

Check out Oscar Andreasson's sysctl tutorial for all the
relevant info on network /proc settings.

http://ipsysctl-tutorial.frozentux.net/

Some things that spring to mind:

echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
echo 1 > /proc/sys/net/ipv4/icmp_ignore_bogus_error_responses
for f in /proc/sys/net/ipv4/conf/*/accept_redirects; do
    echo 0 > $f
done
for f in /proc/sys/net/ipv4/conf/*/accept_source_route; do
    echo 0 > $f
done
echo 0 > /proc/sys/net/ipv4/tcp_timestamps

> I am going to accept Established and New
> connections in the forward chain going to the webservers and drop invalid.
> Is that ok for webservers or should I also accept related? Im only going to
> open up port 80 to the webservers and drop everything else.
>
For port 80/http traffic, "RELATED" doesn't really have any meaning,
except that ICMP error messages can also be related to a TCP or UDP
traffic flow, things like ICMP "fragmentation needed" messages.
So you may actually want to allow RELATED traffic too.

Regards,
Filip


 



