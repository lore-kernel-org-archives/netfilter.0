From: ATest@sbsdk12.org (Coutts, Ashe (Testing Account))
Subject: Linux with NAT -- Also needing web access to postgres on same box
Date: Fri, 22 Nov 2002 10:26:29 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DDE0655.3406.2E6F78CF@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
Content-description: Mail message body
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

I am using RedHat 7.3 with iptables 1.2.6a, 
Apache 1.3.27 compiled with PHP 4.2.3 and mod_perl 1.27, 
and running postgresql.

I want to access data stored within postgresql from a php script.
The exact line used for connection to postgresql is this:
$database = pg_connect ("host=localhost  user=postgres  dbname=xbase");

If I temporarily reset the NAT process all is good, i.e. a web page displays with 
the data correctly extracted from postgresql.

Alas, when the system is functioning in its normal, NAT, mode I get the 
following error message rather than the correct web page display:

=====  Begin web error message =======
Warning: pg_connect() unable to connect to PostgreSQL server: 
         could not connect to server: Connection timed out 
         Is the server running on host localhost and accepting 
         TCP/IP connections on port 5432? in 
         /usr/www/site.admin/htdocs/sasixp/DPHS.php on line 21
An error occured with the connection.
=====  End web error message =======

My thought is that a few correct addition(s) to my iptables script should allow 
the internal connection to postgresql.

Unfortuneately, I don't yet have the skill to determine what those line(s) should 
be.

Any help and or suggestions would be very much appreciate and, I'm sure, 
instructive.
THANKS
 
====== Begin current script for NAT ========
# Nat Reset 
/sbin/iptables --flush  INPUT
/sbin/iptables --policy INPUT ACCEPT
/sbin/iptables --flush  FORWARD
/sbin/iptables --policy FORWARD ACCEPT
/sbin/iptables --flush  OUTPUT
/sbin/iptables --policy OUTPUT ACCEPT

/sbin/iptables --table nat --flush  PREROUTING
/sbin/iptables --table nat --policy PREROUTING ACCEPT
/sbin/iptables --table nat --flush  POSTROUTING
/sbin/iptables --table nat --policy POSTROUTING ACCEPT
/sbin/iptables --table nat --flush  OUTPUT
/sbin/iptables --table nat --policy OUTPUT ACCEPT

# Nat SetUp
/sbin/iptables   --table nat  --flush  POSTROUTING
/sbin/iptables   --table nat  --policy POSTROUTING DROP
/sbin/iptables   --table nat   \
                        --append POSTROUTING \
                        --source 172.16.0.0/16 \
                        --jump SNAT \
                        --to 204.48.xxx.yyyI

echo 1 > /proc/sys/net/ipv4/ip_forward
====== End current script for NAT ========

"Experience is not what happens to you, it
 is what you do with what happens to you"
       -- Aldous Huxley (1894-1963)

   Ashe Coutts (ashe@sbceo.k12.ca.us)
   805.963.7751 Ext 260
   Fax 805.884.1557


