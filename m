From: Claudio Lavecchia <Claudio.Lavecchia@eurecom.fr>
Subject: iptables and wireless card in promiscuous mode
Date: Tue, 30 Nov 2004 13:53:35 +0100
Message-ID: <41AC6D4F.7000001@eurecom.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello People,

I have a little question:

I have two laptops that have 802.11 wireless cards. I am developing some 
application that essentially perform sniffing functions using wireless 
cards in promiscuous mode. To test my code, I need those two laptops not 
to "see" each other (--> I do not want the wireless card of laptop A, 
which is operating in promiscuous mode to process packets coming from 
laptop B) and I tought to do it using iptables. so on laptop A i added 
the following rule:

iptables -A INPUT -mac --mac-source MAC_ADDRESS_LAPTOP_B -j DROP

and on laptop B I added the rule:

iptables -A INPUT -mac --mac-source MAC_ADDRESS_LAPTOP_A -j DROP

I just executed my first tests and the feeling  I got is that, for 
example, the wlan card of  laptop B still passes through the packet 
coming from laptop A.

Can anyone confirm  this analysis? If I am right, can anyone give me a 
hint to possibly workaround this?

Thank you very much

Claudio

