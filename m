From: Glen Spidal <glens@cybercorpinc.com>
Subject: Netfilter and Squid
Date: Tue, 27 Jan 2004 09:41:44 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.2.1.1.0.20040127093418.029803f0@mail.cybercorpinc.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello all,

I have the following setup:

Internet->PublicIP_Router->Cross-over-cable->Squid_Server->LAN

Squid works fine as does Dans' Guardian web filter.  MY question is what do 
I need to do to route web traffic through squid and allow email traffic to 
flow around Squid?  Currently, client-based email (Outlook and Entourage) 
does not work because there is no route.  I must make sure that all LAN 
clients go through squid since it is a school.

I've looked through the how-to's but have not found specific examples and 
syntax.


Glen Spidal
Cybercorp Computers
Hillsboro, OR 97123
PH: 503-681-9786  -- FX: 503-615-2936
glens@cybercorpinc.com  -- www.cybercorpinc.com 


