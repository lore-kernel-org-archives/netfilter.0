From: Julio Cesar Ody <julioody@bol.com.br>
Subject: sendmail redirect
Date: Tue, 29 Oct 2002 09:47:05 -0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DBE7539.9020002@bol.com.br>
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

Hello. I need to redirect all mail trafic that enters a gateway to an 
email server inside the same LAN. Here's the scenario:


                 |----------------|          |----------------------|
internet <--->  | gate(10.0.0.1) |  ------  | mailserver(10.0.0.2) |
                 |----------------|          |----------------------|

"gate" is the only machine with a real ip, so, from outside this LAN, 
people will refer to it in order to fetch their email. So my question 
is: What rules do I need to use in order to make "gate" pass the mail 
tasks to "mailserver" (receive smtp/pop requests) ?  Thanks in advance.


Julio Cesar Ody


