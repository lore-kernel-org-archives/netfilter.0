From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: HTTP Port forwarding issues
Date: Mon, 8 Jul 2002 20:49:16 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020708194919.BSXL19225.mta07-svc.ntlworld.com@there>
References: <001f01c226b6$eb0a4f60$6702a8c0@internal.monstersolutions.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <001f01c226b6$eb0a4f60$6702a8c0@internal.monstersolutions.net>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

On Monday 08 July 2002 8:37 pm, Big Daddy wrote:

> all,
>      for some reason i can get my smtp and pop3 to route from the 
> internet, but i cannot get http requests to forward correctly.

Okay, so what's not working ?

Are the incoming requests not getting to the server, or is the server trying 
to do some sort of reverse DNS lookup, or is the response not getting out 
again ?

Put some LOGging rules onto your firewall to see what packets are or aren't 
flowing, or else just try

iptables -L -n -v -x
iptables -L -n -v -x -t nat

and see what packets seem to be where.

 

Antony.

