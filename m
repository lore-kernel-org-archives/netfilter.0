From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: How to ACCEPT or DENY or DROP and also LOG in the same rule ?
Date: Thu, 4 Jul 2002 08:50:45 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020704075047.EBOJ16050.mta01-svc.ntlworld.com@there>
References: <F30rd6vbwbQdgr1KHCE00006f06@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <F30rd6vbwbQdgr1KHCE00006f06@hotmail.com>
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

On Thursday 04 July 2002 5:31 am, Orca J. wrote:

> Hi
>   I want to both DENY and LOG in the same rule ? or ACCEPT and LOG , or
> DENY and LOG

You can't put them both in the same rule, butyou can create a user-defined 
chain and jump to that:

iptables -N LOGDROP
iptables -A LOGDROP -j LOG --log-options........
iptables -A LOGDROP -j DROP

Then use that single target in your rules:

iptables -A INPUT -i eth0 -j LOGDROP

 

Antony/.

