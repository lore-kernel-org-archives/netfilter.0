From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: LOG flags 0 (second post) ;-)
Date: Sat, 6 Jul 2002 12:51:08 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200207061151.g66BpE803430@vulcan.rissington.net>
References: <OF66699DD4.943C2F61-ONC1256BED.0060744D-C1256BEE.00403447@synetics.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <OF66699DD4.943C2F61-ONC1256BED.0060744D-C1256BEE.00403447@synetics.fr>
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

On Saturday 06 July 2002 12:39 pm, alexander.swann@synetics.fr wrote:

> Hello,
>
> the rule :
> $PATH -A FORWARD -d 192.168.252.0/22 -p all -s 10.1.1.0/24 -j LOG
> --log-level DEBUG --log-prefix "FWlogDMZLAN : "
>
> When I do a
> # iptables -L -v -n
>
> I get this result
> 610 29280 LOG        all  --  *      *       10.1.1.0/24
> 192.168.252.0/22   LOG flags 0 level 7 prefix `FWlogDMZLAN : '
>
> My question is :
> What meens the "flags 0" in "LOG flags 0 level 7 prefix `FWlogDMZLAN : ' "

It indicates whether you have specified any of the options --log-tcp-sequence 
--log-tcp-options or --log-ip-options in the LOG rule.   In this case, you 
haven't.

See iptables-src/extensions/libipt_LOG.c for details (look for occurrences of 
loginfo->logflags).

 

Antony.

