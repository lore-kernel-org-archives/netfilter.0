From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: OS Fingerprint
Date: Tue, 18 Nov 2003 10:57:42 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311181057.hAIAvjj22965@agate.rockstone.co.uk>
References: <Law14-F6682qhpp8eur0000b7c9@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Law14-F6682qhpp8eur0000b7c9@hotmail.com>
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

On Tuesday 18 November 2003 10:05 am, Rodre Ghorashi-Zadeh wrote:

> Hello,
>
> Does anybody on this list have a rule that I can use to change the OS
> fingerprint of all packets leaving my DMZ? Thanks in advance.

This is not a simple thing to do, it involves mucking around with the way the 
TCP/IP stack works inside the kernel, and as far as I know it can't be done 
by a router disguising another machine; it needs to be done on the machine 
itself which you are trying to disguise.

Try http://voodoo.somoslopeor.com/papers/nmap.html#LSOLUTIONS for some 
possible ways to achieve it.

Antony.

-- 

Documentation is like sex:
when it's good, it's very very good;
when it's bad, it's still better than nothing.

                                                     Please reply to the list;
                                                           please don't CC me.

