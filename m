From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Nat OUTPUT chain
Date: Sun, 16 Jun 2002 00:59:56 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206152359.g5FNxwA32623@Networker.rockstone.co.uk>
References: <OE35qimrMh0R1hY55Zo00015235@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <OE35qimrMh0R1hY55Zo00015235@hotmail.com>
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

On Sunday 16 June 2002 12:57 am, hard__ware wrote:

> the  -t nat OUTPUT  table seems to work fine for me
>
> i have set up DNAT aswell as ACCEPT Rules
>
> (as i have a Default Policy of DROP,  IPTABLES -P -t  nat OUTPUT DROP  )

Why do you DROP in the nat table instead of the filter table ?

 

Antony.

