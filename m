From: "John Black" <black@arbbs.net>
Subject: Re: netfilter question
Date: Thu, 19 Feb 2004 10:23:47 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4034e313.7746.0@arbbs.net>
Reply-To: black@arbbs.net
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


>
>this assumption is because you're saying 161.x.x.x/21  as destination,
>all other destinations that doesnt belong to 161.x.x.x to
>161.x.x+8.x+255 will be not nat'ed
>

right now i just have 1 class C private network.

At work i have a static class B ipaddress of 161.x.x.x/255.255.252.0 with the
private class C network 192.168.0.0/255.255.255.0

john
http://www.arbbs.net/

