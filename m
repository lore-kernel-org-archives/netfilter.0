From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: mangle table traversal
Date: Thu, 20 Jun 2002 22:17:02 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020620211704.TSSN2755.mta05-svc.ntlworld.com@there>
References: <Pine.LNX.4.30.0206201412320.7072-100000@gilgamesh.eos.SilentMedia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <Pine.LNX.4.30.0206201412320.7072-100000@gilgamesh.eos.SilentMedia.com>
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

On Thursday 20 June 2002 10:14 pm, Ben wrote:

> Interestingly, iptables 1.2.6a won't let me attach a LOG target to any of
> the output chains. I get this:
>
> bash-2.05a# iptables -t mangle -I OUTPUT -j LOG --log-prefix-OutMangle
> iptables v1.2.6a: Unknown arg `--log-prefix-OutMangle'

Sorry - my typo....

try using

iptables -t mangle -I OUTPUT -j LOG --log-prefix=OutMangle

instead :-)

 

Antony.

