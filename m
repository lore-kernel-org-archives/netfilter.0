From: "Dennis Mills" <Dennis.Mills@TrackRight.com.au>
Subject: server on firewall as well as client nat'd behind it
Date: Thu, 4 Sep 2003 21:59:15 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF3D847E8C.1368DE0F-ONCA256D97.003BA593-CA256D97.0041EBC3@trackright.com.au>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=_alternative 0041EBBDCA256D97_="
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
--=_alternative 0041EBBDCA256D97_=
Content-Type: text/plain; charset="us-ascii"

Ok, here's the situation:

firewall is running pptpd, and so needs INPUT chain rules to accept tcp 
port 1723 and gre packets.
client behind the firewall initiates an outbound pptp session to a remote 
pptp server, which the firewall masquerades.

The client pptp session fails because the inbound gre packets from the 
remote pptp server are seen by the INPUT rule that's there for the local 
pptp server, and so presumably never get to the nat table or any stateful 
inspection that would route them back to the nat'd client.
Removing the INPUT rules allows the nat'd pptp client to establish a 
connection to the remote server fine.

Is there any way to have a ruleset that will allow the local pptp server 
on the firewall to co-exist with nat'd pptp clients behind it?

Any help greatly appreciated.

Regards,

Dennis
---
Dennis Mills,   Director,   Track Right Technology Pty Ltd
Phone: +61 3 9533 0200,   Fax: +61 3 9533 0211,   Mobile: +61 414 303 429
Email: Dennis.Mills@TrackRight.com.au
Web: http://www.TrackRight.com.au
A member of CRCinabox: http://www.crcinabox.org
--=_alternative 0041EBBDCA256D97_=
Content-Type: text/html; charset="us-ascii"


<br><font size=2 face="sans-serif">Ok, here's the situation:</font>
<br>
<br><font size=2 face="sans-serif">firewall is running pptpd, and so needs INPUT chain rules to accept tcp port 1723 and gre packets.</font>
<br><font size=2 face="sans-serif">client behind the firewall initiates an outbound pptp session to a remote pptp server, which the firewall masquerades.</font>
<br>
<br><font size=2 face="sans-serif">The client pptp session fails because the inbound gre packets from the remote pptp server are seen by the INPUT rule that's there for the local pptp server, and so presumably never get to the nat table or any stateful inspection that would route them back to the nat'd client.</font>
<br><font size=2 face="sans-serif">Removing the INPUT rules allows the nat'd pptp client to establish a connection to the remote server fine.</font>
<br>
<br><font size=2 face="sans-serif">Is there any way to have a ruleset that will allow the local pptp server on the firewall to co-exist with nat'd pptp clients behind it?</font>
<br>
<br><font size=2 face="sans-serif">Any help greatly appreciated.</font>
<br>
<br><font size=2 face="sans-serif">Regards,</font>
<br>
<br><font size=2 face="sans-serif">Dennis<br>
---<br>
Dennis Mills, &nbsp; Director, &nbsp; Track Right Technology Pty Ltd<br>
Phone: +61 3 9533 0200, &nbsp; Fax: +61 3 9533 0211, &nbsp; Mobile: +61 414 303 429<br>
Email: Dennis.Mills@TrackRight.com.au<br>
Web: http://www.TrackRight.com.au<br>
A member of CRCinabox: http://www.crcinabox.org</font>
--=_alternative 0041EBBDCA256D97_=--

