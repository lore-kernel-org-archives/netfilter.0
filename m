From: Carol Anne Ogdin <caogdin@deepwoods.com>
Subject: How Do YOU Check for Link Down?
Date: Fri, 28 Mar 2003 10:04:18 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF7874B0E7.9883115A-ON88256CF7.005FB9A1-88256CF7.00634555@deepwoods.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=_alternative 0063454988256CF7_="
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org

This is a multipart message in MIME format.
--=_alternative 0063454988256CF7_=
Content-Type: text/plain; charset="us-ascii"

I have two SDSLs, and a comprehensive script that enables either (or both) 
during running of a script.  For my next iteration, I want to have a 
periodic check to see that, in fact, a link is routing packets (say, by 
pinging a known host that is known to respond), and then takes that DSL 
router out of the default list...(and then restore it later when service 
is restored).  How do YOU do that without interrupting existing 
connections that are still operating?

By way of background, here's how I check for DSL status (this is for my 
first DSL; the second is the same, but names are changed):

  # For these tests to work, there must be NO default route upon entry 
here
  DSL1up=0                  # Assume DSL link is down
  if [[ ! -e DSL1up || ! `grep 0 DSL1up` ]]; then #  Treat as down if 
contains "0"
    # Otherwise, test the connection to see if it's up
    if [ $WAN1ext != "" ]; then # Make sure the DSL link has known 
external address
     if [[ `ip link show $WAN1nic | grep ,UP` ]]; then # Do this only if 
NIC is up
        ip route add default via $WAN1gwy dev $WAN1nic  # open a temp 
default path
        if (( $debug )); then ping -c 1 -n -w 1 $WAN1ext; fi
        if [[ `ping -c 1 -n -w 1 $WAN1ext | grep "received, 0% loss"` ]]; 
then DSL1up=1; fi
        ip route del default dev $WAN1nic  # close the temp default path
      fi
    fi
  fi

Notes on the code:  The variable DSL1up reports whether the DSL circuit is apparently up and operating or 
not; the file DSL1up provides a way to force the status to be "0" (down) if necessary (for testing).
$WAN1ext is the external (provider-side) IP Address of the DSL router
$WAN1gwy is the internal gateway address of the DSL router
$WAN1nic is "eth<n>" for the appropriate Ethernet connectio to the DSL 
router
$debug is 1 for debug information to be issued.
This test only checks to see if the Ethernet connection and DSL connection 
are working up to the external DSL router address (i.e., the internal 
connections and router appear to be working).

--Carol Anne 
P.S.:  As a bash novice, I'd appreciate any comments you care to make 
about improvements I could make in this script.  --cao
Carol Anne Ogdin
http://www.net-working.com
530/295-3657
Deep Woods Technology, Inc.
http://www.deepwoods.com
CAOgdin@deepwoods.com
Leveraging technology to restore the soul of the organization

--=_alternative 0063454988256CF7_=
Content-Type: text/html; charset="us-ascii"


