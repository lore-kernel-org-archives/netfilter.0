From: Bob Hillegas <bobhillegas@houston.rr.com>
Subject: Everyone having problems with -j DNAT...
Date: Thu, 27 Jun 2002 19:41:35 -0500 (CDT)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.44.0206271928120.1824-100000@east.rosestar.lan>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

Please, keep in mind, once you change the destination port with REDIRECT
(doesn't affect IP address) or DNAT which allows you to alter both address and 
port....

The next step for this packet is to enter the INPUT chain of the FORWARD table. 

If you don't give a rule to ACCEPT the packet, it gets whatever is your default 
policy for the FORWARD table.

Try this for seeing what goes on.

#---------------------------------------------------------------------------
# Test logging statements

if [ "$TEST_LOGGING" = "1" ]; then

$IPT -I INPUT  -j LOG --log-level INFO --log-prefix 'filter INPUT: '
$IPT -I OUTPUT  -j LOG --log-level INFO --log-prefix 'filter OUTPUT: '
$IPT -I FORWARD  -j LOG --log-level INFO --log-prefix 'filter FWD: '
$IPT -t nat -I PREROUTING  -j LOG --log-level INFO --log-prefix 'nat PRE: '
$IPT -t nat -I POSTROUTING  -j LOG --log-level INFO --log-prefix 'nat POST: '
$IPT -t nat -I OUTPUT  -j LOG --log-level INFO --log-prefix 'nat OUTPUT: '

for i in $USER_CHAINS; do
    PREFIX="${i}: "
    $IPT -I $i  -j LOG --log-level INFO --log-prefix $PREFIX
done

fi

#---------------------------------------------------------------------------

With this in your script you can turn on logging as the FIRST statement (-I) in
every chain. Gets voluminous, but can teach you what happens in your chains.
NOTE: USER_CHAINS="local-tcp-query remote-tcp-response...  etc" whatever you use
as user defined chains.


Good luck
-- 
----------------------------------
Bob Hillegas
bobhillegas@houston.rr.com



