From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ipt_string, udp, dns problem...
Date: Sun, 22 Sep 2002 13:48:26 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020922124828.EXCB27185.mta03-svc.ntlworld.com@there>
References: <1292.24.200.104.128.1032687264.squirrel@www.funio.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1292.24.200.104.128.1032687264.squirrel@www.funio.com>
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

On Sunday 22 September 2002 10:34 am, Mark Steele wrote:

> I'm currently under siege from a DOS attack which is aimed
> at my name server. I believe the culprit is spoofing
> his IP address, and sending DNS requests to various
> recursive name servers for a domain which used to be
> hosted in my servers.

Why not remove your name server from the list of name servers for that domain 
in the whois database ?   Then the recursive name servers won't come and 
expect an answer from your machine.

Antony.

-- 

There are only 10 types of people in the world:
those who understand binary notation,
and those who don't.

