From: gui <whereisgui@gmail.com>
Subject: RE:Protecting multiple webservers
Date: Tue, 18 Jan 2005 08:30:31 -0800
Message-ID: <48be50bb0501180830378f6c57@mail.gmail.com>
Reply-To: gui <whereisgui@gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I'd like to thank all of you who replied to my message. I talked to
the school's IT department and they recommended the following set up:

Assign private IP addresses to web servers
Connect servers to a switch
Plug switch into the firewall.
Bind web servers' public IP addresses to the firewall's nic.

This set up does not require changes to the school's DNS server.
It sounds straight forward. So I'll give it a try.

