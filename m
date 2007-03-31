From: gabrix <sickuser@gmail.com>
Subject: only checking if i make correct custom chains
Date: Sat, 31 Mar 2007 15:39:44 +0200
Message-ID: <460E64A0.2040000@gabrix.ath.cx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:received:message-id:date:user-agent:mime-version:to:subject:x-enigmail-version:content-type:content-transfer-encoding:from;
	b=WFGZa/HxcFhL3wBwtJbHvxjblvSmhBW5uqo5nqBuvQkls01ozDr0nHo/RLdInH89wdAEXSbB+OqImPxCYBodnSdvuDiNDCPTymhxM+19+HsUrXvL7mCjsYAV5BrYFUaaso67FreYEWBTB6/MROvRy7FhJAVkEGzMA2OYjot2mpg=
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I only want to see if i interpret iptables custom chains correctly .In
this chain EXAMPLE i want to build a jump that make various things.This
is an example :
IPT=/sbin/iptables
$IPT -N EXAMPLE
$IPT -A EXAMPLE -p tcp --dport 80 -j ACCEPT
$IPT -A EXAMPLE -p tcp --dport 1:65535 DROP
$IPT -A EXAMPLE -p udp --dport 1024:65535 -j DROP
$IPT -A EXAMPLE -p icmp --icmp-type any -j ULOG --ulog-prefix
"DROPPED_ICMP :"
$IPT -A EXAMPLE -p icmp --icmp-type any -j DROP
$IPT -I INPUT -i eth0 -p all -d Myhost -j EXAMPLE
Is all this correct ???? i want for the jump EXAMPLE to accept tcp
connections on port 80 , drop all others , drop all udp on unprivileged
ports , ulog all icmp and than drop them all in one jump and that is
going to happen first of all "I".I'd correct ?Thanks for the attenction !!!

-- 
http://tor.gabrix.ath.cx


