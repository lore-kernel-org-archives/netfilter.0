From: "Mark E. Donaldson" <markee@bandwidthco.com>
Subject: RE: Port range forwarding
Date: Mon, 12 Jan 2004 23:01:43 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401130701.i0D71jHu017343@server5.bandwidthco.com>
References: <983D227A-4594-11D8-BAD3-000A95DA9C9A@msa.hinet.net>
Reply-To: <markee@bandwidthco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <983D227A-4594-11D8-BAD3-000A95DA9C9A@msa.hinet.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-2022-jp"
To: 'Max Yin' <max.yin@msa.hinet.net>
Cc: netfilter@lists.netfilter.org

I am not aware of any built-in method to take one source port block and have
it translate straight over and in logical order to a different destination
port block.  If I'm wrong here, I'm sure I'll be corrected.  Now, the
"redirect" target closely resembles this functionality.  The tutorial
describes it this way:

"The --to-ports option specifies the destination port, or port range, to
use. Without the --to-ports option, the destination port is never altered.
This is specified, as above, --to-ports 8080 in case we only want to specify
one port. If we would want to specify an port range, we would do it like
--to-ports 8080-8090, which tells the REDIRECT target to redirect the
packets to the ports 8080 through 8090. Note that this option is only
available in rules specifying the TCP or UDP protocol with the --protocol
matcher, since it wouldn't make any sense anywhere else."

-----Original Message-----
From: Max Yin [mailto:max.yin@msa.hinet.net] 
Sent: Monday, January 12, 2004 10:49 PM
To: markee@bandwidthco.com
Cc: netfilter@lists.netfilter.org
Subject: Re: Port range forwarding

Well, thanks for your reply.
Since I'm doing this in uClinux, both memory and performance are limited.
Your suggestion should work but... one setting might create hundreds of
rules.

So, netfilter cannot be configured to use two port ranges with the same
range but different starting port number (3100-3500 to 2100-2500)?



於 2004/1/13 下午 2:26 時，Mark E. Donaldson 提到：

> I'm sure there are some better solutions available, but this should 
> work:
>
> i=3100
> while [ "$i" -le 3500 ]
> do
> 	$IPT -t nat -A PREROUTING -i eth0 -j DNAT -p tcp --	dport $i
> --to-destination 192.168.2.60:$i
>
> 	i=`expr $i + 1`
> done
>
> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Max Yin
> Sent: Monday, January 12, 2004 4:43 AM
> To: netfilter@lists.netfilter.org
> Subject: Port range forwarding
>
> Hi,
> I'm not sure if this question is already been asked before or not, 
> because I
> can't find any discussion before.
>
> I want to setup a port forwarding rule that will translate a specified 
> port
> range to another port range, for example:
>
> iptables -t nat -A PREROUTING -i eth0 -j DNAT -p tcp --dport 3100:3500
> --to-destination \ 192.168.2.60:2100-2500
>
> But I found that all connections from 3100 to 3500 will be mapped to 
> 2100
> port only, not 3100 to 2100, 3101 to 2101, etc.
>
> So, how can I make it? or is it possible ?
>
> Thanks
> Max
>
>
>
>



