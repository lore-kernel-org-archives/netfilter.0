From: "Eric  Vautier" <eric@richclients.org>
Subject: [IPTables] Uninitialized bitwise operations
Date: Tue, 16 Nov 2004 16:47:44 +0100
Message-ID: <042b01c4cbf3$aafe23d0$b6dc273e@ERICVAUTIER>
Reply-To: Eric  Vautier <eric@richclients.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

Hello everyone,

I'm positive this issue has been addressed earlier here or elsewhere, but I 
haven't found a conclusive explanation for why this happens or how to remedy 
it.  I believe this is the right forum to discuss it.

Logwatch keeps issuing floods of failed bitwise lookup operations in 
/etc/log.d/scripts/services/kernel:

Use of uninitialized value in bitwise or (|) at 
/etc/log.d/scripts/services/kernel line 100, <STDIN> line 1516658.
Use of uninitialized value in left bitshift (<<) at 
/etc/log.d/scripts/services/kernel line 102, <STDIN> line 1516658.
Argument "" isn't numeric in left bitshift (<<) at 
/etc/log.d/scripts/services/kernel line 102, <STDIN> line 1516658.

These started happening after I tried to block break-in attempts from some 
IPs, using IPTables DROP rules (although I'm unclear as to whether there's a 
link between the two).  The message appears to indicate that a malformed IP 
is being sent to the compIP subroutine:

sub compIP {
....my ($a1,$a2,$a3,$a4,$aval,$bval);
....
....# get numeric values for a and b
....($a1,$a2,$a3,$a4) = split /\./,$a;
....$aval = ($a1 << 24) | ($a2 << 16) | ($a3 << 8) | $a4; # line 100
....($a1,$a2,$a3,$a4) = split /\./,$b;
....$bval = ($a1 << 24) | ($a2 << 16) | ($a3 << 8) | $a4; # line 102
....
....return $aval <=> $bval;
}

I've reset (flushed) the firewall rules (-F), but still the problem 
persists.  Is this due to a versioning issue, a configuration issue, a bug, 
wrong settings?  I'm a newbye who's been wrestling with this for a little 
while and would appreciate any help.

Thanks,
Eric Vautier 



