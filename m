From: Johann Klonner <jt.klonner@aon.at>
Subject: strange ip-number
Date: Sun, 22 Sep 2002 16:28:37 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D8DD395.4070307@aon.at>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hallo
I got spam mail containing "href=http://f2m.aac.com.tw". I think, this 
mail connected with this URL. So I block ed this URL in my iptables script:
 
"iptables - A OUTPUT - o ippp0 -p tcp -d http://f2m.aac.com.tw -j REJECT"

I wanted to find out the IP number with "ping", but ping timed out 
without an answer.
iptables -L -v produced ff output:

OUTPUT ...
"211-23-43-85.HINET-IP.hinet.netreject with icmpport unreachable"

can somebody tell me the meaning of this output? Is it an odd IP-number 
or an alias of the URL above?? And why did ping time out without any 
comment such as icmpport unreachable?

Any hint would beappreciated,
Hans



