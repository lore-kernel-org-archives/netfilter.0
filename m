From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: pptp + iptables MTU ???
Date: Sun, 15 Sep 2002 12:11:11 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020915111113.OSCA14766.mta05-svc.ntlworld.com@there>
References: <20020913173529.41af8435.pulsar@bofh.homeunix.org> <3D8219B0.7070309@bewegungsmelder.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3D8219B0.7070309@bewegungsmelder.de>
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

On Friday 13 September 2002 6:00 pm, Thomas Lussnig wrote:

> Hi,
> i have one question, when TCP packet's where send the filter change the
> MTU sice (T-Error.com problem)
> But i do not acivate such an rule for UDP or GRE Protocol. Is it
> possible that this is the source for the
> problems with pptp conection over an maserading server ?

MTU applies to IP packets, not specifically to TCP packets (which are a 
particular form of data inside an IP packet).

UDP and GRE are also transported inside IP packets, so if you need to set the 
MTU on your external interface to get TCP/IP packets to work, I think you 
should do the same thing for UDP/IP and GRE/IP packets too.

Antony.

-- 

This email was created using 100% recycled electrons.

