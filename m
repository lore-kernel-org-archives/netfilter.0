From: John Mathey <jmathey@attbi.com>
Subject: another port forwarding question
Date: Wed, 03 Dec 2003 12:25:08 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <6.0.1.1.2.20031203122213.02c31ed8@24.1.40.117>
References: <200312031725.hB3HPYAm010263@discmail.com>
 <20031203184509.GC28783@cannon.eng.us.uu.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031203184509.GC28783@cannon.eng.us.uu.net>
References: <200312031725.hB3HPYAm010263@discmail.com>
 <20031203184509.GC28783@cannon.eng.us.uu.net>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

   I'm trying to figure a way to forward a packet from a linux box to an 
internal windows box given a specific port. I'm pretty sure I can specify a 
port in my browser via a colon: eg: http://myfoobox:196, right?


Here is the rule I've set up in the iptables:



$IPT -t nat -A PREROUTING -d $MYEXTIP -p tcp  -s $MYSOURCEIP -p 196 -j DNAT 
--to 192.168.1.50

Now, if I remove the -p ( port) it works, but I don't want every single 
request coming here to get forwarded, just a specific port, I've tried 
entering this in my browser:

http;//myfoobox    - This works if I don't have a port  (-p ) in my 
iptables rule
http://myfoobox:196  - this doesn't work no matter what
just entering the myfoobox   , still no go.

The rule is the first one in my table so I know it has to at least get 
evaluated, in other words, there's not another rule filtering it out before 
it hits this.


Thanks in advance
John


