From: Ronny Fauth <jadefalkner@imperium-noctem.de>
Subject: Re: Problems with Portforwarding -- Loopback problems---
Date: Tue, 16 Mar 2004 17:18:26 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <405728D2.5010603@imperium-noctem.de>
References: <405624A2.60906@imperium-noctem.de> <200403152159.27405.Antony@Soft-Solutions.co.uk> <40562EC9.5050604@imperium-noctem.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40562EC9.5050604@imperium-noctem.de>
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

I've found out what the Problem is, well i tried to connect to my other
Computer  at my homenetwork via Inet, well it looks like this

Test --> Router/Gateway ---> Inet --> Router/Gateway --> Test2

and this isn't acceptet by my Gateway... connections from outside my
network are redirected properly. Well, how cann i tell my Router/Gateway 
that
it should accept Loopback's ?

