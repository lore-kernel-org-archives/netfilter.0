From: Marcelus Trojahn <trojahn@alternativa.com.br>
Subject: Logging MAC
Date: Fri, 21 May 2004 10:39:58 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5390820828.20040521103958@alternativa.com.br>
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

Folks,

  I have an outdoor wireless network and I only accept FORWARD packets
  when  the  IP  address  matchs  with  the  MAC  address I have on my
  iptables rules... (Bad english sorry)

  For example:
  iptables -j ACCEPT -A FORWARD -i eth1 -s 10.10.10.80 -m mac --mac-source 00:40:F4:93:40:82

  iptables -j LOG  -A FORWARD -i eth1 $pref "[rule 06]"
  iptables -j DROP -A FORWARD -i eth1

  Any  other  connection  that  doesn't  match  the  IP+MAC  rules are
  dropped (or at least I think it was :)).

  The  problem  is:  Recently  I noticed a large traffic (MRTG) on the
  access points that doesn't seem to match with traffic of the clients
  connected  to  it...  Looks  like  someone  are being able to bypass
  iptables  rules.  So,  I  want  to know if there is a way to the LOG
  target logs the MAC address of the connection too...

  Sorry about my english... I hope you can understand me...

-- 
Marcelus Trojahn




