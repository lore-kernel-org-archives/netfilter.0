From: "Sundaram Ramasamy" <sun@percipia.com>
Subject: Log rules
Date: Wed, 16 Oct 2002 17:23:19 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003d01c2755a$3f9067d0$8c01a8c0@sundaram>
References: <B9D38D9C.45F%george@mattandgeorge.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: George Agnelli <george@mattandgeorge.com>, netfilter@lists.netfilter.org

Hi,

I have following rules in my firewall script. It's dumping lot of error
message. I want to capture all incoming outgoing packet on the external
interface. How will I change this rules.

# Log the packet
for chain in INPUT OUTPUT FORWARD PREROUTING POSTROUTING
do
  for table in filter mangle nat
  do
    $IPT -I $chain -t $table -j LOG --log-prefix="$chain $table "
  done
done

Is there any log analyzing tools for iptables log.
Thanks
SR


