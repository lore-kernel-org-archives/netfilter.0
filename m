From: Herman <Herman@AerospaceSoftware.com>
Subject: Re: Invalid friggen argument
Date: Sun, 12 Oct 2003 19:22:01 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200310121922.01492.Herman@AerospaceSoftware.com>
References: <LFEHKEBEBHAFGJBMNKAOIELHCCAA.markee@bandwidthco.com>
Reply-To: Herman@AerospaceSoftware.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <LFEHKEBEBHAFGJBMNKAOIELHCCAA.markee@bandwidthco.com>
Content-Disposition: inline
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
To: markee@bandwidthco.com, netfilter@lists.netfilter.org

On Sunday 12 October 2003 7:01 pm, Herman@aerospacesoftware.com wrote:
   I understand now.  The machines that you are DNATTING to are dynamic, and
   may or may not be on-line and listening.  The service port is Java based
   (sounds like Sun Microsystems Netlet protocol) but I gather it will always
   be the same listening port, it is just the IP that changes.  This is the
   deal:  you have an extra layer of complexity here that IPTables by nature
 is not designed to handle.  That's not to say it cannot be done.  You are
 going to need to build some dynamic variables into your script that run some
 test for active IP's upon match of the port forwarding rule.  Based on the
 test results, you can tell IPTables what where to forward.  For example,
 when the rule is encountered, you could send a Ping to all the potential
 hosts, then grab the IP of the host that responds, and then set iptables to
 DNAT to that IP.  That is just one way to accomplish this.  So, it is
 possible, but it is going to take some extra work.

Yikes - I think I'll settle for a fixed IP on one machine for starters.  That 
is proving to be enough of a headache.


   As for your modules, masquerade works off it's own specific module so it
   working is no indication of NAT working.

OK, that is beginning to make sense.  So I have to try and figure out what 
module is used for nat and see whether it is loaded.

Thanks!
-- 
Herman Oosthuysen 
B.Eng(E), MIEEE
Aerospace Software Ltd.
Ph: 1.403.241-8773, Cell: 1.403.852-5545, Fx: 1.403.241-8841
Herman@AerospaceSoftware.com, http://www.AerospaceSoftware.com

