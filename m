From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: open port to specific ip address
Date: Mon, 10 Nov 2003 11:22:54 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311101123.hAABN7j16772@agate.rockstone.co.uk>
References: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAHvCSmpkyA0+lP5YKpr7djsKAAAAQAAAAnvBmZOFHB0Oj5+mf5BZEMgEAAAAA@petzetakis-africa.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAHvCSmpkyA0+lP5YKpr7djsKAAAAQAAAAnvBmZOFHB0Oj5+mf5BZEMgEAAAAA@petzetakis-africa.co.za>
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

On Monday 10 November 2003 10:55 am, Lohan Spies wrote:

> Hi All,
>
> I need to know how will i open a specific port to a external ip mapping!
>
> I need to specify a internal_ip:port on my internal network, and then if
> someone connects to internal_ip:port it must redirect them to
> external_ip with no cgi scripting and no authentication support!
>
> How will i do this?

ip addr add dev eth1 internal_ip
iptables -A PREROUTING -t nat -d internal_ip -p tcp --dport port -j DNAT --to 
external_ip
iptables -A FORWARD -d external_ip -p tcp --dport port -j ACCEPT

I'm assuming TCP here since you didn't specify - if you need UDP instead 
simply replace in both lines.   Also I've assumed eth1 is your internal 
interface - change if needed.

Antony.

-- 

It's a natural impulse to shape the random events we live through into 
coherent narrative, otherwise our lives would feel like experimental theatre 
or abstract painting, which would be a complete bloody nightmare.

 - Pete McCarthy, The Road to McCarthy
                                                     Please reply to the list;
                                                           please don't CC me.

