From: "Francisco Garcia Guillen" <Paco.Garcia@carm.es>
Subject: Problems with LOGS in iptables (Help Please)
Date: Wed, 23 Jul 2003 13:45:09 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OFF4AC81DF.42A2B9F1-ONC1256D6C.00400FCC@carm.es>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=_alternative 0040F63EC1256D6C_="
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

Este es un mensaje de varios componentes en formato MIME.
--=_alternative 0040F63EC1256D6C_=
Content-Type: text/plain; charset="us-ascii"

Hi all,

The rules of iptables work fine but I can't obtain log messages from 
iptables. 

With fwbuilder I mark all rules with LOG option. 

The generated script has this flag: "-j LOG --log-level 6 --log-prefix 
"RULE 0 --ACCEPT " --log-tcp-sequence --log-tcp-options --log-ip-options" 
with each rule
The klogd is running
The syslogd is running
The syslog.conf is correctly configured
 ... but the logs not appear in /var/log/messages file

I have:
redhat 8.0
kernel 2.4.20
iptables v1.2.6a

What happen ?

Thanks in advance

PD: Sorry for the tarzanian english 
:-)
--=_alternative 0040F63EC1256D6C_=
Content-Type: text/html; charset="us-ascii"


<br><font size=2 face="sans-serif">Hi all,</font>
<br>
<br><font size=2 face="sans-serif">The rules of iptables work fine but I can't obtain log messages from iptables. </font>
<br>
<br><font size=2 face="sans-serif">With fwbuilder I mark all rules with LOG option. </font>
<br>
<br><font size=2 face="sans-serif">The generated script has this flag: &quot;-j LOG --log-level 6 --log-prefix &quot;RULE 0 --ACCEPT &quot; --log-tcp-sequence --log-tcp-options --log-ip-options&quot; with each rule</font>
<br><font size=2 face="sans-serif">The klogd is running</font>
<br><font size=2 face="sans-serif">The syslogd is running</font>
<br><font size=2 face="sans-serif">The syslog.conf is correctly configured</font>
<br><font size=2 face="sans-serif">&nbsp;... but the logs not appear in /var/log/messages file</font>
<br>
<br><font size=2 face="sans-serif">I have:</font>
<br><font size=2 face="sans-serif">redhat 8.0</font>
<br><font size=2 face="sans-serif">kernel 2.4.20</font>
<br><font size=2 face="sans-serif">iptables v1.2.6a</font>
<br>
<br><font size=2 face="sans-serif">What happen ?</font>
<br>
<br><font size=2 face="sans-serif">Thanks in advance</font>
<br>
<br><font size=2 face="sans-serif">PD: Sorry for the tarzanian english </font>
<br><font size=2 face="sans-serif">:-)</font>
--=_alternative 0040F63EC1256D6C_=--

