From: Rodrigo Buarque Ramos <rodrigo.ramos@ipad.com.br>
Subject: What layers?
Date: Sat, 15 Mar 2003 18:33:40 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E739C34.4050207@ipad.com.br>
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
To: netfilter@lists.netfilter.org, rildo@pragana.net, rpragana@acm.org

Hi,


The Netfilter/Iptables works on what layers?

Let's talk based on OSI model

If I write a rule like IPTABLES -P INPUT DROP
Will it drop the packets on 2nd layer (link layer)?

If I write a rule like IPTABLES -A INPUT -s 10.2.1.93 -j DENY
Will it drop the packets on 3rd layer (network layer)?

If I write a rule like IPTABLES -A INPUT  -p tcp --DPORT 80  -j  REJECT
Will it drop the packets on 7th layer (application layer)?

Does it have a default layer to work?


Thank you very much,
Rodrigo Ramos


