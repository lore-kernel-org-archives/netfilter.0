From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: IRC and ident with iptables
Date: Sun, 05 Jun 2005 09:46:21 -0500
Message-ID: <42A3103D.7030702@gmx.co.uk>
References: <393114f9050605072369575137@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <393114f9050605072369575137@mail.gmail.com>
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
To: Alexander Salmin <security.member@gmail.com>
Cc: netfilter@lists.netfilter.org

Alexander Salmin wrote:
> diffrent ident. So, what I would like to know is if there is a way to
> make iptables recognize to whom it should portforward to, based of
> what internal ip that is connecting. Can it be done? If not, is there

That would be tricky, but perhaps possible using some extension of 
connection tracking ... whoever makes a new connection to an ircd is 
going to get the next ident query from that IP.

> any identd-server for Linux 2.6 that you know could do this?

This is how I'd go about it. I've seen numerous identd's listed on 
freshmeat which claim to be able to do this. It wouldn't be that 
complicated, I think: look up the connection in ip_conntrack, query the 
appropriate internal identd, give that reply to the external client.
-- 
     mail to this address is discarded unless "/dev/rob0"
     or "not-spam" is in Subject: header

