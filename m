From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: HELP - how to block a specific ip
Date: Sat, 22 Jun 2002 08:35:43 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020622073546.JWKB19225.mta07-svc.ntlworld.com@there>
References: <3CE02CD9.CC9BC3E2@attbi.com> <200205132126.g4DLQXR03194@Networker.rockstone.co.uk> <3D13FC27.5050406@attbi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <3D13FC27.5050406@attbi.com>
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
To: netfilter <netfilter@lists.samba.org>

On Saturday 22 June 2002 5:25 am, Robert La Ferla wrote:

> Thanks again for your help.  I have a question.  If I wanted to block
> 11.22.33.xx (all 256 ips) from accessing my system, what command would I
> use?
>
> Is this correct?
>
> iptables -A INPUT -s 11.22.33.0/24 -j DROP

Yes.

Make sure you put it before any other rules which might allow the packets 
through.

 

Antony.