<br><font size=2 face="sans-serif">I have two SDSLs, and a comprehensive script that enables either (or both) during running of a script. &nbsp;For my next iteration, I want to have a periodic check to see that, in fact, a link is routing packets (say, by pinging a known host that is known to respond), and then takes that DSL router out of the default list...(and then restore it later when service is restored). &nbsp;How do YOU do that without interrupting existing connections that are still operating?</font>
<br>
<br><font size=2 face="sans-serif">By way of background, here's how I check for DSL status (this is for my first DSL; the second is the same, but names are changed):</font>
<br>
<br><font size=3 face="Courier New">&nbsp; # For these tests to work, there must be NO default route upon entry here</font>
<br><font size=3 face="Courier New">&nbsp; DSL1up=0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;# Assume DSL link is down</font>
<br><font size=3 face="Courier New">&nbsp; if [[ ! -e DSL1up || ! `grep 0 DSL1up` ]]; then # &nbsp;Treat as down if contains &quot;0&quot;</font>
<br><font size=3 face="Courier New">&nbsp; &nbsp; # Otherwise, test the connection to see if it's up</font>
<br><font size=3 face="Courier New">&nbsp; &nbsp; if [ $WAN1ext != &quot;&quot; ]; then # Make sure the DSL link has known external address</font>
<br><font size=3 face="Courier New">&nbsp; &nbsp; &nbsp;if [[ `ip link show $WAN1nic | grep ,UP` ]]; then # Do this only if NIC is up</font>
<br><font size=3 face="Courier New">&nbsp; &nbsp; &nbsp; &nbsp; ip route add default via $WAN1gwy dev $WAN1nic &nbsp;# open a temp default path</font>
<br><font size=3 face="Courier New">&nbsp; &nbsp; &nbsp; &nbsp; if (( $debug )); then ping -c 1 -n -w 1 $WAN1ext; fi</font>
<br><font size=3 face="Courier New">&nbsp; &nbsp; &nbsp; &nbsp; if [[ `ping -c 1 -n -w 1 $WAN1ext | grep &quot;received, 0% loss&quot;` ]]; then DSL1up=1; fi</font>
<br><font size=3 face="Courier New">&nbsp; &nbsp; &nbsp; &nbsp; ip route del default dev $WAN1nic &nbsp;# close the temp default path</font>
<br><font size=3 face="Courier New">&nbsp; &nbsp; &nbsp; fi</font>
<br><font size=3 face="Courier New">&nbsp; &nbsp; fi</font>
<br><font size=3 face="Courier New">&nbsp; fi</font>
<br>
<br><font size=2 face="sans-serif">Notes on the code: &nbsp;The <i>variable</i> DSL1up reports whether the DSL circuit is apparently up and operating or not; the <i>file</i> DSL1up provides a way to <i>force</i> the status to be &quot;0&quot; (down) if necessary (for testing).</font>
<br><font size=2 face="sans-serif">$WAN1ext is the external (provider-side) IP Address of the DSL router<br>
$WAN1gwy is the internal gateway address of the DSL router<br>
$WAN1nic is &quot;eth&lt;n&gt;&quot; for the appropriate Ethernet connectio to the DSL router</font>
<br><font size=2 face="sans-serif">$debug is 1 for debug information to be issued.</font>
<br><font size=2 face="sans-serif">This test only checks to see if the Ethernet connection and DSL connection are working up to the external DSL router address (i.e., the internal connections and router appear to be working).</font>
<br><font size=2 face="sans-serif"><br>
</font><font size=3 face="Times New Roman">--Carol Anne </font>
<br><font size=3 face="Times New Roman">P.S.: &nbsp;As a bash novice, I'd appreciate any comments you care to make about improvements I could make in this script. &nbsp;--cao</font>
<table>
<tr>
<td bgcolor=#ffffdd><font size=3 face="Times New Roman"><b>Carol Anne Ogdin</b></font>
<td bgcolor=#ffffdd><a href="http://www.net-working.com/"><font size=3 color=blue face="Times New Roman"><b><u>http://www.net-working.com</u></b></font></a>
<td bgcolor=#ffffdd><font size=3 face="Times New Roman"><b>530/295-3657</b></font>
<tr>
<td bgcolor=#ffffdd><font size=3 face="Times New Roman"><b>Deep Woods Technology, Inc.</b></font>
<td bgcolor=#ffffdd><a href=http://www.deepwoods.com/><font size=3 color=blue face="Times New Roman"><b><u>http://www.deepwoods.com</u></b></font></a>
<td bgcolor=#ffffdd><font size=3 face="Times New Roman"><b>CAOgdin@deepwoods.com</b></font>
<tr>
<td colspan=3 bgcolor=#ffffdd><font size=3 face="Times New Roman">Leveraging technology to restore the soul of the organization</font></table>
<br>
--=_alternative 0063454988256CF7_=--

