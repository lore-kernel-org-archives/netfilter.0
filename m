From: Marcelus Trojahn <trojahn@alternativa.com.br>
Subject: CONNMARK on kernel 2.6.5
Date: Fri, 14 May 2004 10:41:22 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7289447203.20040514104122@alternativa.com.br>
Reply-To: Marcelus Trojahn <trojahn@alternativa.com.br>
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
To: netfilter@lists.netfilter.org

Hi,

  I  recently  installed a new server using kernel 2.6.5 and I need to
  control the bandwidth of peer-to-peer programs like Kazaa...

  I  already  do  that on another server and just copied the script to
  the new one. Here is an example:

  # iptables -t mangle -A PREROUTING -s 192.168.0.1 -j CONNMARK --set-mark 1
  iptables: Invalid argument

  I am using the last stable version on iptables and POM.

  What am I doing wrong?

-- 
Marcelus Trojahn




