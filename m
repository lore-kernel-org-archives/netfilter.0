From: Philip Craig <philipc@snapgear.com>
Subject: Re: IPTables & Squid
Date: Fri, 01 Aug 2003 18:10:59 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F2A2093.8020200@snapgear.com>
References: <5.1.0.14.2.20030801094250.02f127f0@mail.saipan.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <5.1.0.14.2.20030801094250.02f127f0@mail.saipan.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Daniel Camacho <dcamacho@saipan.com>
Cc: netfilter@lists.netfilter.org

Daniel Camacho wrote:
 > I'm new to this list and to IPtables. I recently installed a transparent
 > proxy using Squid and IPtables. On one computer, I installed IPtables and
 > forward all port 80 requests to the Squid server, which is running on a
 > separate server. On that same computer I want to be able to filter certain
 > connections from using the Squid. I know I can do this with Squid, but I
 > want to know how to do it with IPtables. Does anyone know how may I go
 > about doing this? Thanks.

Do you want to just pass these connections through directly instead of
forwarding them to the Squid server, or do you want to drop them completely?

If you just want to pass them through, you need to stop them reaching the
DNAT rule.  You have already done this for the squid server itself, but
that method only allows you to pass through one IP address.  A more general
method is to add ACCEPT rules for each address (just repeat the first
rule for each address to pass through):

# start up filter rules for traffic redirection to Squid
iptables -t nat -A PREROUTING -i eth0 -s 192.168.0.1 -p tcp --dport 80 -j ACCEPT
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j DNAT --to 192.168.0.1:3128

If you want to drop the connections, then you need to put DROP or REJECT
rules in the FORWARD chain of the filter table.  Make sure you put them
before the rules ACCEPTing traffic from each subnet.

-- 
Philip Craig - philipc@snapgear.com - http://www.SnapGear.com
SnapGear - Custom Embedded Solutions and Security Appliances


