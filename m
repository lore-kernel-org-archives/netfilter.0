From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: hosts.deny
Date: Mon, 8 Jul 2002 00:43:47 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020707234348.PCUD19225.mta07-svc.ntlworld.com@there>
References: <200FAA488DE0D41194F10010B597610D2BA266@JUPITER>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200FAA488DE0D41194F10010B597610D2BA266@JUPITER>
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

On Monday 08 July 2002 12:36 am, George Vieira wrote:

> spoofed as in local IP coming in from the internet..

I call that ingress filtering.

I regard spoofing as an incoming connection with a plausible but false source 
address, typically used on Denial of Service attacks, either to disguise the 
true source of the attack, and/or to cause an active IDS to block access to 
networks you really don't want to block.

 

Antony.

