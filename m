From: Kevin Quinn <quinn@preg.org>
Subject: >13MB netfilter forward CRASH
Date: Tue, 12 Aug 2003 11:15:53 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F3904A9.10008@preg.org>
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

Greetings.  I am not subscribed to the list yet, so please respond to my 
email address.  if this get's hairier, I'll get on the list.

I am having the exact same issue Marcel de Boer posted about last month. 
  I have a WiFi and ethernet network in the house.  traffic from them is 
forwarded along by a central linux box (redhat9) that also is connected 
to the internet via a cable modem.  I am running NAT internally to run 
off the one ip address my ISP provides.  I do plenty of filtering on the 
internet interface, but forward along anything from the inside.

I have transferred files via FTP from the internet to the linux box as 
large as 6GB.  when I try to FTP from a machine behind the linux box, 
the transfer goes fine until ~13MB then the linux box HANGS!

I do get some messages, but they happen periodically earlier in the 
transfer as well.

kernel: skb_p80211_to_ether: OTHER frame too large (1536 > 1500)
kernel: skb_p80211_to_ether: DIXII frame too large (1528 > 1500)


the same has happened from multiple boxen.  any lowly windoze box I can 
find can bring my linux box to an absolute halt.  ouch.

if it would help, I can test this with no iptables rules, but I can't 
imagine a different result.

so, did Marcel find the answer or maybe someone has other clues?

k
-- 
Kevin Lee Quinn
Technical Facilitator


