From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: DNAT-PROBLEM
Date: Sun, 2 May 2004 18:19:46 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405021819.46139.Antony@Soft-Solutions.co.uk>
References: <20040502102004.98939.qmail@web61308.mail.yahoo.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040502102004.98939.qmail@web61308.mail.yahoo.com>
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

On Sunday 02 May 2004 11:20 am, persaie persaie wrote:

> MY NETWORK SETUP IS ......
>
>
> 192.168.1.0/24 -->>--
> 192.168.1.64-(eth1)-----router------(eth0)-192.168.5.55---((--192.168.5.0/24

What is the routing table on the web server at 192.168.5.50?

Does it know how to send packets back to 192.168.1.252?

Antony.

-- 
"The problem with television is that the people must sit and keep their eyes 
glued on a screen; the average American family hasn't time for it."

 - New York Times, following a demonstration at the 1939 World's Fair.

                                                     Please reply to the list;
                                                           please don't CC me.


