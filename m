From: "ITM CS Ruslan O. Nesterov" <ruslan@complexsystem.ru>
Subject: Re: how to delete a piece of rule in iptables?
Date: Wed, 18 Dec 2002 16:52:36 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4165816408.20021218165236@complexsystem.ru>
References: <200212181222.UAA02783@email.whu.edu.cn>
Reply-To: "ITM CS Ruslan O. Nesterov" <ruslan@complexsystem.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200212181222.UAA02783@email.whu.edu.cn>
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
To: "netfilter @ lists . netfilter . org" <netfilter@lists.netfilter.org>

Hello bobo,

Wednesday, December 18, 2002, 3:30:18 PM, you wrote:

b>              i have insert some rules to iptables firewall.now,i would 
b> like to delete it  .
b> but i only know to use iptalbes -L to empty them.
b> but it lead to delete all the rules in it.
b> how to do ??


Try to use
iptables -D INPUT 1
this will delete rule 1 in input chain

-- 
Best regards,
 ITM                            mailto:ruslan@complexsystem.ru



