From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Can't use hostname instead of ip address in the nat table
Date: Mon, 9 Sep 2002 13:10:55 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209091211.g89CB4v05311@vulcan.rissington.net>
References: <NJEIKNJBEABDOAFIFLOOOEBFCBAA.wualvin@eternalit.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <NJEIKNJBEABDOAFIFLOOOEBFCBAA.wualvin@eternalit.com>
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

On Saturday 07 September 2002 6:40 pm, Alvin Wu wrote:

> My problem is:
>
> I try to nat incoming HTTP requests to be re-directed to internal addresses
> like 192.168.1.2; but fail by capturing destination HOSTNAME (from the
> internet interface eth0) instead of ip address. The command I use for this
> purpose is:
>
> iptables ?t nat ?A PREROUTING -i eth0 ?d www.mydomain.com
> <http://www.mydomain.com/>  -p ?tcp - -dport 80 ?j DNAT  - - to 192.168.1.2
>
> {please ignore the syntax since my email auto-correct software may make it
> somehow differently.}
>
> I have test with different parameters such as interface, chains..etc and
> found that I cannot match a packet by using destination HOSTNAME.
>
> If I use IP address nat, then it works fine.
>
> Can anyone help me what would be the problem is? Can iptables identify
> HOSTNAME in such environment? Is there any critical pre-requisite for this
> to work in a single server box?

iptables can indeed accept a rule with a hostname instead of an IP address 
(although that's not necessarily the recommended way to do things...), the 
only requirement is that the machine has to be able to perform a DNS lookup 
at the time the rule is being entered into the netfilter ruleset.

So, at the time your script is running, do you:
1. have a functioning network connection ?
2. have INPUT and OUTPUT rules which allow DNS to work ?
3. have a DNS resolv.conf file configured ?

Hope this helps,

Antony.

-- 

You can spend the whole of your life trying to be popular,
but at the end of the day the size of the crowd at your funeral
will be largely dictated by the weather.

 - Frank Skinner

